return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gF', '<cmd>Git<CR>', desc = 'Git Fugitive' },
      { '<leader>gP', '<cmd>Git push<CR>', desc = 'Git Push' },
      { '<leader>gU', '<cmd>Git pull --rebase<CR>', desc = 'Git Pull + rebase' },
    },
    config = function()
      local autocmd = vim.api.nvim_create_autocmd
      autocmd('BufWinEnter', {
        pattern = '*',
        callback = function()
          if vim.bo.ft ~= 'fugitive' then
            return
          end

          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }
          vim.keymap.set('n', '<leader>gP', function()
            vim.cmd.Git 'push'
          end, opts)

          -- rebase always
          vim.keymap.set('n', '<leader>gU', function()
            vim.cmd.Git { 'pull', '--rebase' }
          end, opts)

          -- NOTE: It allows me to easily set the branch i am pushing and any tracking
          -- needed if i did not set the branch up correctly
          vim.keymap.set('n', '<leader>gT', ':Git push -u origin ', opts)
        end,
      })

      vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>', { desc = 'Diffget ours (2)' })
      vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>', { desc = 'Diffget theirs (3)' })
    end,
  },
}
