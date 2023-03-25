-- [[ Setting options ]]
-- See `:help vim.o`

-- colorscheme configuration
vim.g.gruvbox_italic = 1
vim.o.termguicolors = true
vim.cmd([[colorscheme gruvbox]])

-- show relative line numbers
vim.o.relativenumber = true

-- show absolute line numbers
vim.o.number = true

-- ignore upercase or downcase
vim.o.ignorecase = true
vim.o.smartcase = true

-- ident using > and < (visual mode).
vim.o.shiftround = true

-- show regex result on a preview window
vim.o.inccommand = "split"

-- ignore some extensions
vim.o.wildignore = "*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**"

-- not backup files
vim.g.nobackup = true
vim.g.nowritebackup = true

-- not create swap files
vim.g.noswapfile = true

-- sk for confirm when executes a command operation.
vim.o.confirm = true

-- the kind of folding used for the current window
vim.o.foldmethod = "manual"

-- vim.o.the command line height.
vim.o.cmdheight = 2

vim.o.colorcolumn = 100

-- ttps://github.com/vim/vim/issues/2790
vim.o.redrawtime = 10000

vim.g.nocompatible = true
vim.g.cursorline = true

-- Set highlight on search
vim.o.hlsearch = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.o.noswapfile = true
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Keep the cursor on the middle of buffer
vim.o.so = 999
