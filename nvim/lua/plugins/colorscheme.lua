  return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
          bold_keywords = true,
          italic_comments = true,
          transparent = {
            bg = true,
            float = true,
          },
          bright_border = true,
          reduced_blue = false,
          swap_backgrounds = false,
          cursorline = {
            bold = true,
            bold_number = true,
            theme = 'dark',
          },
        })
        vim.cmd.colorscheme("nordic")
    end
  }
