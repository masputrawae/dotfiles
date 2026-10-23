local root_files = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1]) or vim.fn.getcwd()

---@type vim.lsp.Config
local M = {}

M.cmd = { "tsc", "--lsp", "--stdio" }
M.filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
M.root_dir = root_dir

return M
