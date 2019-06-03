"-------------- general configurations --------------"
syntax on
filetype plugin indent on
let g:python_host_prog="/usr/bin/python3"

"-------------- Color Schemes --------------"
set background=light
colorscheme PaperColor

set encoding=utf8
set nocompatible

set rtp+=~/.config/nvim/plugins/fzf
" This is necessary to load ~/.zshrc when runinig shell commands from vim
set shell=zsh\ -i

"Show relative line numbers
set relativenumber
"Show absolute line numbers
set number
"Ignore upercase or downcase
set ignorecase
"If ignorecase is false, smartcase override it when use vim search
set smartcase
"Highlight the the searched pattern
set incsearch
set autoindent
"Disable mouse
set mouse=
" Highlight white spaces
set list
" Saves file modifications when moves to another file.
set autowrite
" Ident using > and < (visual mode).
set shiftround
" Show current vim mode
set showmode
" Show a preview of the regex result
set inccommand=nosplit
" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**
" Not backup files
set nobackup
" Not create swap files
set noswapfile
" Enhanced view of command autocomplete options
set wildmenu
" When autocomplete some vim command, complete the next full match.
set wildmode=full
" Ask for confirm when executes a command operation.
set confirm
" Highlight all search pattern matches.
set hlsearch
" Sets max columns.
set columns=80
" Add a vertical bar showing the column limit.
set colorcolumn=80
" The kind of folding used for the current window
set foldmethod=manual
" set the command line height.
set ch=2
" Defines the mapleader key.
let mapleader=","

"-------------- airline configuration --------------"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'

" Do not search on paths listed on .gitignore.
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:instant_markdown_autostart = 0

"------------------ LSP configuration --------------------"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
