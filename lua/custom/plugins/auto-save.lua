-- https://github.com/okuuva/auto-save.nvim
-- Smart auto-save with intelligent conditions

-- Autocommand for printing the autosaved message
local group = vim.api.nvim_create_augroup('autosave', {})
vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveWritePost',
  group = group,
  callback = function(opts)
    if opts.data.saved_buffer ~= nil then
      print('AutoSaved')
    end
  end,
})

-- Do not save when in visual mode (usually moving/deleting text)
local visual_event_group = vim.api.nvim_create_augroup('visual_event', { clear = true })

vim.api.nvim_create_autocmd('ModeChanged', {
  group = visual_event_group,
  pattern = { '*:[vV\x16]*' },
  callback = function()
    vim.api.nvim_exec_autocmds('User', { pattern = 'VisualEnter' })
  end,
})

vim.api.nvim_create_autocmd('ModeChanged', {
  group = visual_event_group,
  pattern = { '[vV\x16]*:*' },
  callback = function()
    vim.api.nvim_exec_autocmds('User', { pattern = 'VisualLeave' })
  end,
})

-- Override flash.jump to detect start and end for auto-save integration
local flash_ok, flash = pcall(require, 'flash')
if flash_ok then
  local original_jump = flash.jump

  flash.jump = function(opts)
    vim.api.nvim_exec_autocmds('User', { pattern = 'FlashJumpStart' })
    original_jump(opts)
    vim.api.nvim_exec_autocmds('User', { pattern = 'FlashJumpEnd' })
  end
end

-- Disable auto-save when entering snacks_input buffer
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'snacks_input',
  group = group,
  callback = function()
    vim.api.nvim_exec_autocmds('User', { pattern = 'SnacksInputEnter' })
  end,
})

-- Re-enable auto-save when leaving snacks_input buffer
vim.api.nvim_create_autocmd('BufLeave', {
  group = group,
  pattern = '*',
  callback = function(opts)
    local ft = vim.bo[opts.buf].filetype
    if ft == 'snacks_input' then
      vim.api.nvim_exec_autocmds('User', { pattern = 'SnacksInputLeave' })
    end
  end,
})

-- Disable auto-save when entering snacks_picker_input buffer
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'snacks_picker_input',
  group = group,
  callback = function()
    vim.api.nvim_exec_autocmds('User', { pattern = 'SnacksPickerInputEnter' })
  end,
})

-- Re-enable auto-save when leaving snacks_picker_input buffer
vim.api.nvim_create_autocmd('BufLeave', {
  group = group,
  pattern = '*',
  callback = function(opts)
    local ft = vim.bo[opts.buf].filetype
    if ft == 'snacks_picker_input' then
      vim.api.nvim_exec_autocmds('User', { pattern = 'SnacksPickerInputLeave' })
    end
  end,
})

return {
  {
    'okuuva/auto-save.nvim',
    enabled = true,
    cmd = 'ASToggle',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
      enabled = true,
      trigger_events = {
        immediate_save = { 'BufLeave', 'FocusLost', 'QuitPre', 'VimSuspend' },
        defer_save = {
          'InsertLeave',
          'TextChanged',
          { 'User', pattern = 'VisualLeave' },
          { 'User', pattern = 'FlashJumpEnd' },
          { 'User', pattern = 'SnacksInputLeave' },
          { 'User', pattern = 'SnacksPickerInputLeave' },
        },
        cancel_deferred_save = {
          'InsertEnter',
          { 'User', pattern = 'VisualEnter' },
          { 'User', pattern = 'FlashJumpStart' },
          { 'User', pattern = 'SnacksInputEnter' },
          { 'User', pattern = 'SnacksPickerInputEnter' },
        },
      },
      condition = function(buf)
        -- Do not save when in insert mode
        local mode = vim.fn.mode()
        if mode == 'i' then
          return false
        end

        -- Don't save for harpoon or sql filetypes
        local filetype = vim.bo[buf].filetype
        if filetype == 'harpoon' or filetype == 'mysql' or filetype == 'sql' then
          return false
        end

        -- Skip autosave if in an active snippet (if using luasnip)
        local luasnip_ok, luasnip = pcall(require, 'luasnip')
        if luasnip_ok and luasnip.in_snippet() then
          return false
        end

        return true
      end,
      write_all_buffers = false,
      noautocmd = false,
      lockmarks = false,
      debounce_delay = 2000,
      debug = false,
    },
    keys = {
      { '<leader>ta', '<cmd>ASToggle<cr>', desc = 'Toggle Auto-Save' },
    },
  },
}
