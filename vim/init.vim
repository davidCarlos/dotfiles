"set shell=/bin/zsh

"-------------- Plug --------------"
set encoding=utf8
set nocompatible
set rtp+=~/.config/nvim/plugins/fzf
call plug#begin('~/.config/nvim/plugins')

"A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" plug-in which provides support for expanding abbreviations
Plug 'mattn/emmet-vim'

" Snippets engine
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-w>"

"vim status bar.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tree explorer.
Plug 'scrooloose/nerdtree'

" Grammar checker.
Plug 'vim-scripts/LanguageTool'

Plug 'Valloric/YouCompleteMe'

" Status bar plugin
Plug 'majutsushi/tagbar'

" Colorschemes
Plug 'zaki/zazen'
Plug 'altercation/vim-colors-solarized'
Plug 'wolverian/minimal'
Plug 'owickstrom/vim-colors-paramount'
Plug 'reedes/vim-colors-pencil'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'

" Run commands assync.
Plug 'neomake/neomake'
let g:neomake_python_enabled_makers = ['pylint', 'pep8']
autocmd! BufWritePost * Neomake
autocmd BufWritePost * Neomake!

" Integrates vim with git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_enabled = 1
set updatetime=100

" Match html tags.
Plug 'gregsexton/MatchTag'

"Custom font icons.
Plug 'ryanoasis/vim-devicons'

" Rails stuff
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
let g:vimrubocop_config = '~/.rubocop.yml'

"Fuzzy search plugin
Plug 'junegunn/fzf.vim'
"Fuzzy search engine
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Auto close (), {} etc.
Plug 'Townk/vim-autoclose'

"Simple color selector/picker plugin for Vim.
Plug 'KabbAmine/vCoolor.vim'

Plug 'tpope/vim-surround'
call plug#end()

"-------------- general configurations --------------"
filetype on
syntax on
filetype plugin indent on

"-------------- airline configuration --------------"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set guifont=DroidSansMono\ Nerd\ Font\ 11

"-------------- Color Schemes --------------"
" Some colorschemes as solarized needs background=light
" let g:solarized_termcolors=256
set t_Co=256
"let g:solarized_termcolors=256
set background=light
"let base16colorspace=256
colorscheme PaperColor
"colorscheme zazen

"-------------- Sets --------------"

"==== file extension sets ===="
autocmd FileType gitcommit set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType eruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType ruby set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType bolt set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType javascript set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType css set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType scss set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType html set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType spec set softtabstop=8 tabstop=8 laststatus=8 shiftwidth=8 expandtab
autocmd FileType yaml set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab
autocmd FileType sh set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd FileType cpp set softtabstop=4 tabstop=4 laststatus=2 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.vue set softtabstop=2 tabstop=2 laststatus=2 shiftwidth=2 expandtab

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
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf
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

"==== Regex maps ===="
"remove empty spaces
nmap <F10> :%s/\s\+$//<CR>

"==== Commands maps ===="
nmap <leader>f :FZF <CR>
nmap <leader>F :NERDTreeToggle<CR>
"Ctags bar
nmap <LEADER>c :!ctags -R .<CR>
nmap <LEADER>C :TagbarToggle<CR>
"Silver search, better then ack.
nnoremap <LEADER>a :Ag

"==== Movimentation maps ===="
nmap j gj
nmap k gk
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
nmap <LEADER>l :buffer
nmap <LEADER>L :Buffers<CR>
nmap lw :lwindow<CR>
nmap lc :lclose<CR>
nmap <LEADER>d :bd!<CR>

"==== File maps ===="
nmap <LEADER>q :q<CR>
nmap <LEADER>w :w<CR>
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
