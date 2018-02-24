"set shell=/bin/zsh
"-------------- Vundle --------------"
set encoding=utf8
set nocompatible
set rtp+=~/.config/nvim/plugins/fzf
call plug#begin('~/.config/nvim/plugins')

"Vundle is the plugin manager used by this vimrc. Install vundle in your
"machine to install the other plugins.
Plug 'VundleVim/Vundle.vim'

Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-w>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

"Plug 'mileszs/ack.vim'
"let g:ackprg = 'ag'
"cnoreabbrev Ag Ack

Plug 'vim-scripts/LanguageTool'
Plug 'Valloric/YouCompleteMe'

" Status bar plugin
Plug 'majutsushi/tagbar'

" Colorschemes
Plug 'zaki/zazen'
Plug 'altercation/vim-colors-solarized'
Plug 'wolverian/minimal'
Plug 'owickstrom/vim-colors-paramount'

Plug 'neomake/neomake'
let g:neomake_python_enabled_makers = ['pylint', 'pep8']
autocmd! BufWritePost * Neomake
autocmd BufWritePost * Neomake!

" Integrate vim with git
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

" Rails stuff
Plug 'ngmy/vim-rubocop'
let g:vimrubocop_config = '~/.rubocop.yml'

Plug 'gregsexton/MatchTag'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'

"Simple color selector/picker plugin for Vim.
Plug 'KabbAmine/vCoolor.vim'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

call plug#end()

"-------------- general configurations --------------"
filetype on
filetype plugin indent on
filetype plugin indent on
syntax enable

"-------------- airline configuration --------------"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'hybrid'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set guifont=DroidSansMono\ Nerd\ Font\ 11

"-------------- Color Schemes --------------"
" Some colorschemes as solarized needs background=light
" let g:solarized_termcolors=256
"set t_Co=256
"let g:solarized_termcolors=256
set background=light
colorscheme paramount
"colorscheme zazen

"-------------- Sets --------------"
"
"==== file extension sets ===="
autocmd FileType ruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType gitcommit set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType eruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType spec set softtabstop=8 tabstop=8 laststatus=8 shiftwidth=8 expandtab
autocmd FileType yaml set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType javascript set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType scss set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType python set softtabstop=4 tabstop=8 laststatus=2 shiftwidth=4 expandtab
autocmd FileType html set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType sh set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType cpp set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType c set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType go set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.vue set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab

"==== General sets ===="
set relativenumber
set number
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
" Show a preview of the regex result
set inccommand=nosplit
" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf
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

"-------------- Maps --------------"
"==== Regex maps ===="
"remove empty spaces
nmap <F10> :%s/\s\+$//<CR>

"==== Commands maps ===="
nmap <leader>f :FZF <CR>
nmap <leader>F :NERDTreeToggle<CR>
"Ctags bar
nmap <LEADER>c :!ctags -R <CR>
nmap <LEADER>C :TagbarToggle<CR>
"Silver search, better then ack.
nnoremap <LEADER>a :Ag

"==== Movimentation maps ===="
nmap j gj
nmap k gk
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
"jump to beginning of the line
nmap E $
nmap B ^
vmap E $
vmap B ^
"inprove movements, use f{char}, F{char}, t{char} or T{char}
nmap l <nop>
nmap h <nop>
nmap <c-q> %

"==== Editing maps ===="
" Delete line in insert mode
imap <c-d> <esc>ddko
"Add a empty line below on normal mode
nnoremap <leader>j o<esc>
"Add a empty line below on normal mode
nnoremap <leader>k ko<esc>

"==== Buffer maps ===="
nmap <LEADER>b :b#<CR>
nmap <C-N> :bnext<CR>
nmap <C-P> :bprevious<CR>
" List buffered files
nmap <LEADER>l :buffer
nmap <LEADER>L :buffers<CR>
nmap lw :lwindow<CR>
nmap lc :lclose<CR>

"==== File maps ===="
nmap <LEADER>q :q<CR>
nmap <LEADER>w :w<CR>
nmap <LEADER>x :x<CR>
" Save file with sudo permission (nice mapping)
nmap <LEADER>R :w !sudo tee %<CR>
" set current edit file as default directory NICE
nmap <LEADER>d :lcd %:p:h<CR>
"Reload vimrc
nmap <LEADER>m :so $MYVIMRC<CR>
"Open vimrc/init.vim in a split window
nmap <leader>vs :vs $MYVIMRC<CR>

"==== Split maps ===="
nmap <LEADER>v :vsplit <CR>
nmap <LEADER>s :split <CR>

"==== Yank maps ===="
"Yank to clipboard
noremap YY "+y<CR>
"Yank from clipboard
nmap <leader>p "*p<CR>

"==== Registers maps ===="
" Show registers
nmap <LEADER>r :reg<CR>

"==== Fugitive maps ===="
nmap gs :Gstatus<CR>
nmap gd :Gvdiff<CR>
nmap gw :Gwrite<CR>
nmap gc :Gcommit
nmap gik :Git checkout %<CR>
nmap gp :Gpush
nmap gl :Git log<CR>
nmap gS :Git show<CR>
nmap gv :Gitv<CR>

"==== list maps ===="
nmap <LEADER>N :lnext<CR>
nmap <LEADER>P :lprevious<CR>
" clean hlsearch
nnoremap <F12> :nohl<CR><C-L>
" Increase width vertical resize.
nnoremap <C-W>< :vertical resize +10<CR>
nnoremap <C-W>> :vertical resize -10<CR>

"-------------- Functions --------------"
function! HelpFull(arg)
	exec "help" a:arg | only
endfunction

function! CleanRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"' | let i=0 | while (i<strlen(regs)) | exec 'let @'.regs[i].'=""' | let i=i+1 | endwhile | unlet regs
endfunction

set omnifunc=syntaxcomplete#Complete
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

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

