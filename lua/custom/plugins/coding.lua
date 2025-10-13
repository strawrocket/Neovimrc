return {
  'ThePrimeagen/refactoring.nvim',
  enabled = true,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
  },
  opts = {
    show_success_message = true,
  },
  -- stylua: ignore
  keys = {
    { "<leader>cR", function() require("refactoring").select_refactor() end, mode = { "n", "x", "v" }, desc = "Refactor" },
    { "<leader>dv", function() require("refactoring").debug.print_var() end, mode = { "n", "x", "v" }, desc = "Print Variable" },
    { "<leader>dR", function() require("refactoring").debug.cleanup() end, desc = "Remove Printed Variables" },
  },

  {
    'Goose97/timber.nvim',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('timber').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
