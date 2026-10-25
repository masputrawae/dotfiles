# Catatan Perbaikan Binary `htmx-lsp` (Opsi 2)

Dokumen ini mencatat bug internal pada binary `htmx-lsp` (ThePrimeagen v0.1.0) dan langkah-langkah untuk melakukan patch serta kompilasi ulang menggunakan Rust/Cargo jika ingin meninjau atau menerapkannya di lain waktu.

---

## 1. Masalah Teknis (Root Cause)

- **Lokasi Sumber**: `~/.cargo/registry/src/index.crates.io-*/htmx-lsp-server-0.1.0/src/lib.rs` (baris 104–106)
- **File Handler**: `~/.cargo/registry/src/index.crates.io-*/htmx-lsp-server-0.1.0/src/handle.rs` (baris 123–144)

### Analisis Alur Kode:
Ketika editor (Neovim) mengirim request `textDocument/completion` untuk token yang bukan atribut HTMX (misalnya saat mengetik atribut standar `class`, `id`, atau singkatan Emmet seperti `div.container`):
1. `handle.rs` mengecek apakah nama atribut diawali dengan `hx-`. Jika tidak, fungsi mengembalikan `None`.
2. Di loop utama pesan LSP (`lib.rs`), hasil `None` ditangani dengan:
   ```rust
   match result {
       Some(HtmxResult::AttributeCompletion(c)) => {
           // kirim pesan Response JSON-RPC dengan id request
       }
       Some(HtmxResult::AttributeHover(hover_resp)) => {
           // kirim pesan Response hover
       }
       None => continue, // ⚠️ BUG FATAL
   }
   ```
3. Sesuai spesifikasi **JSON-RPC 2.0 / LSP**, setiap *Request* yang memiliki `id` dari client **wajib** dijawab dengan *Response* yang memiliki `id` yang sama (meskipun hasilnya kosong `result: []` atau `result: null`).
4. Karena `None => continue`, `htmx-lsp` membuang request tersebut tanpa mengirim byte balasan apapun. Client (Neovim & Blink.cmp) akan menunggu tanpa batas atau hingga timeout, sehingga autocompletion dari server lain (`html`, `emmet`, `tailwindcss`) ikut terhenti / macet.

---

## 2. Solusi Patching di Rust

Untuk memperbaikinya secara permanen di tingkat binary, `lib.rs` harus mengirim response kosong dengan `id` request terkait ketika `result` bernilai `None` atau request completion tidak memiliki item.

### Contoh Diff Patch pada `htmx-lsp-server/src/lib.rs`:

```diff
--- a/src/lib.rs
+++ b/src/lib.rs
@@ -60,6 +60,7 @@ fn main_loop(connection: Connection, params: serde_json::Value) -> Result<()> {
         error!("connection received message: {:?}", msg);
+        let req_id = match &msg {
+            Message::Request(req) => Some(req.id.clone()),
+            _ => None,
+        };
         let result = match msg {
             Message::Notification(not) => handle_notification(not),
             Message::Request(req) => handle_request(req),
@@ -102,7 +103,17 @@ fn main_loop(connection: Connection, params: serde_json::Value) -> Result<()> {
                     error: None,
                 }))
             }
-            None => continue,
+            None => {
+                if let Some(id) = req_id {
+                    // Balas dengan response kosong sesuai standar JSON-RPC agar client tidak hang
+                    connection.sender.send(Message::Response(Response {
+                        id,
+                        result: Some(serde_json::json!({ "isIncomplete": false, "items": [] })),
+                        error: None,
+                    }))
+                } else {
+                    continue;
+                }
+            }
         } {
             Ok(_) => {}
             Err(e) => error!("failed to send response: {:?}", e),
```

---

## 3. Langkah Kompilasi Ulang (Reinstall)

Jika ingin mengompilasi versi yang sudah di-patch:

1. Clone repositori resmi atau salin folder dari registry cargo:
   ```bash
   git clone https://github.com/ThePrimeagen/htmx-lsp.git /tmp/htmx-lsp
   cd /tmp/htmx-lsp
   ```
2. Terapkan perubahan pada `crates/htmx-lsp-server/src/lib.rs` (atau `src/lib.rs` tergantung versi monorepo).
3. Install binary hasil patch ke environment cargo:
   ```bash
   cargo install --path . --force
   ```
4. Salin / buat symlink binary hasil kompilasi ke direktori Mason:
   ```bash
   cp ~/.cargo/bin/htmx-lsp ~/.local/share/nvim/mason/bin/htmx-lsp
   ```
5. Restart Neovim.
