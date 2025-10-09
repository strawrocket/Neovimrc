-- lua/plugins/rose-pine.lua
function ColorMyPencils(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end
return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      -- ColorMyPencils()
      require('rose-pine').setup {
        palette = {
          main = {
            base = '#0A0E12',
          },
        },
      }
      vim.cmd 'colorscheme rose-pine-main'
    end,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      -- vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  {
    'vague2k/vague.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        -- optional configuration here
      }
      -- vim.cmd 'colorscheme vague'
    end,
  },
}
