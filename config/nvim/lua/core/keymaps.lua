vim.g.mapleader = " "
local keymap = vim.keymap.set

-- Shortcuts
keymap("n", "<C-x>", ":x<CR>", {desc="Save and quit"});
keymap("i", "<C-x>", "<Esc>:x<CR>", {desc="Save and quit"});
keymap("n", "<C-q>", ":q!<CR>", {desc="Quit"});
keymap("i", "<C-q>", "<Esc>:q!<CR>", {desc="Quit"});
keymap("n", "<C-s>", ":w<CR>", {desc="Save"});
keymap("i", "<C-s>", "<Esc>:w<CR>i", {desc="Save"});

keymap("i", "<C-z>", "<Esc>:u<CR>i", {desc="Undo"});
keymap("i", "<C-y>", "<Esc>:redo<CR>i", {desc="Redo"});

keymap("v", "<C-c>", "y", {desc="Copy"});
keymap("n", "<C-v>", "p", {desc="Paste"});
keymap("i", "<C-v>", "<Esc>pi", {desc="Paste"});

keymap("n", "<C-f>", "/", {desc="Search"});
keymap("i", "<C-f>", "<Esc>/", {desc="Search"});

keymap("n", "<C-l>", ":Lazy<CR>", {desc="Open lazy.nvim menu"});

-- Closes brackets
keymap("i", "{", "{}<Left>", {desc="Close braces"});
keymap("i", "(", "()<Left>", {desc="Close patentheses"});
keymap("i", "[", "[]<Left>", {desc="Close brackets"});
keymap("i", "\"", "\"\"<Left>", {desc="Close double-quotes"});
keymap("i", "\'", "\'\'<Left>", {desc="Close simmple-quotes"});
