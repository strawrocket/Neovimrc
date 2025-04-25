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
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
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
          separator_style = { '', '' }, -- | "thick" | "thin" | { 'any', 'any' },
          -- separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
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
  -- {
  --   'nanozuki/tabby.nvim',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     local theme = {
  --       -- this is carbonfox theme
  --       fill = 'TabLineFill',
  --       head = { fg = '#75beff', bg = '#1c1e26', style = 'italic' },
  --       current_tab = { fg = '#1c1e26', bg = '#75beff', style = 'italic' },
  --       tab = { fg = '#c5cdd9', bg = '#1c1e26', style = 'italic' },
  --       win = { fg = '#1c1e26', bg = '#75beff', style = 'italic' },
  --       tail = { fg = '#75beff', bg = '#1c1e26', style = 'italic' },
  --     }
  --
  --     require('tabby.tabline').set(function(line)
  --       return {
  --         {
  --           { '  ', hl = theme.head },
  --           line.sep('', theme.head, theme.fill),
  --         },
  --         line.tabs().foreach(function(tab)
  --           local hl = tab.is_current() and theme.current_tab or theme.tab
  --
  --           -- remove count of wins in tab with [n+] included in tab.name()
  --           local name = tab.name()
  --           local index = string.find(name, '%[%d')
  --           local tab_name = index and string.sub(name, 1, index - 1) or name
  --
  --           -- indicate if any of buffers in tab have unsaved changes
  --           local modified = false
  --           local win_ids = require('tabby.module.api').get_tab_wins(tab.id)
  --           for _, win_id in ipairs(win_ids) do
  --             if pcall(vim.api.nvim_win_get_buf, win_id) then
  --               local bufid = vim.api.nvim_win_get_buf(win_id)
  --               if vim.api.nvim_buf_get_option(bufid, 'modified') then
  --                 modified = true
  --                 break
  --               end
  --             end
  --           end
  --
  --           return {
  --             line.sep('', hl, theme.fill),
  --             tab_name,
  --             modified and '',
  --             line.sep('', hl, theme.fill),
  --             hl = hl,
  --             margin = ' ',
  --           }
  --         end),
  --         line.spacer(),
  --         {
  --           line.sep('', theme.tail, theme.fill),
  --           { '  ', hl = theme.tail },
  --         },
  --         hl = theme.fill,
  --       }
  --     end)
  --   end,
  -- },
}
