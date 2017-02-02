set shell=/bin/zsh

" ============= Plugins==========================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle is the plugin manager used by this vimrc. Install vundle in your
"machine to install the other plugins.
Plugin 'gmarik/Vundle.vim'

Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'


" To use this plugin you will have to install in your machine thd
" silver-search lib.

" Status bar plugin
Plugin 'majutsushi/tagbar'

" Colorschemes
Plugin 'whatyouhide/vim-gotham'
Plugin 'altercation/vim-colors-solarized'
Plugin 'neomake/neomake'
Plugin 'freitass/todo.txt-vim'
Plugin 'nvie/vim-flake8'

" Integrate vim with git
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

" Rails stuff
Plugin 'ngmy/vim-rubocop'
let g:vimrubocop_config = '~/.rubocop.yml'

Plugin 'gregsexton/MatchTag'

Plugin 'tpope/vim-rails'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:ackprg = 'ag --nogroup --nocolor --column'

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
if has("autocmd")
  filetype plugin indent on
endif
"=====================================


" ============= SETS/LETS =================

autocmd FileType ruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType python set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType html set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType sh set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab

syntax enable
set relativenumber
set number
set termguicolors

" Some colorschemes as solarized needs background=light
" set background=light
 set t_Co=256
" let g:solarized_termcolors=256
colorscheme gotham256

"============= NEOVIM Stuff ================="
nmap <LEADER>T :tabnew<CR>:terminal<CR>
nmap <LEADER>S :vsplit<CR>:terminal<CR>
nmap <LEADER>V :split<CR>:terminal<CR>

" Moving to tabs usint <TAB> instead of gt
nmap <tab> :tabnext<cr>
nmap <s-tab> :tabprevious<cr>
" vmap <leader>u <S->> :echo a
"============================================"

set showmatch
set ignorecase
set smartcase
set incsearch
set autoindent
set mouse=

set autowrite

set shiftround
set showmode

" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.png,*.pyc,*.swp,*.tar.*,*.pdf

" Ignore virtualenv generated directories
set wildignore+=**bin/**
set wildignore+=**lib/python3.4/**
set wildignore+=**lib/python2.7/**

set showfulltag
set nobackup
set nowritebackup
set noswapfile
set title
set wildmenu
set wildmode=longest,list,full
set confirm
set hlsearch
set columns=80
set colorcolumn=80


"set cursorline
"set enc=utf-8
set foldmethod=manual
set ch=2
let mapleader=","

"remove empty spaces
nmap <F10> :%s/\s\+$//<CR>

"Open vimrc/init.vim in a split window
nmap <leader>vs :vs $MYVIMRC<CR>

"Use find command instead of CtrlP plugin"
set path+=**
nmap <leader>f :find 

" =========== Moves ===============
nmap j gj
nmap k gk
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Delete line in insert mode
imap <c-d> <esc>ddi

"Surround with ""
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>

"Surround with $$
nnoremap <leader>$ viw<esc>a$<esc>hbi$<esc>

"Surround with ()
nnoremap <leader>) viw<esc>a) <esc>hbi(<esc>f<space>x

"Surround with []
nnoremap <leader>] viw<esc>a] <esc>hbi[<esc>f<space>x

"jump to beginning of the line
nmap E $
nmap B ^
vmap E $
vmap B ^

"inprove movements, use f{char}, F{char}, t{char} or T{char}
nmap l <nop>
nmap h <nop>
"=============================

"========= Navigation stuffs ==================
nmap <leader>F :NERDTreeToggle<CR>

"Ctags bar
nmap <LEADER>c :!ctags -R <CR>
nmap <LEADER>C :TagbarToggle<CR>

"Buffer stuffs
nmap <LEADER>b :b#<CR>
nmap <LEADER>bn :bnext<CR>
nmap <LEADER>bp :bprevious<CR>

" Better then vim native buffers
" List buffered files
nmap <LEADER>l :buffer 
nmap <LEADER>L :buffers<CR>
map <LEADER>M :m 

"========== File commands ===============
nmap <LEADER>q :q<CR>
nmap <LEADER>w :w<CR>
nmap <LEADER>x :x<CR>
"=========================================

" Save file with sudo permission (nice mapping)
nmap <LEADER>R :w !sudo tee %<CR>

" set current edit file as default directory NICE
nmap <LEADER>d :lcd %:p:h<CR>

"Reload vimrc
nmap <LEADER>m :so $MYVIMRC<CR>

nmap <LEADER>v :vsplit <CR>
nmap <LEADER>s :split <CR>

"Yank to clipboard
noremap YY "+y<CR>

"Yank paragraph
nmap <LEADER>p yip<CR>
vmap <LEADER>p d<CR>

"Silver search, better then ack.
nnoremap <LEADER>a :Ag

" Show registers
nmap <LEADER>r :reg<CR>
"=======================================
"
nmap <LEADER>dd :r ~/.vim/due_date_todo.txt<CR>kEJf<vf>


" ========= Git maps ============
nmap gs :Gstatus<CR>
nmap gd :Gvdiff<CR>
nmap gw :Gwrite<CR>
nmap gc :Gcommit
nmap gp :Gpush
nmap gl :Git log<CR>
nmap gS :Git show<CR>
nmap gv :Gitv<CR>
"======================================

"================= Synstastic stuffs ================
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 2
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 2
"let g:syntastic_check_on_wq = 1
"let g:syntastic_enable_signs = 1

" Jump to list errors
nmap <LEADER>N :lnext<CR>
nmap <LEADER>P :lprevious<CR>

"===================================================

" ========== Ruby stuffs ==================
nmap <F5> :RuboCop<CR>

"=========== Other stuffs ===============

nmap <c-t> :tabnew<CR>

" clean hlsearch
nnoremap <F12> :nohl<CR><C-L>

" Increase width vertical resize.
nnoremap <C-W>< :vertical resize +10<CR>
nnoremap <C-W>> :vertical resize -10<CR>

" Signed-off-by snipet
nmap <LEADER>S :read ~/.vim/signed_off_by_template.txt<CR>fNve

"reference: "http://vim.wikia.com/wiki/Maximize_window_and_return_to_previous_split_structure
" Very usefull to use with splits.
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction

let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


autocmd! BufWritePost * Neomake!
"========================================
