# Keymap Reorganization

## Problem
The keymap organization was confusing with overlapping prefixes:
- `<leader>a` group existed but was used by multiple unrelated tools (Harpoon, CopilotChat, Sidekick)
- `<leader>h` was for Git Hunks (gitsigns)
- `<leader>g` was for Git commands (fugitive, snacks pickers)
- Conflicts between git operations in different prefixes

## Solution
Consolidated keymaps into logical groups:

### AI Tools - `<leader>a`
All AI-related tools now under one prefix:

**Sidekick:**
- `<leader>ai` - Toggle Sidekick CLI
- `<leader>as` - Select CLI tool
- `<leader>at` - Send "this" to Sidekick
- `<leader>av` - Send visual selection
- `<leader>ap` - Select prompt
- `<leader>ac` - Toggle Claude
- `<Ctrl-.>` - Switch focus

**CopilotChat:**
- `<leader>aT` - Toggle CopilotChat
- `<leader>ax` - Clear/reset chat
- `<leader>aq` - Quick chat
- `<leader>aP` - Prompt actions

### Harpoon (Marks/Bookmarks) - `<leader>m`
- `<leader>ma` - Add file to harpoon
- `<leader>ml` - List harpoon files
- `<Alt-1>` to `<Alt-5>` - Jump to harpoon file 1-5

### Git Operations - `<leader>g`
All git operations consolidated under one prefix:

**Gitsigns (hunk operations):**
- `<leader>gs` - Stage hunk
- `<leader>gr` - Reset hunk
- `<leader>gS` - Stage buffer
- `<leader>gR` - Reset buffer
- `<leader>gu` - Undo stage hunk
- `<leader>gp` - Preview hunk
- `<leader>gb` - Blame line
- `<leader>gd` - Diff against index
- `<leader>gD` - Diff against last commit

**Fugitive:**
- `<leader>gF` - Open Git Fugitive
- `<leader>gP` - Git push
- `<leader>gU` - Git pull --rebase
- `<leader>gT` - Set tracking branch (fugitive buffer only)

**Snacks Git Pickers:**
- `<leader>gB` - Browse branches
- `<leader>gl` - Git log
- `<leader>gL` - Git log line
- `<leader>gx` - Git status
- `<leader>gt` - Git stash
- `<leader>gH` - Git diff/hunks
- `<leader>gf` - Git log for file
- `<leader>gg` - Lazygit

## Benefits
1. **`<leader>a`** = All AI tools (Sidekick + CopilotChat)
2. **`<leader>m`** = Marks/bookmarks (Harpoon) - more intuitive than 'a'
3. **`<leader>g`** = All git operations (no more split between h and g)
4. Clear separation between AI, navigation, and git workflows
5. No more conflicting keymaps

## Mnemonic
- **a** = AI
- **m** = Marks (Harpoon bookmarks)
- **g** = Git
