"set shell=/bin/zsh

" ============= Plugins==========================

set encoding=utf8
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle is the plugin manager used by this vimrc. Install vundle in your
"machine to install the other plugins.
Plugin 'VundleVim/Vundle.vim'

Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-w>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev Ag Ack

Plugin 'vim-scripts/LanguageTool'
Plugin 'Valloric/YouCompleteMe'

" Status bar plugin
Plugin 'majutsushi/tagbar'

" Colorschemes
Plugin 'zaki/zazen'
Plugin 'altercation/vim-colors-solarized'

Plugin 'neomake/neomake'
let g:neomake_python_enabled_makers = ['pylint', 'pep8']
autocmd! BufWritePost * Neomake
autocmd BufWritePost * Neomake!


" Integrate vim with git
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

" Rails stuff
Plugin 'ngmy/vim-rubocop'
let g:vimrubocop_config = '~/.rubocop.yml'

Plugin 'gregsexton/MatchTag'
Plugin 'ryanoasis/vim-devicons'

Plugin 'tpope/vim-rails'
Plugin 'junegunn/fzf'
Plugin 'Townk/vim-autoclose'
Plugin 'alvan/vim-closetag'
"Plugin 'fatih/vim-go'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

call vundle#end()
filetype on

filetype plugin indent on

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set guifont=DroidSansMono\ Nerd\ Font\ 11
"=====================================

" ============= SETS/LETS =================

filetype plugin indent on
autocmd FileType ruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType eruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType spec set softtabstop=8 tabstop=8 laststatus=8 shiftwidth=8 expandtab
autocmd FileType yaml set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType javascript set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType python set softtabstop=4 tabstop=8 laststatus=2 shiftwidth=4 expandtab
autocmd FileType html set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType sh set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType cpp set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType c set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType go set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.vue set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab

syntax enable
set relativenumber
set number

" Some colorschemes as solarized needs background=light
" let g:solarized_termcolors=256
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized
"colorscheme zazen

set showmatch
set ignorecase
set smartcase
set incsearch
set autoindent
set mouse=
set list

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

nmap <leader>f :FZF<CR>
" =========== Moves ===============
nmap j gj
nmap k gk
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Delete line in insert mode
imap <c-d> <esc>ddko

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

nmap <c-q> %
"========= Navigation stuffs ==================
nmap <leader>F :NERDTreeToggle<CR>

"Ctags bar
nmap <LEADER>c :!ctags -R <CR>
nmap <LEADER>C :TagbarToggle<CR>

"Buffer stuffs
nmap <LEADER>b :b#<CR>
nmap <LEADER>bn :bnext<CR>
nmap <LEADER>bp :bprevious<CR>

" List buffered files
nmap <LEADER>l :buffer
nmap <LEADER>L :buffers<CR>
nmap lw :lwindow<CR>
nmap lc :lclose<CR>

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
nnoremap <LEADER>a :Ack

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

" Jump to list errors
nmap <LEADER>N :lnext<CR>
nmap <LEADER>P :lprevious<CR>

"===================================================

" ========== Ruby stuffs ==================
nmap <F5> :RuboCop<CR>

"=========== Other stuffs ===============

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


set omnifunc=syntaxcomplete#Complete
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"========================================
