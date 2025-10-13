# Keymap Reorganization

## Problem
The keymap organization was confusing with overlapping prefixes:
- `<leader>a` group existed but harpoon used `<leader>h[al]`
- `<leader>h` was for Git Hunks (gitsigns)
- `<leader>g` was for Git commands (fugitive, snacks pickers)
- Conflicts between git operations in different prefixes

## Solution
Consolidated all git operations under `<leader>g` and moved harpoon to `<leader>a`:

### Harpoon - `<leader>a`
- `<leader>aa` - Add file to harpoon
- `<leader>al` - List harpoon files
- `<Alt-1>` to `<Alt-5>` - Jump to harpoon file 1-5

### Git Operations - `<leader>g`
All git operations now under one prefix for consistency:

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

## Remaining Conflicts
- `<leader>gS` used by both gitsigns (stage buffer) and snacks (git status picker)
  - Recommendation: Move snacks status to `<leader>gx` or similar

## Benefits
1. Single mental model: `<leader>g` = all git operations
2. Harpoon clearly under `<leader>a` 
3. Removed `<leader>h` group entirely
4. More consistent naming (capitalized group names)
