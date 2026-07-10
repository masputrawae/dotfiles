-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Umum & UX
opt.number = true         -- nomor baris
opt.relativenumber = true -- nomor relatif
opt.signcolumn = "yes"    -- kolom buat git signs, LSP diagnostics
opt.showmode = false      -- matiin -- INSERT -- karena statusline sudah nunjukin

-- Indent & Tab
opt.tabstop = 2        -- 2 spasi = 1 tab
opt.shiftwidth = 2     -- indentasi 2 spasi
opt.expandtab = true   -- tab jadi spasi
opt.smartindent = true -- indent pintar pas enter

-- Search
opt.ignorecase = true -- search tidak case-sensitive
opt.smartcase = true  -- kalau ada huruf besar → jadi case-sensitive
opt.hlsearch = false  -- jangan highlight semua hasil search
opt.incsearch = true  -- incremental search

-- Scroll & Cursor
opt.scrolloff = 8     -- minimal 8 baris di atas/bawah cursor
opt.sidescrolloff = 8
opt.cursorline = true -- highlight baris cursor

-- Clipboard & Undo
opt.clipboard = "unnamedplus" -- sync dengan sistem clipboard
opt.undofile = true           -- undo permanen meski tutup file
opt.swapfile = false          -- matiin swapfile
opt.backup = false            -- matiin backup file

-- Performance & UI modern
opt.termguicolors = true -- true color support
opt.updatetime = 250     -- cepat buat CursorHold event
opt.timeoutlen = 300     -- waktu tunggu keymap sequence
opt.mouse = "a"          -- mouse aktif semua mode

-- Window splitting
opt.splitright = true
opt.splitbelow = true

-- Line wrap
opt.wrap = false       -- jangan wrap line panjang
opt.linebreak = true   -- wrap pintar di spasi/kata
opt.breakindent = true -- indent pas wrap

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

return {} 
