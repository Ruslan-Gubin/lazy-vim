local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.number = true -- Print line number
opt.relativenumber = false -- Relative line numbers
opt.cursorline = false -- Enable highlighting of the current line
opt.wrap = true -- Disable line wrap 
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Indentation
opt.shiftwidth = 2 -- Size of an indent
opt.softtabstop = 2 -- Soft tab stop
opt.tabstop = 2 -- Number of spaces tabs count for
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.autoindent = true -- Copy indent from current line

-- Search settings
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.hlsearch = false -- Don't highlight search results
opt.incsearch = true -- Show matches as you type

-- Visual settings
opt.termguicolors = true -- before false Enable 24-bit colors
opt.signcolumn = "yes" -- Always show sign column
opt.showmatch = true -- new  Highlight matching brackets
opt.matchtime = 2 -- How long to show matching bracket
opt.cmdheight = 1 -- Command line height
opt.showmode = false -- Don't show mode in command line
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- before 0 Popup menu transparency
opt.pummaxwidth = 60 -- cap completion popup width
opt.winblend = 0 -- Floating window transparency
-- opt.completeopt = "menu,menuone,noselect,popup" -- "menuone,noselect,noinsert" before popup shows completionItem/resolve preview
opt.completeopt = "menuone,noselect,noinsert" -- "menuone,noselect,noinsert" before popup shows completionItem/resolve preview
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- before false Confirm to save changes before exiting modified buffer
opt.concealcursor = "" -- Don't hide cursor line markup
opt.synmaxcol = 300 -- Syntax highlighting limit
opt.ruler = false -- Disable the default ruler
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5 -- Minimum window width

-- File handling
opt.backup = false -- new Don't create backup files
opt.writebackup = false -- new Don't create backup before writing
opt.swapfile = false -- new Don't create swap files
opt.undofile = true -- Persistent undo
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory

opt.updatetime = 500 -- before 200 Save swap file and trigger CursorHold
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.ttimeoutlen = 0 -- Key code timeout
opt.autoread = true -- Auto reload files changed outside vim
opt.autowrite = true -- Auto save

-- Behavior settings
opt.hidden = true -- Allow hidden buffers
opt.errorbells = false -- No error bells
opt.backspace = "indent,eol,start" -- Better backspace behavior
opt.autochdir = false -- Don't auto change directory

opt.path:append("**") -- include subdirectories in search
opt.selection = "exclusive" -- Selection behavior
opt.mouse = "a" -- Enable mouse support
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.modifiable = true -- Allow buffer modifications
opt.encoding = "UTF-8" -- Set encoding

-- Folding settings
opt.smoothscroll = false
vim.wo.foldmethod = "manual"
opt.foldlevel = 99 -- Start with all folds open
opt.formatoptions = "jcroqlnt" -- tcqj
opt.nrformats = "unsigned"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --no-heading --smart-case"

-- Split behavior
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen"

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wildignore:append { '*.o', '*.obj', '*.py[co]', '.git/*', '__pycache__/*', 'dist/*', 'build/*', '*.so', '*.zip', '*.rar', '*.tar.*', '*.gz', '*.docx', '*.xlsx', '*.pdf', '*.jpg', '*.jpeg', '*.gif', '*.png', '*.mp3', '*.mp4', '*.webp' }

-- Better diff options (indent-heuristic + inline:char are now defaults, linematch stays custom)
opt.diffopt:append("linematch:60,indent-heuristic,inline:char")

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

-- global floating window border (all vim.lsp, vim.diagnostic, etc.)
opt.winborder = "rounded"

-- completion popup menu border
opt.pumborder = "rounded"
opt.messagesopt = "hit-enter,history:500,progress:c"
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = false -- Show some invisible characters (tabs...)
opt.listchars = { tab = "| ", trail = " ", nbsp = " " } -- update
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.filetype.add({
 extension = {
 env = "dotenv",
  txt = "markdown",
},
filename = {
  [".env"] = "dotenv",
  ["env"] = "dotenv",
},
pattern = {
  ["[jt]sconfig.*.json"] = "jsonc",
  ["%.env%.[%w_.-]+"] = "dotenv",
},
})

opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

opt.spelllang = { "en", "ru" }

-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

-- Setup options for Neovide
-- Install neovide: ❯ brew install --ignore-dependencies  neovide
-- if vim.g.neovide then
--  -- vim.o.guifont = "Maple Font NF:h20"
--   vim.o.guifont = "JetBrainsMono Nerd Font:h12"
--   vim.g.neovide_hide_mouse_when_typing = true
--   vim.g.neovide_cursor_antialiasing = false
--   vim.g.neovide_input_macos_option_key_is_meta = "only_left"
--   vim.g.neovide_input_ime = true
-- end
