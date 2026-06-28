return {
  'neovim/nvim-lspconfig',
  -- If you have a package that installs harperls binary, add it here, e.g.:
  -- dependencies = { "williamboman/mason-lspconfig.nvim" },

  -- The 'config' function runs when the plugin is loaded
  config = function()
    -- 1. Define the custom server configuration
    vim.lsp.config.harperls = {
      default_config = {
        cmd = { 'harper_ls' },
        filetypes = { 'markdown', 'text' },
        root_dir = require('lspconfig.util').find_git_ancestor,
        settings = {},
      },
      docs = {
        description = 'Language server for Harper.',
      },
    }

    -- 2. Set up the server with the conditional on_attach function
    require('lspconfig').harperls.setup {
      on_attach = function(client, bufnr)
        if client.name == 'harper_ls' then
          local filetype = vim.bo[bufnr].filetype

          -- Check if the filetype is NOT 'markdown' and NOT 'text'
          if filetype ~= 'markdown' and filetype ~= 'text' then
            client.handlers['textDocument/publishDiagnostics'] = function() end
          end
        end
      end,
    }
  end,
}
