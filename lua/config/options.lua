local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.autowrite = true -- Enable auto write
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

opt.cursorline = false -- Enable highlighting of the current line
opt.conceallevel = 0
opt.confirm = false -- Confirm to save changes before exiting modified buffer
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = false -- Show some invisible characters (tabs...
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.mouse = "a" -- Enable mouse mode
opt.number = false -- Print line number
opt.pumblend = 0 -- Popup blend
opt.relativenumber = false -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically

opt.spelllang = { "en", "ru" }
-- opt.spelloptions:append "noplainbuffer"

opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current ]]
opt.termguicolors = false -- True color support
opt.timeoutlen =  300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode



opt.wildmenu = true
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.pumheight = 15 -- Maximum number of entries in a popup
opt.completeopt = "menuone,noselect,noinsert"
opt.wildignore:append { '*.o', '*.obj', '*.py[co]', '.git/*', '__pycache__/*', 'dist/*', 'build/*', '*.so', '*.zip', '*.rar', '*.tar.*', '*.gz', '*.docx', '*.xlsx', '*.pdf', '*.jpg', '*.jpeg', '*.gif', '*.png', '*.mp3', '*.mp4', '*.webp' }

opt.winminwidth = 5 -- Minimum window width
opt.wrap = true -- Disable line wrap 
opt.tabstop = 2 -- Number of spaces tabs count for

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Folding
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99

-- Diagnostic settings
local diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}
vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostics.Error,
      [vim.diagnostic.severity.WARN] = diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = diagnostics.Info,
    },
  },
}

-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

-- Setup options for Neovide
-- Install neovide: ❯ brew install --ignore-dependencies  neovide
if vim.g.neovide then
 -- vim.o.guifont = "Maple Font NF:h20"
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_antialiasing = false
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_input_ime = true
end
