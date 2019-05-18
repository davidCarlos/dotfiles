"set shell=/bin/zsh

"-------------- Plug --------------"
set encoding=utf8
set nocompatible
set rtp+=~/.config/nvim/plugins/fzf
" This is necessary to load ~/.zshrc when runinig shell commands from vim
set shell=zsh\ -i
call plug#begin('~/.config/nvim/plugins')

" Preview colours in source code while editing
   Plug 'ap/vim-css-color'
"
"   " plug-in which provides support for expanding abbreviations
   Plug 'mattn/emmet-vim'
"
"   " Snippets engine
"   Plug 'SirVer/ultisnips'
"   " Snippets are separated from the engine. Add this if you want them:
"   Plug 'honza/vim-snippets'
"   let g:UltiSnipsExpandTrigger="<tab>"
"
"   "vim status bar.
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
"
"   " Tree explorer.
   Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle' }
"
"   " Grammar checker.
   Plug 'vim-scripts/LanguageTool'
"
"   " Colorschemes
   Plug 'NLKNguyen/papercolor-theme'
   Plug 'whatyouhide/vim-gotham'
"
"   Plug 'Quramy/vim-js-pretty-template'
"
"   " Integrates vim with git
   Plug 'tpope/vim-fugitive'
   Plug 'airblade/vim-gitgutter'
   let g:gitgutter_terminal_reports_focus=0
   let g:gitgutter_enabled = 1
   set updatetime=100

   " Match html tags.
   "Plug 'tmhedberg/matchit'
   "Plug 'Valloric/MatchTagAlways'
   "let g:mta_filetypes = {
   "    \ 'html' : 1,
   "    \ 'xhtml' : 1,
   "    \ 'xml' : 1,
   "    \ 'javascript' : 1,
   "    \}

   "Custom font icons.
   Plug 'ryanoasis/vim-devicons'

   "Fuzzy search engine
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'

   "Auto close (), {} etc.
   Plug 'Townk/vim-autoclose'

   Plug 'tpope/vim-surround'

   Plug 'gregsexton/MatchTag'

   Plug 'sheerun/vim-polyglot'

   Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

   Plug 'vimwiki/vimwiki'

   Plug 'suan/vim-instant-markdown'

   Plug 'davidhalter/jedi-vim'

   Plug 'chr4/nginx.vim'
call plug#end()

"-------------- general configurations --------------"
syntax on
filetype plugin indent on
let g:python_host_prog="/usr/bin/python3"
" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String

"-------------- Color Schemes --------------"
set background=light
colorscheme PaperColor

"-------------- airline configuration --------------"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'

"-------------- Sets --------------"
autocmd FileType gitcommit set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType eruby set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType ruby set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType go set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
"autocmd FileType javascript.jsx JsPreTmpl html
autocmd FileType javascript set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType typescript set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType Jenkinsfile set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 expandtab
autocmd FileType  dockerfile set softtabstop=4 tabstop=4 shiftwidth=4 expandtab
autocmd FileType css set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType scss set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType html set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType spec set softtabstop=8 tabstop=8 shiftwidth=8 expandtab
autocmd FileType yaml set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd FileType sh set softtabstop=4 tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp set softtabstop=4 tabstop=4 shiftwidth=4 expandtab
autocmd FileType md set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.vue set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.jinja2 set filetype=html softtabstop=2 tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.conf set ft=nginx


"==== General sets ===="
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

"-------------- Maps --------------"


"==== nerdtree maps ====="
nmap <leader>F :NERDTreeToggle<CR>

"==== js maps ====="
"Insert console.log and put the cursor inside ().
imap <leader>K console.log()<esc>i

" Move current directory
nmap cd :cd ~/projects/pencillabs/

"==== Regex maps ===="
"remove empty spaces
nmap <F10> :%s/\s\+$//<CR>

"==== Commands maps ===="
nmap <leader>f :FZF <CR>
"Ctags bar

