"-------------- colorscheme configuration  --------------"
" enables 24-bit RGB colors.
set termguicolors
"-------------- colorscheme configuration  --------------"


"-------------- runtime configuration  --------------"
" vim will search this path to load fzf binary
set rtp+=~/.config/nvim/plugins/fzf
" use zsh on neovim terminal
set shell=zsh\ -i
"-------------- runtime configuration  --------------"


"Show relative line numbers
set relativenumber
"Show absolute line numbers
set number
"Ignore upercase or downcase
set ignorecase
" Ident using > and < (visual mode).
set shiftround
" Show regex result on a preview window
set inccommand=split
" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**
" Not backup files
set nobackup
set nowritebackup
" Not create swap files
set noswapfile
" Ask for confirm when executes a command operation.
set confirm
" The kind of folding used for the current window
set foldmethod=manual
" set the command line height.
set cmdheight=2
" Defines the mapleader key.
let mapleader=","
"open terminal on insert mode

"always center the cursor vertically
set so=999

au TermOpen term://* startinsert
