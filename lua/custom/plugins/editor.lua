return {
  {
    'kevinhwang91/nvim-ufo',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = { 'kevinhwang91/promise-async', event = 'BufReadPost' },
    opts = {
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ('  … %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end,
      open_fold_hl_timeout = 0,
    },
    keys = {
      { 'zd', desc = 'Delete fold under cursor' },
      { 'zo', desc = 'Open fold under cursor' },
      { 'zO', desc = 'Open all folds under cursor' },
      { 'zC', desc = 'Close all folds under cursor' },
      { 'za', desc = 'Toggle fold under cursor' },
      { 'zA', desc = 'Toggle all folds under cursor' },
      { 'zv', desc = 'Show cursor line' },
      {
        'zM',
        function()
          require('ufo').closeAllFolds()
        end,
        desc = 'Close all folds',
      },
      {
        'zR',
        function()
          require('ufo').openAllFolds()
        end,
        desc = 'Open all folds',
      },
      {
        'zm',
        function()
          require('ufo').closeFoldsWith()
        end,
        desc = 'Fold more',
      },
      {
        'zr',
        function()
          require('ufo').openFoldsExceptKinds()
        end,
        desc = 'Fold less',
      },
      { 'zx', desc = 'Update folds' },
      { 'zz', desc = 'Center this line' },
      { 'zt', desc = 'Top this line' },
      { 'zb', desc = 'Bottom this line' },
      { 'zg', desc = 'Add word to spell list' },
      { 'zw', desc = 'Mark word as bad/misspelling' },
      { 'ze', desc = 'Right this line' },
      { 'zE', desc = 'Delete all folds in current buffer' },
      { 'zs', desc = 'Left this line' },
      { 'zH', desc = 'Half screen to the left' },
      { 'zL', desc = 'Half screen to the right' },
    },
  },

  {
    'luukvbaal/statuscol.nvim',
    event = { 'VimEnter' }, -- Enter when on Vim startup to setup folding correctly (Avoid number in fold column)
    commit = (function()
      if vim.fn.has 'nvim-0.9' == 1 then
        return '483b9a596dfd63d541db1aa51ee6ee9a1441c4cc'
      end
    end)(),
    config = function()
      local builtin = require 'statuscol.builtin'
      require('statuscol').setup {
        relculright = false,
        ft_ignore = { 'neo-tree' },
        segments = {
          {
            -- line number
            text = { ' ', builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            click = 'v:lua.ScLa',
          },
          { text = { '%s' }, click = 'v:lua.ScSa' }, -- Sign
          { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' }, -- Fold
        },
      }
      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        callback = function()
          if vim.bo.filetype == 'neo-tree' then
            vim.opt_local.statuscolumn = ''
          end
        end,
      })
    end,
  },

  {
    'folke/zen-mode.nvim',
    config = function()
      vim.keymap.set('n', '<leader>z', function()
        require('zen-mode').setup {
          window = {
            width = 90,
            options = {},
          },
        }
        require('zen-mode').toggle()
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = false
      end, { desc = 'Zen Mode' })
    end,
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    keys = {
      { 'm', mode = { 'n', 'x' }, desc = 'Set mark' },
      { '`', mode = { 'n', 'x' }, desc = 'Jump to mark' },
      { 'dm', mode = { 'n', 'x' }, desc = 'Delete mark' },
      { 'm-', mode = { 'n', 'x' }, desc = 'Jump to last mark' },
      { 'dm<space>', mode = { 'n', 'x' }, desc = 'Delete all marks' },
    },
    opts = {},
  },
  {
    'chrisgrieser/nvim-recorder',
    dependencies = 'rcarriga/nvim-notify',
    keys = {
      -- these must match the keys in the mapping config below
      { 'q', desc = ' Start Recording' },
      { 'Q', desc = ' Play Recording' },
      { 'dq', desc = ' Delete All Macros' },
    },
    config = function()
      require('recorder').setup {
        dynamicSlots = 'rotate',
        mapping = {
          startStopRecording = 'q',
          playMacro = 'Q',
          deleteAllMacros = 'dq',
          editMacro = 'cq',
        },
        useNerdfontIcons = true,
        lessNotifications = false,
      }

      -- local lualineZ = require('lualine').get_config().sections.lualine_z or {}
      -- local lualineY = require('lualine').get_config().sections.lualine_y or {}
      -- table.insert(lualineZ, { require('recorder').recordingStatus })
      -- table.insert(lualineY, { require('recorder').displaySlots })
      --
      -- require('lualine').setup {
      --   tabline = {
      --     lualine_y = lualineY,
      --     lualine_z = lualineZ,
      --   },
      -- }
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-d>", mode = { "n", "x", "c"}, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Harpoon Add file' })
      vim.keymap.set('n', '<leader>hl', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon List files' })

      -- Set <space>1..<space>5 be my shortcuts to moving to the files
      for _, idx in ipairs { 1, 2, 3, 4, 5 } do
        vim.keymap.set('n', string.format('<m-%d>', idx), function()
          harpoon:list():select(idx)
        end, { desc = '' })
      end
    end,
  },
  {
    'gbprod/yanky.nvim',
    dependencies = {
      { 'kkharji/sqlite.lua' },
    },
    opts = {
      ring = { storage = 'sqlite' },
    },
    keys = {
      { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
      { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
      { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
      { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
      { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },
      { '<c-p>', '<Plug>(YankyPreviousEntry)', desc = 'Select previous entry through yank history' },
      { '<c-n>', '<Plug>(YankyNextEntry)', desc = 'Select next entry through yank history' },
      { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
      { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
      { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
      { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
      { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
      { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
    },
  },

  {
    'danymat/neogen',
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    opts = {
      snippet_engine = 'luasnip',
    },
    keys = {
      {
        '<leader>cn',
        function()
          require('neogen').generate()
        end,
        desc = 'Generate Annotations (Neogen)',
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      code = {
        sign = false,
        width = 'block',
        right_pad = 1,
      },
      heading = {
        sign = true,
        icons = {},
      },
      checkbox = {
        enabled = true,
      },
    },
    ft = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
    config = function(_, opts)
      require('render-markdown').setup(opts)
      Snacks.toggle({
        name = 'Render Markdown',
        get = function()
          return require('render-markdown.state').enabled
        end,
        set = function(enabled)
          local m = require 'render-markdown'
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map '<leader>um'
    end,
  },
  {
    'm4xshen/hardtime.nvim',
    lazy = false,
    enabled = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
  },
}
