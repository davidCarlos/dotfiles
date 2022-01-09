call plug#begin('~/.config/nvim/plugins')
  " Colorschemes
   Plug 'ayu-theme/ayu-vim'
   Plug 'morhetz/gruvbox'
   Plug 'lifepillar/vim-solarized8'
   Plug 'dracula/vim'
   Plug 'sjl/badwolf'
   Plug 'tomasr/molokai'
   Plug 'drewtempelmeyer/palenight.vim'
   Plug 'arcticicestudio/nord-vim'
   Plug 'chriskempson/base16-vim'
   Plug 'sonph/onehalf', { 'rtp': 'vim' }
   Plug 'git@github.com:joshdick/onedark.vim.git'
   "let ayucolor="dark"

   " Tree explorer.
   Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle' }
   Plug 'Xuyuanp/nerdtree-git-plugin'
   nmap <leader>F :NERDTreeToggle<CR>
   nmap <leader>IF :NERDTreeFind<CR>
   map <leader>FB :NERDTreeFromBookmark<Space>

   " Fuzzy search engine
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   nmap <LEADER>l :Buffers<CR>
   nmap <leader>f :FZF <CR>
   nmap <leader>a :Ag <CR>

   " Preview colours in source code while editing
   Plug 'ap/vim-css-color'

   " plug-in which provides support for expanding abbreviations
   Plug 'mattn/emmet-vim'

   " Integrates vim with git
   Plug 'tpope/vim-fugitive'
   nmap gs :Git<CR>
   nmap <leader>gd :Git diff %<CR>
   nmap gc :Git commit
   nmap gik :Git checkout %<CR>
   nmap gp :Git push
   nmap gl :Git log<CR>
   nmap <leader>gw :Git show<CR>
   nmap <leader>gpl :Git pull

   " Custom font icons.
   Plug 'ryanoasis/vim-devicons'

   " Auto close (), {} etc.
   Plug 'Townk/vim-autoclose'

   Plug 'chr4/nginx.vim'

   " A collection of language packs for Vim.
   let g:polyglot_disabled = ['markdown']
   Plug 'sheerun/vim-polyglot'

   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   " Plug stuff
   Plug 'liuchengxu/vista.vim'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}

   " Code snippets for several languages
   Plug 'honza/vim-snippets'

   Plug 'szw/vim-maximizer'
   nmap <leader>z :MaximizerToggle!<CR>
   "
   " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
   " delays and poor user experience.
   set updatetime=300

   " Show changed lines (git) on the sign column
   Plug 'airblade/vim-gitgutter'

   Plug 'thinca/vim-localrc'
   Plug 'vim-test/vim-test'
   let test#strategy = "neovim"

   " Display a thin vertical lines at each indentation level for code indented with spaces
   Plug 'Yggdroot/indentLine'

   " Preview markdown files inside terminal/gui with a floating window
   " Depends on glow cli
   Plug 'ellisonleao/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

   Plug 'skywind3000/asyncrun.vim'
call plug#end()

set termguicolors
colorscheme dracula
let g:airline_theme='dracula'
set signcolumn=yes
