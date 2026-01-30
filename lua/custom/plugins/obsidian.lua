return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  opts = {
    legacy_commands = false,

    workspaces = {
      {
        name = 'Medicine',
        path = '/Users/abeersud/Library/Mobile Documents/iCloud~md~obsidian/Documents/Medicine',
      },
      {
        name = 'work',
        path = vim.fn.expand '~/vaults/work',
      },
    },
  },

  keys = {
    -- Dashboard group

    -- Vault / global
    { '<leader>on', '<cmd>Obsidian new<cr>', desc = 'New note' },
    { '<leader>oo', '<cmd>Obsidian open<cr>', desc = 'Open note (app)' },
    { '<leader>oq', '<cmd>Obsidian quick_switch<cr>', desc = 'Quick switch' },
    { '<leader>os', '<cmd>Obsidian search<cr>', desc = 'Search notes' },
    { '<leader>ow', '<cmd>Obsidian workspace<cr>', desc = 'Switch workspace' },

    -- Dailies
    { '<leader>od', '<cmd>Obsidian dailies<cr>', desc = 'Daily notes picker' },
    { '<leader>ott', '<cmd>Obsidian today<cr>', desc = 'Today' },

    -- Help / meta
    { '<leader>oh', '<cmd>Obsidian help<cr>', desc = 'Help wiki' },
    { '<leader>oH', '<cmd>Obsidian helpgrep<cr>', desc = 'Help grep' },
    { '<leader>otg', '<cmd>Obsidian tags<cr>', desc = 'Tags picker' },

    -- Note-scoped
    { '<leader>ob', '<cmd>Obsidian backlinks<cr>', desc = 'Backlinks' },
    { '<leader>ol', '<cmd>Obsidian links<cr>', desc = 'Outgoing links' },
    { '<leader>of', '<cmd>Obsidian follow_link<cr>', desc = 'Follow link' },
    { '<leader>oT', '<cmd>Obsidian toc<cr>', desc = 'Table of contents' },

    { '<leader>or', '<cmd>Obsidian rename<cr>', desc = 'Rename note' },
    { '<leader>op', '<cmd>Obsidian paste_img<cr>', desc = 'Paste image' },
    { '<leader>oc', '<cmd>Obsidian toggle_checkbox<cr>', desc = 'Toggle checkbox' },

    -- Templates
    { '<leader>oi', '<cmd>Obsidian template<cr>', desc = 'Insert template' },
    { '<leader>oN', '<cmd>Obsidian new_from_template<cr>', desc = 'New from template' },
  },

  config = function(_, opts)
    require('obsidian').setup(opts)

    -- Snacks image resolver (attachments)
    -- local ok, snacks = pcall(require, 'snacks')
    if ok then
      snacks.setup {
        image = {
          resolve = function(path, src)
            local api = require 'obsidian.api'
            if api.path_is_note(path) then
              return api.resolve_attachment_path(src)
            end
          end,
        },
      }
    end
  end,
}