let g:tagbar_ctags_bin="/usr/bin/ctags"
nmap <C-]> g<c-]>
nmap <LEADER>c :!ctags  -R --options=/home/david/.ctags.cnf .<CR>
nmap <LEADER>C :Tags<CR>
"Silver search, better then ack.
nnoremap <LEADER>a :Ag

"==== Movimentation maps ===="
nmap j gj
nmap k gk
" g_ get the line without the new line char.
nmap E g_
nmap B ^
vmap E $
vmap B ^
"inprove movements, use f{char}, F{char}, t{char} or T{char}
nmap l <nop>
nmap h <nop>
"use <c-q> to match tags.
nmap <c-q> %

"==== Editing maps ===="
"Add a empty line below on normal mode
nnoremap <leader>j o<esc>
"Add a empty line below on normal mode
nnoremap <leader>k ko<esc>
" Insert line above on insert mode
imap <c-k> <esc>O
" Insert line bellow on insert mode
imap <c-j> <esc>o
"jump to beginning of the line

"==== Buffer maps ===="
nmap <LEADER>b :b#<CR>
nmap <C-N> :bnext<CR>
nmap <C-P> :bprevious<CR>
" List buffered files
nmap <LEADER>l :Buffers<CR>
nmap lw :lwindow<CR>
nmap lc :lclose<CR>
nmap <LEADER>d :bd!<CR>

"==== File maps ===="
nmap <LEADER>q :q<CR>
nmap ll :w<CR>
nmap <LEADER>x :x<CR>
" Save file with sudo permission (nice mapping)
nmap <LEADER>R :w !sudo tee %<CR>
"Reload vimrc
nmap <LEADER>m :so $MYVIMRC<CR>
"Open vimrc/init.vim in a split window
nmap <leader>vs :e $MYVIMRC<CR>
"reopen current file
nmap <leader>e :e!<CR>

"==== Split maps ===="
nmap <LEADER>v :vsplit <CR>
nmap <LEADER>s :split <CR>

"==== Yank maps ===="
"Yank to clipboard
noremap YY "+y<CR>
"Yank from clipboard
nmap <leader>p "*p<CR>
"nmap <leader>P "+p<CR>

"==== Registers maps ===="
"Show registers
nmap <LEADER>r :reg<CR>

"==== Fugitive maps ===="
nmap gs :Gstatus<CR>
nmap gd :Gvdiff<CR>
nmap gc :Gcommit
nmap gik :Git checkout %<CR>
nmap gp :Gpush
nmap gl :call OpenGitLog()<CR>
nmap gq :call CloseGitLog()<CR>
nmap gq :call CloseGitLog()<CR>
nmap gS :Git show<CR>
nmap gv :Gitv<CR>

"==== Tabs maps ===="
nmap <C-T> :tabnew<CR>
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>

"==== list maps ===="
nmap <LEADER>N :lnext<CR>
nmap <LEADER>P :lprevious<CR>
" clean hlsearch
nnoremap <F12> :nohl<CR><C-L>
" Increase width vertical resize.
nnoremap <C-W>< :vertical resize +10<CR>
nnoremap <C-W>> :vertical resize -10<CR>

" go to command mode
nmap hh :
" list command window
nmap qq q:
" open terminal on split
nmap <leader>tv :call OpenTerminalOnSplit()<CR>
nmap tt :terminal<CR>

"-------------- Functions --------------"

set omnifunc=syntaxcomplete#Complete

" Open split on a new tab, an keep the layout.
nnoremap <C-W>o :tab split<CR>

" Do not search on paths listed on .gitignore.
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:instant_markdown_autostart = 0
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

function! OpenGitLog()
    execute(":tabnew % | Glog -- | copen")
endfunction

function! CloseGitLog()
   execute(":cclose | q! | tabprevious")
endfunction

function! OpenTerminalOnSplit()
	execute(":vsplit | terminal")
endfunction

" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
imap <expr> <leader><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" when nerdtree is open, <C-c>c will jump to it
noremap <C-c>c <Nop>
