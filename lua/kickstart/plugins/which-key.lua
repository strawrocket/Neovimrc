return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      layout = {
        height = { min = 3, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 100 }, -- min and max width of the columns
        spacing = 5, -- spacing between columns
        align = 'center', -- align columns left, center or right
      },

      sort = { 'order' },
      icons = {
        icons = {
          mappings = true,
          rules = {
            { pattern = 'dashboard', icon = '🦁', color = 'red' },
            { pattern = 'search', icon = ' ', color = 'cyan' },
            { pattern = 'close', icon = '󰅙', color = 'red' },
            { pattern = 'monokai', icon = '', color = 'yellow' },
            { pattern = 'explorer', icon = '󱏒', color = 'green' },
            { pattern = 'format and save', icon = '󱣪', color = 'green' },
            { pattern = 'save', icon = '󰆓', color = 'green' },
            { pattern = 'zoom', icon = '', color = 'gray' },
            { pattern = 'split.*vertical', icon = '󰤼', color = 'gray' },
            { pattern = 'split.*horizontal', icon = '󰤻', color = 'gray' },
            { pattern = 'lsp', icon = '󰒋', color = 'cyan' },
            { pattern = 'ChatGPT', icon = '󰚩', color = 'azure' },
            { pattern = 'markdown', icon = '', color = 'green' },
            { pattern = 'diagnostic', icon = '', color = 'red' },
            { pattern = 'definition', icon = '󰇀', color = 'purple' },
            { pattern = 'implement', icon = '󰳽', color = 'purple' },
            { pattern = 'reference', icon = '󰆽', color = 'purple' },
            { pattern = 'Clipboard', icon = '󰅇', color = 'blue' },
            -- Group [<leader>h]
            { pattern = 'git', icon = '', color = 'cyan' },
            { pattern = 'blame', icon = '', color = 'yellow' },
            { pattern = 'diff', icon = '', color = 'green' },
            { pattern = 'hunk change', icon = '', color = 'yellow' },
            { pattern = 'reset', icon = '', color = 'gray' },
            { pattern = 'stage', icon = '', color = 'green' },
            { pattern = { 'Pull', 'Push' }, icon = '', color = 'red' },
            { pattern = 'undo', icon = '', color = 'gray' },
            { pattern = 'hunk', icon = '󰊢', color = 'red' },
            { pattern = 'harpoon', icon = '', color = 'orange' },
            { pattern = 'branch', icon = '', color = 'red' },
            { pattern = 'commit', icon = '', color = 'green' },
            -- Group [g]
            { pattern = 'word', icon = '', color = 'gray' },
            { pattern = 'first line', icon = '', color = 'gray' },
            { pattern = 'comment', icon = '󰅺', color = 'cyan' },
            { pattern = 'cycle backwards', icon = '󰾹', color = 'gray' },
            { pattern = 'selection', icon = '󰒉', color = 'gray' },
            -- Group [<leader>hn]
            { pattern = 'annotation', icon = '󰙆', color = 'cyan' },
          },
        },
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = 'search' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>b', group = 'Buffer' },
        { 'gr', group = 'LSP actions' },
        { '<leader>d', group = 'Debug' },
        { '<leader>a', group = 'Harpoon', icon = { icon = '', color = 'red' } },
        { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
        { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
        { '<leader>u', group = 'Undo', mode = 'n' },
        { '<leader>x', group = 'Trouble', mode = 'n' },
        { '<leader>c', group = 'Code', mode = 'n' },
        { '<leader>q', group = 'Session' },
        { '<leader>n', group = 'navbuddy', icon = { icon = '', color = 'green' } },
        { '<leader>x', group = 'trouble', icon = { icon = '󱖫 ', color = 'green' } },
      },
    },
  },
}
