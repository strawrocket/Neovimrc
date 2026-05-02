return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = false },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = { 2, 2 } },
          { section = 'startup' },
          {
            section = 'terminal',
            cmd = 'pokemon-colorscripts -r --no-title; sleep .1',
            random = 10,
            pane = 2,
            indent = 4,
            height = 30,
          },
        },
        preset = {
          header = [[
 __    __                                     __                   
|  \  |  \                                   |  \                  
| ▓▓  | ▓▓__    __  ______   ______   ______  \▓▓ ______  _______  
| ▓▓__| ▓▓  \  |  \/      \ /      \ /      \|  \/      \|       \ 
| ▓▓    ▓▓ ▓▓  | ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓  ▓▓▓▓▓▓\ ▓▓▓▓▓▓▓\
| ▓▓▓▓▓▓▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓ ▓▓    ▓▓ ▓▓   \▓▓ ▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓
| ▓▓  | ▓▓ ▓▓__/ ▓▓ ▓▓__/ ▓▓ ▓▓▓▓▓▓▓▓ ▓▓     | ▓▓ ▓▓__/ ▓▓ ▓▓  | ▓▓
| ▓▓  | ▓▓\▓▓    ▓▓ ▓▓    ▓▓\▓▓     \ ▓▓     | ▓▓\▓▓    ▓▓ ▓▓  | ▓▓
 \▓▓   \▓▓_\▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓  \▓▓▓▓▓▓▓\▓▓      \▓▓ \▓▓▓▓▓▓ \▓▓   \▓▓
         |  \__| ▓▓ ▓▓                                             
          \▓▓    ▓▓ ▓▓                                             
           \▓▓▓▓▓▓ \▓▓                                             
          ]],
        },
      },
      explorer = { enabled = false },
      indent = {
        enabled = false,
        hl = 'SnacksIndent',
      },
      input = { enabled = false },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      image = {
        enabled = true,
        max_width = 60,
        max_height = 20,
        froce = true,
      },
      picker = { 
        enabled = true,
        -- Disable treesitter highlighting in picker to avoid vim parser issues
        treesitter = false,
      },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
    },
    keys = {
      -- Top Pickers & Explorer
      {
        '<leader>u',
        function()
          Snacks.picker.undo()
        end,
        desc = 'Undotree',
      },
      {
        '<leader>gB',
        function()
          Snacks.picker.git_branches()
        end,
        desc = 'Git Branches',
      },
      {
        '<leader>sC',
        function()
          Snacks.picker.colorschemes()
        end,
        desc = 'Colorschemes',
      },
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log()
        end,
        desc = 'Git Log',
      },
      {
        '<leader>gL',
        function()
          Snacks.picker.git_log_line()
        end,
        desc = 'Git Log Line',
      },
      {
        '<leader>gx',
        function()
          Snacks.picker.git_status()
        end,
        desc = 'Git Status',
      },
      {
        '<leader>gt',
        function()
          Snacks.picker.git_stash()
        end,
        desc = 'Git Stash',
      },
      {
        '<leader>gH',
        function()
          Snacks.picker.git_diff()
        end,
        desc = 'Git Diff (Hunks)',
      },
      {
        '<leader>gf',
        function()
          Snacks.picker.git_log_file()
        end,
        desc = 'Git Log File',
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },

      {
        '<leader>sM',
        function()
          Snacks.picker.man()
        end,
        desc = 'Search man pages',
      },

      -- Find/Files pickers (migrated from telescope)
      {
        '<leader>ff',
        function()
          Snacks.picker.files()
        end,
        desc = 'Find Files',
      },
      {
        '<leader>fg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Find by Grep',
      },
      {
        '<leader>fw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Find Word',
      },
      {
        '<leader>fr',
        function()
          Snacks.picker.resume()
        end,
        desc = 'Find Resume',
      },
      {
        '<leader>fo',
        function()
          Snacks.picker.recent()
        end,
        desc = 'Find Old files (recent)',
      },
      {
        '<leader>fb',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Find Buffers',
      },
      {
        '<leader>fd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = 'Find Diagnostics',
      },

      -- Search (help, config, etc.)
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Search Help',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = 'Search Keymaps',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.pickers()
        end,
        desc = 'Search Select Picker',
      },
      {
        '<leader>sn',
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
        end,
        desc = 'Search Neovim files',
      },

      -- Quick buffer access
      {
        '<leader><leader>',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Find Buffers',
      },

      -- Search in buffer
      {
        '<leader>/',
        function()
          Snacks.picker.lines()
        end,
        desc = 'Search in current buffer',
      },

      -- Search in open files
      {
        '<leader>s/',
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = 'Search in open files',
      },

      -- Yank history (using yanky plugin integration if available)
      {
        '<leader>p',
        function()
          Snacks.picker.yank_history()
        end,
        desc = 'Yank History',
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>ts'
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tw'
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tL'
          Snacks.toggle.diagnostics():map '<leader>td'
          Snacks.toggle.line_number():map '<leader>tl'
          Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>tc'
          Snacks.toggle.treesitter():map '<leader>tT'
          Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>tb'
          Snacks.toggle.inlay_hints():map '<leader>th'
          Snacks.toggle.indent():map '<leader>tg'
          Snacks.toggle.dim():map '<leader>tD'
        end,
      })
    end,
  },
}
