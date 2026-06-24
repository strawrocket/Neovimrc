return {
  {
    'R-nvim/R.nvim',
    lazy = false,
    config = function()
      ---@type RConfigUserOpts
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, 'n', '<Enter>', '<Plug>RDSendLine', {})
            vim.api.nvim_buf_set_keymap(0, 'v', '<Enter>', '<Plug>RSendSelection', {})
          end,
        },
        R_args = { '--quiet', '--no-save' },
        min_editor_width = 72,
        rconsole_width = 78,
        clear_console = true,

        -- Native Horizontal Stacking Logic:
        split_vertical = false, -- Forces all splits to slice horizontally
        objbr_place = 'console,right', -- With vertical disabled, 'right' maps to 'top/above'
        objbr_h = 12, -- Dictates the top pane height rows

        objbr_mappings = {
          c = 'class',
          ['<localleader>rg'] = 'head({object}, n = 15)',
          v = function()
            require('r.browser').toggle_view()
          end,
        },
        disable_cmds = {
          'RCustomStart',
          'RSPlot',
          'RSaveClose',
        },
      }
      if vim.env.R_AUTO_START == 'true' then
        opts.auto_start = 'on startup'
        opts.objbr_auto_start = true
      end
      require('r').setup(opts)
    end,
  },
}
