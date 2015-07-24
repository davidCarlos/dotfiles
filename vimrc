" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just"
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


" ============= Plugins==========================
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Vundle is the plugin manager used by this vimrc. Install vundle in your
"machine to install the other plugins.
Plugin 'gmarik/Vundle.vim'

" Autocomplete to files
Plugin 'kien/ctrlp.vim'

Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'

" To use this plugin you will have to install in your machine thd
" silver-search lib.
Plugin 'rking/ag.vim'

" Status bar plugin
Plugin 'majutsushi/tagbar'

" Autocomplete plugin
Plugin 'Shougo/neocomplete.vim'

" file tree
Plugin 'scrooloose/nerdtree'

" Plugin to write notes in vim. vim-notes depends vim-misc plugin to work.
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'

" Show undo tree in a better way.
Plugin 'vim-scripts/Gundo'

" Integrate vim with git
Plugin 'tpope/vim-fugitive'

"rails plugins"
Plugin 'tpope/vim-rails'
Plugin 'ngmy/vim-rubocop'

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

autocmd FileType ruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2
autocmd FileType c set softtabstop=4 tabstop=4
autocmd FileType c++ set softtabstop=4 tabstop=4


syntax enable
set relativenumber
set term=screen-256color

" Some colorschemes as solarized needs background=light
set background=dark
set t_Co=256
colorscheme badwolf

set showmatch
set ignorecase
set smartcase
set incsearch
set autoindent

set autowrite
set expandtab
set shiftround
" Always show an status line
set laststatus=2

set softtabstop=4
set shiftwidth=4
set showmode

" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.png,*.md,*.pyc,*.swp,*.html,*.tar.*,*.pdf

set showfulltag
set nobackup
set nowritebackup
set noswapfile
set title
set wildmenu
set wildmode=longest,list,full
set confirm
set hlsearch

set cursorline
set enc=utf-8
set foldmethod=manual
let mapleader=","

" =========== Moves ===============
nmap <c-t> :tabnew<CR>
"remove empty spaces
nmap cs :%s/\s\+$//<CR>

nmap j gj
nmap k gk
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h

"jump to beginning of the line
nmap E $
nmap B ^
vmap E $
vmap B ^

"inprove movements, use f{char} or F{char}
nmap l <nop>
nmap h <nop>
"=============================


"========= Navigation stuffs ==================
nmap <F7> :NERDTreeCWD<CR>
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos="left"
"Ctags bar
nmap <F8> :TagbarToggle<CR>
nmap <F6> :Vexplore<CR>

" Use nativa vim buffers, instead of CtrlP
nmap <LEADER>l :buffers<CR>:buffer<Space>

"==============================================


"========== LEADER keys ===============
nmap <LEADER>q :q<CR>
nmap <LEADER>w :w<CR>
" Save file with sudo permission
nmap <LEADER>R :w !sudo tee %<CR>
nmap <LEADER>x :x<CR>
nmap <LEADER>p :pwd<CR>
" set current edit file as default directory NICE
nmap <LEADER>d :lcd %:p:h<CR>
nmap <LEADER>m :so $MYVIMRC<CR>
nmap <LEADER>v :vsplit <CR>
nmap <LEADER>s :split <CR>



"Silver search, better then ack.
nnoremap <LEADER>a :Ag

" Tabs
nmap <LEADER>b :b#<CR>
nmap <LEADER>r :reg<CR>
"=======================================


" ========= Fugitive maps ============
nmap  gs :Gstatus<CR>
nmap  gd :Gdiff<CR>
nnoremap gc :Gcommit
nnoremap gp :Gpush
"======================================


" ========== Ruby stuffs ==================
nmap <F5> :RuboCop<CR>

"=========== Other stuffs ===============

nmap <c-t> :tabnew<CR>

" clean hlsearch
nnoremap <C-L> :nohl<CR><C-L>

"============ Install Dependencies ====================="
fun! AmIOnDebian()
    silent let s:so = system("uname -a")
    let s:comp = "Debian"
    if s:so =~ s:comp
        call InstallDependencies()
    else
        echo "You will need to install dependencies manually"
    endif
endfun

fun! InstallDependencies()
    echo "Installing Ctags..."
    echo system("sudo apt-get install exuberant-ctags")
    echo "Installing Ag..."
    echo system("sudo apt-get install silversearcher-ag")
    call InstallVundle()
    BundleInstall
endfun

"https://github.com/justinmk/config/
fun! InstallVundle()
    echo "Installing Vundle..."
    silent call mkdir(expand("~/.vim/bundle", 1), 'p')
    echo system("git clone https://github.com/gmarik/vundle.git")
    ~/.vim/bundle/vundle
endfun
"========================================================="

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"========================================
