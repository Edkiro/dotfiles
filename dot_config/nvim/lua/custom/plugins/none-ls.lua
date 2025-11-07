return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        -- configure sources like formatting, diagnostics here, for example:
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
        },
      }
    end,
  },
}
