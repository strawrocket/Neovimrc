return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,

    opts = function()
      return {
        separator = ' ',
        highlight = true,
        depth_limit = 5,
        icons = require('nvim-web-devicons').get_icons(),
        lazy_update_context = true,
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enabled = true,
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'moonfly',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          disabled_filetpes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = {
            'mode',
            {
              'fileformat',
              -- symbols = {
              --   unix = '', -- e712
              --   dos = '', -- e70f
              --   mac = '', -- e711
              -- },
            },
          },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename', 'navic' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location', require('recorder').recordingStatus },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
  {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { '<C-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', desc = 'Go to buffer 1' },
      { '<C-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', desc = 'Go to buffer 2' },
      { '<C-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', desc = 'Go to buffer 3' },
      { '<C-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', desc = 'Go to buffer 4' },
      { '<C-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', desc = 'Go to buffer 5' },
      { '<C-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', desc = 'Go to buffer 6' },
      { '<C-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', desc = 'Go to buffer 7' },
      { '<C-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', desc = 'Go to buffer 8' },
      { '<C-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', desc = 'Go to buffer 9' },
      { '<S-l>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
      { '<A-S-l>', '<Cmd>BufferLineMoveNext<CR>', desc = 'Move buffer right' },
      { '<A-S-h>', '<Cmd>BufferLineMovePrev<CR>', desc = 'Move buffer left' },
    },
    opts = function()
      return {
        options = {
          diagnostics = 'nvim_lsp', -- | "nvim_lsp" | "coc",
          -- separator_style = "", -- | "thick" | "thin" | "slope" | { 'any', 'any' },
          -- separator_style = { '', '' }, -- | "thick" | "thin" | { 'any', 'any' },
          separator_style = 'slant', -- | "thick" | "thin" | { 'any', 'any' },
          indicator = {
            -- icon = " ",
            -- style = 'icon'n,
            style = 'underline',
          },
          themeable = true,
          close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
          diagnostics_indicator = function(count, _, _, _)
            if count > 9 then
              return '9+'
            end
            return tostring(count)
          end,
          buffer_close_icon = '󰅖',
          modified_icon = '● ',
          close_icon = ' ',
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'EXPLORER',
              text_align = 'center',
            },
            {
              filetype = 'NvimTree',
              text = 'EXPLORER',
              text_align = 'center',
            },
          },
          hover = {
            enabled = true,
            delay = 0,
            reveal = { 'close' },
          },
        },
      }
    end,
  },
  -- floating file name
  {
    'b0o/incline.nvim',
    dependencies = { 'craftzdog/solarized-osaka.nvim' },
    event = 'BufReadPre',
    priority = 1200,
    config = function()
      local colors = require('solarized-osaka.colors').setup()
      require('incline').setup {
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if vim.bo[props.buf].modified then
            filename = '[+] ' .. filename
          end

          local icon, color = require('nvim-web-devicons').get_icon_color(filename)
          return { { icon, guifg = color }, { ' ' }, { filename } }
        end,
      }
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    name = 'colorizer',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'rebelot/heirline.nvim',
    event = 'UIEnter',
    enabled = false,
    dependencies = { 'rose-pine/neovim', 'lewis6991/gitsigns.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      local ok, heirline = pcall(require, 'heirline')
      if not ok then
        print 'Error: Failed to load heirline.nvim'
        return
      end
      local ok_config, config = pcall(require, 'custom.plugins.heirline')
      if not ok_config or not config.config then
        print 'Error: Failed to load or find config in custom.plugins.heirline'
        return
      end
      config.config()
    end,
  },
}
