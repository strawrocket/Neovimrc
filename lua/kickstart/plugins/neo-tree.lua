-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle position=right<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  config = function()
    require('neo-tree').setup {
      source_selector = {
        winbar = true, -- toggle to show selector on winbar
        statusline = false, -- toggle to show selector on statusline
        show_scrolled_off_parent_node = false, -- boolean
        sources = { -- table
          {
            source = 'filesystem', -- string
            display_name = ' 󰉓 Files ', -- string | nil
          },
          {
            source = 'buffers', -- string
            display_name = ' 󰈚 Buffers ', -- string | nil
          },
          {
            source = 'git_status', -- string
            display_name = ' 󰊢 Git ', -- string | nil
          },
        },
        content_layout = 'start', -- string
        tabs_layout = 'equal', -- string
        truncation_character = '…', -- string
        tabs_min_width = nil, -- int | nil
        tabs_max_width = nil, -- int | nil
        padding = 0, -- int | { left: int, right: int }
        separator = { left = '▏', right = '▕' }, -- string | { left: string, right: string, override: string | nil }
        separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
        show_separator_on_edge = false, -- boolean
        highlight_tab = 'NeoTreeTabInactive', -- string
        highlight_tab_active = 'NeoTreeTabActive', -- string
        highlight_background = 'NeoTreeTabInactive', -- string
        highlight_separator = 'NeoTreeTabSeparatorInactive', -- string
        highlight_separator_active = 'NeoTreeTabSeparatorActive', -- string
      },
    }
  end,
}
