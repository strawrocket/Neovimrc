# Keymap Reorganization - Final

## Logical Organization

All keymaps now follow clear, intuitive naming:

### `<leader>f` - Find/Files (Telescope file operations)
- `ff` - Find Files
- `fg` - Find by Grep (search in files)
- `fw` - Find Word (under cursor)
- `fr` - Find Resume (last search)
- `fo` - Find Old files (recent files)
- `fb` - Find Buffers
- `fd` - Find Diagnostics
- `<leader><leader>` - Quick buffer access (shortcut)

### `<leader>s` - Search (meta/help searching)
- `sh` - Search Help
- `sk` - Search Keymaps
- `ss` - Search Select (Telescope picker)
- `sn` - Search Neovim config
- `sM` - Search Man pages
- `sC` - Search Colorschemes
- `s/` - Search in open files
- `/` - Search in current buffer

### `<leader>h` - Harpoon
- `ha` - Harpoon Add
- `hl` - Harpoon List
- `Alt-1` to `Alt-5` - Jump to harpoon file 1-5

### `<leader>g` - Git (all git operations)
**Gitsigns (hunks):**
- `gs` - Git Stage hunk
- `gr` - Git Reset hunk
- `gS` - Git Stage buffer
- `gR` - Git Reset buffer
- `gu` - Git Undo stage
- `gp` - Git Preview hunk
- `gb` - Git Blame
- `gd` - Git Diff (index)
- `gD` - Git Diff (last commit)

**Fugitive:**
- `gF` - Git Fugitive
- `gP` - Git Push
- `gU` - Git pUll --rebase
- `gT` - Git Tracking (set branch)

**Pickers:**
- `gB` - Git Branches
- `gl` - Git Log
- `gL` - Git Log Line
- `gx` - Git Status
- `gt` - Git sTash
- `gH` - Git Hunks (diff)
- `gf` - Git log File
- `gg` - Git lazygit

### `<leader>a` - AI Tools
**Sidekick:**
- `ai` - Sidekick Toggle CLI
- `as` - Sidekick Select tool
- `at` - Sidekick send This
- `av` - Sidekick send Visual
- `ap` - Sidekick Prompt
- `ac` - Sidekick Claude

**CopilotChat:**
- `aT` - CopilotChat Toggle
- `ax` - CopilotChat Clear
- `aq` - CopilotChat Quick chat
- `aP` - CopilotChat Prompts

### Other Groups
- `<leader>c` - Code (LSP actions, refactor)
- `<leader>t` - Toggle (options, features)
- `<leader>b` - Buffer operations
- `<leader>d` - Debug
- `<leader>u` - Undo tree
- `<leader>x` - Trouble (diagnostics)
- `<leader>q` - Session (quit/save)
- `<leader>n` - Navbuddy
- `<leader>z` - Zen mode

## Mnemonics
- **f** = Find/Files (file operations)
- **s** = Search (searching help, config, etc.)
- **h** = Harpoon (quick navigation)
- **g** = Git (all git operations)
- **a** = AI (AI assistants)
- **c** = Code (code actions)
- **t** = Toggle
- **b** = Buffer
- **d** = Debug
- **u** = Undo
- **x** = Trouble (diagnostics)
- **q** = Quit/session
- **n** = Navigation (navbuddy)
- **z** = Zen

## Benefits
1. Clear separation: **f** for finding files, **s** for searching meta-content
2. Intuitive: **h** = harpoon (not "marks"), **g** = git, **a** = AI
3. Consistent: All plugins in their logical groups
4. No conflicts: Each prefix has a clear purpose
