runtime! debian.vim


" ============= Plugins==========================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Vundle is the plugin manager used by this vimrc. Install vundle in your
"machine to install the other plugins.
Plugin 'gmarik/Vundle.vim'

" Autocomplete to files
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plugin 'mattn/emmet-vim'

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

" Colorschemes
Plugin 'sjl/badwolf'
Plugin 'whatyouhide/vim-gotham'
Plugin 'easysid/mod8.vim'
Plugin 'fxn/vim-monochrome'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'ptrr/proton-vim'
Plugin 'altercation/vim-colors-solarized'

" Integrate vim with git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

"escentials plugins"
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

" Rails stuff
Plugin 'ngmy/vim-rubocop'
let g:vimrubocop_config = '~/.rubocop.yml'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'gregsexton/MatchTag'

Plugin 'tpope/vim-rails'

Plugin 'PotatoesMaster/i3-vim-syntax'


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

autocmd FileType ruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2
autocmd FileType html set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2
autocmd FileType sh set softtabstop=4 tabstop=4 laststatus=4 shiftwidth=4

syntax enable
set relativenumber
set number

" Some colorschemes as solarized needs background=light
set background=light
set t_Co=256
let g:solarized_termcolors=256
" colorscheme gotham256
colorscheme solarized

"============= NEOVIM Stuff ================="
nmap <LEADER>T :tabnew<CR>:terminal<CR>
nmap <LEADER>S :vsplit<CR>:terminal<CR>
nmap <LEADER>V :split<CR>:terminal<CR>

" Moving to tabs usint <TAB> instead of gt
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>
"============================================"

set showmatch
set ignorecase
set smartcase
set incsearch
set autoindent

set autowrite
set expandtab
set shiftround
set showmode

" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.png,*.md,*.pyc,*.swp,*.tar.*,*.pdf

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
nmap <LEADER>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos="left"

"Ctags bar
nmap <LEADER>c :!ctags -R <CR>
nmap <LEADER>C :TagbarToggle<CR>

"Buffer stuffs
nmap <LEADER>b :b#<CR>
nmap <LEADER>bn :bnext<CR>
nmap <LEADER>bp :bprevious<CR>

" Better then vim native buffers
" List buffered files
nmap <LEADER>l :CtrlPBuffer<CR>

"========== LEADER keys ===============
nmap <LEADER>q :q<CR>
nmap <LEADER>w :w<CR>

" Save file with sudo permission (nice mapping)
nmap <LEADER>R :w !sudo tee %<CR>
nmap <LEADER>x :x<CR>
nmap <LEADER>p :pwd<CR>

" set current edit file as default directory NICE
nmap <LEADER>d :lcd %:p:h<CR>

"Reload vimrc
nmap <LEADER>m :so $MYVIMRC<CR>

nmap <LEADER>v :vsplit <CR>
nmap <LEADER>s :split <CR>

"Silver search, better then ack.
nnoremap <LEADER>a :Ag

" Tabs
nmap <LEADER>r :reg<CR>
"=======================================

" ========= Git maps ============
nmap  gs :Gstatus<CR>
nmap  gd :Gvdiff<CR>
nmap <LEADER>gw :Gwrite<CR>
nnoremap gc :Gcommit
nnoremap gp :Gpush
nnoremap gl :Git log<CR>
nnoremap gS :Git show<CR>
nnoremap gv :Gitv<CR>
"======================================

"================= Synstastic stuffs ================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 2
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 2
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1

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

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"========================================

