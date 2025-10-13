# Neovim Efficiency Guide - Your Config

Based on your configuration, here are the most powerful features you should leverage:

## 🚀 Quick Navigation (Most Important!)

### Harpoon - Your Speed Weapon

- `<leader>ha` - Add current file to harpoon
- `Alt-1` through `Alt-5` - **INSTANT** jump to marked files
- `<leader>hl` - List all harpoon files
  **Pro tip**: Mark your 4-5 most-used files in a project

### Telescope - File Operations

- `<leader>ff` - Find files (fuzzy search)
- `<leader>fg` - Live grep (search content across all files)
- `<leader>fw` - Find word under cursor in project
- `<leader>fr` - Resume last search
- `<leader><leader>` - Quick buffer switcher
  **Pro tip**: `<leader>fg` + type pattern = search entire codebase instantly

### Flash.nvim - On-Screen Navigation

- `S` - Flash jump to any visible text
- Way faster than `w/b` or searching
  **Pro tip**: Press `S`, type 2 letters, jump anywhere on screen

## 🧠 LSP Power Features

### Navbuddy - Structure Navigation

- `<leader>n` - Opens structure navigator
- See all functions/classes, jump instantly
  **Pro tip**: In large files, use navbuddy instead of scrolling

### LSP Actions (when on code)

- `gd` - Go to definition
- `gr` - Find references
- `gi` - Go to implementation
- `<leader>ca` - Code actions (fixes, refactors)
- `<leader>cr` - Rename symbol (refactor everywhere)
- `K` - Hover documentation
  **Pro tip**: `gd` then `<C-t>` to jump back

## 🤖 AI Assistants

### Sidekick (Primary)

- `<leader>ai` - Toggle CLI
- `<leader>at` - Send current context
- `<leader>av` - Send visual selection
- `<leader>ac` - Direct Claude access
- `<Ctrl-.>` - Switch focus to/from chat
  **Pro tip**: Use `<leader>at` on functions to get instant explanations

### CopilotChat (Backup)

- `<leader>aT` - Toggle chat
- `<leader>aq` - Quick question
- `<leader>aP` - Prompt templates

## 📦 Git Workflow

### Quick Git Operations

- `<leader>gs` - Stage hunk under cursor
- `<leader>gr` - Reset hunk under cursor
- `<leader>gp` - Preview hunk diff
- `<leader>gb` - Blame line (who changed this?)
- `<leader>gg` - Open lazygit (full git UI)
  **Pro tip**: Stage hunks individually with `gs` instead of staging entire files

### Git Exploration

- `<leader>gB` - Browse branches
- `<leader>gl` - Git log
- `<leader>gf` - Git history for current file
- `]c` / `[c` - Next/prev git change in file

## ⚡ Editing Superpowers

### Mini.surround

- `sa"` - Surround with "
- `sd"` - Delete surrounding "
- `sr"'` - Replace " with '
  **Pro tip**: Visual select + `sa)` surrounds selection with ()

### Flash Motions

- `S` then 2 chars - Jump anywhere
- Visual mode + `S` - Select to position
- In `/` search, pattern matching is instant

### Treesitter Text Objects

- `vaf` - Select around function
- `vac` - Select around class
- `dif` - Delete inside function

### Multiple Cursors (recorder.nvim)

- `q` - Start/stop recording macro
- `Q` - Play macro
- Record once, replay many times

## 🎯 Buffer & Window Management

### Bufferline

- `<Ctrl-1>` through `<Ctrl-9>` - Jump to buffer by number
- `<Shift-h>` / `<Shift-l>` - Cycle buffers
- `<leader>bd` - Close buffer

### Window Management

- `<Ctrl-h/j/k/l>` - Switch windows
- `<leader>\` - Vertical split
- `<leader>-` - Horizontal split

## 🔍 Search Everywhere

### Find vs Search

- `<leader>f*` - **Find** = files/buffers/diagnostics
- `<leader>s*` - **Search** = help/keymaps/config

### Power Searches

- `<leader>sh` - Search help (faster than `:help`)
- `<leader>sk` - Search all keymaps
- `<leader>fd` - Find diagnostics across project
- `<leader>s/` - Search in open files only

## 🎨 Code Quality

### Conform (Auto-format)

- `<leader>f` - Format current buffer
- Auto-formats on save (configured)

### UFO (Code Folding)

- `zR` - Open all folds
- `zM` - Close all folds
- `za` - Toggle fold under cursor

## 💡 Lesser-Known Power Features

### Yanky (Yank History)

- `<leader>p` - Browse yank history
- `p` then `<Ctrl-n>/<Ctrl-p>` - Cycle through yanks
  **Pro tip**: Never lose a copy again!

### Neogen (Documentation)

- `<leader>cn` - Generate function documentation
  **Pro tip**: On function signature, instant docstring

### Zen Mode

- `<leader>z` - Distraction-free coding

### Undo Tree

- `<leader>u` - Browse undo history (time travel!)

## 🔥 Pro Workflows

### 1. Project Setup

```
<leader>ff          # Find and open main file
<leader>ha          # Mark it with harpoon
<leader>ff          # Open test file
<leader>ha          # Mark it
Alt-1 / Alt-2       # Now toggle between them instantly
```

### 2. Code Exploration

```
<leader>fg pattern  # Find all usages
gd                  # Jump to definition
<leader>n           # Navigate structure
<leader>ca          # See available actions
```

### 3. Git Review

```
<leader>gf          # See file history
<leader>gb          # Blame current line
<leader>gp          # Preview changes
<leader>gs          # Stage good changes
<leader>gr          # Reset bad changes
```

### 4. AI-Assisted Coding

```
<leader>ai          # Open Sidekick
<leader>at          # Send current function
[get explanation]
<leader>av          # Send selected code
[get refactoring suggestions]
```

## 🎓 Learning Tips

1. **Start with Harpoon** - Mark your top 5 files, use Alt-1-5 exclusively for a day
2. **Master `S` (Flash)** - Stop using `w/b/f/t`, use Flash for all jumps
3. **Use `<leader>sk`** - Search keymaps when you forget one
4. **Embrace LSP** - `gd`, `gr`, `gi` should be muscle memory
5. **Stage hunks, not files** - `<leader>gs` for cleaner commits

## ⚙️ Hidden Gems in Your Config

- **Incline** - Floating filename in top-right (always know where you are)
- **Statuscol** - Line numbers + git signs + folds in one column
- **Mini.ai** - Enhanced text objects (`va)`, `vi"`, etc.)
- **Marks.nvim** - Enhanced marks (press `m` to see menu)
- **Todo-comments** - `TODO:`, `FIXME:` highlighted automatically
- **Render-markdown** - Beautiful markdown preview in editor

## 🚫 What NOT to Use

- Arrow keys (you have them disabled for a reason!)
- `:e filename` when you have `<leader>ff`
- Manual scrolling when you have `/` search or `S` flash
- File tree when you have telescope + harpoon

## Next Level

Once comfortable, add:

1. Custom snippets (LuaSnip is configured)
2. Project-specific AI prompts (Sidekick CLI)
3. Custom refactoring patterns (refactoring.nvim configured)
4. Debug configurations (DAP is set up)

Remember: The goal is **fewer keystrokes, more thinking**. Your config is optimized for this!
