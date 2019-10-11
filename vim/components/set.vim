
"-------------- Color Schemes --------------"
"colorscheme PaperColor
"set background=light
"colorscheme solarized8_low
set termguicolors
set t_Co=256
set background=dark
colorscheme nord

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
" hide hidden chars, like tabs
set nolist
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
let g:airline#extensions#tabline#enabled = 1

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

" always center the cursor on page
set scrolloff=1000

"let g:typescript_indent_disable = 1

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use a folder icon as nerdtree arrow
" let g:NERDTreeDirArrowExpandable = '📁'
" let g:NERDTreeDirArrowCollapsible = '📂'

let g:jsx_ext_required = 0

au FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
au FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
au FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
au FileType javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au FileType jinja setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au FileType javascript.jsx setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
au FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
"open terminal on insert mode
au TermOpen term://* startinsert
