return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "gotmpl" },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { 'html', 'css', 'javascript' },
  },
}
