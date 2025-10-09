return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,
  init = function()
    local function rust_on_attach(client, bufnr)
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = 'Rust: ' .. desc })
      end

      map('n', 'K', function()
        if client.server_capabilities.hoverProvider then
          vim.cmd.RustLsp { 'hover', 'actions' }
        else
          vim.lsp.buf.hover()
        end
      end, 'Hover actions')

      map({ 'n', 'x' }, '<leader>ra', function()
        vim.cmd.RustLsp('codeAction')
      end, 'Code actions')

      map('n', '<leader>rr', function()
        vim.cmd.RustLsp('runnables')
      end, 'Run target')

      map('n', '<leader>rt', function()
        vim.cmd.RustLsp('testables')
      end, 'Run tests')

      map('n', '<leader>rd', function()
        vim.cmd.RustLsp('debuggables')
      end, 'Debug target')

      map('n', '<leader>re', function()
        vim.cmd.RustLsp('expandMacro')
      end, 'Expand macro')

      map('n', '<leader>ro', function()
        vim.cmd.RustLsp('openDocs')
      end, 'Open docs')

      map('n', '<leader>rO', function()
        vim.cmd.RustLsp('openCargo')
      end, 'Open Cargo.toml')

      map('n', '<leader>rR', function()
        vim.cmd.RustLsp('reloadWorkspace')
      end, 'Reload workspace')

      if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        local ok = pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
        if not ok then
          pcall(vim.lsp.inlay_hint, bufnr, true)
        end
      end

      if client.server_capabilities.documentFormattingProvider then
        local group = vim.api.nvim_create_augroup('RustLspFormat' .. bufnr, { clear = true })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { bufnr = bufnr, async = false }
          end,
        })
      end
    end

    vim.g.rustaceanvim = {
      tools = {
        float_win_config = {
          border = 'rounded',
          auto_focus = true,
        },
      },
      server = {
        on_attach = rust_on_attach,
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
            },
            check = {
              command = 'clippy',
            },
            diagnostics = {
              experimental = {
                enable = true,
              },
            },
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
              closureReturnTypeHints = { enable = 'always' },
              lifetimeElisionHints = {
                enable = 'always',
                useParameterNames = true,
              },
              parameterHints = { enable = false },
              reborrowHints = { enable = 'always' },
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
            lens = {
              enable = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    }
  end,
}
