-- ~/.config/nvim/lua/config/options.lua
-- Opsi global Neovim – diatur sebelum plugin lain dimuat

local opt = vim.opt

-- ============================================================
--  Leader Keys
-- ============================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================
--  Tampilan Umum & UX
-- ============================================================
opt.number          = true    -- nomor baris absolut di baris saat ini
opt.relativenumber  = true    -- nomor baris relatif (memudahkan lompat)
opt.signcolumn      = "yes"   -- kolom untuk git signs, LSP diagnostics
opt.showmode        = false   -- matikan "-- INSERT --" (pakai statusline)
opt.cursorline      = true    -- highlight baris kursor
opt.termguicolors   = true    -- dukungan true color (warna lebih kaya)
opt.pumheight       = 10      -- maksimal item di popup completion
opt.conceallevel    = 0       -- jangan sembunyikan teks (0 = tampilkan semua)

-- ============================================================
--  Indentasi & Tab
-- ============================================================
opt.tabstop        = 2        -- satu tab = 2 spasi
opt.shiftwidth     = 2        -- indentasi otomatis 2 spasi
opt.expandtab      = true     -- ubah tab jadi spasi
opt.smartindent    = true     -- indentasi pintar setelah newline
opt.autoindent     = true     -- salin indentasi dari baris sebelumnya

-- ============================================================
--  Pencarian
-- ============================================================
opt.ignorecase     = true     -- abaikan besar/kecil huruf
opt.smartcase      = true     -- case-sensitive jika ada huruf besar
opt.hlsearch       = false    -- jangan highlight semua hasil pencarian
opt.incsearch      = true     -- lompat sambil mengetik pola

-- ============================================================
--  Scroll & Posisi Kursor
-- ============================================================
opt.scrolloff      = 8        -- minimal 8 baris di atas/bawah kursor
opt.sidescrolloff  = 8        -- minimal 8 kolom di kiri/kanan kursor
opt.scrolljump     = 1        -- lompatan scroll minimal (lebih halus)

-- ============================================================
--  Clipboard & Riwayat Undo
-- ============================================================
opt.clipboard      = "unnamedplus"   -- sinkron clipboard sistem (Linux/macOS)
opt.undofile       = true            -- simpan undo lintas sesi
opt.undolevels     = 10000           -- jumlah perubahan yang bisa di-undo
opt.swapfile       = false           -- matikan file .swp (aman dengan undofile)
opt.backup         = false           -- matikan file backup

-- ============================================================
--  Performa & Responsivitas
-- ============================================================
opt.updatetime     = 250       -- cepat untuk event CursorHold (LSP, dll.)
opt.timeoutlen     = 300       -- jeda menunggu input keymap sequence
opt.ttimeoutlen    = 10        -- jeda untuk kode escape terminal
opt.mouse          = "a"       -- mouse aktif di semua mode

-- ============================================================
--  Pembagian Window
-- ============================================================
opt.splitright     = true      -- vertikal: window baru di kanan
opt.splitbelow     = true      -- horizontal: window baru di bawah

-- ============================================================
--  Pembungkusan Baris (Line Wrap)
-- ============================================================
opt.wrap           = false     -- jangan wrap otomatis (kode biasanya panjang)
opt.linebreak      = true      -- jika wrap, putus di spasi/kata
opt.breakindent    = true      -- indentasi baris yang di-wrap

-- ============================================================
--  Folding
-- ============================================================
opt.foldmethod     = "expr"
opt.foldexpr       = "nvim_treesitter#foldexpr()"
opt.foldlevel      = 99        -- buka semua fold secara default

-- ============================================================
--  Pelengkap (Opsional)
-- ============================================================
opt.completeopt    = { "menuone", "noselect" } -- tampil menu walau 1 item, jangan pilih otomatis
opt.shortmess:append({ W = true, I = true, c = true }) -- kurangi notifikasi
opt.fillchars      = { foldopen = "", foldclose = "" } -- ikon fold modern

