call plug#begin("~/.config/nvim/plugged")
  " Colorschemes
   Plug 'git@github.com:joshdick/onedark.vim.git'
   Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
   Plug 'Mofiqul/dracula.nvim'
   Plug 'morhetz/gruvbox'

   " Tree explorer.
   Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle' }
   Plug 'Xuyuanp/nerdtree-git-plugin'

   " Fuzzy search engine
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'
   " Preview colours in source code while editing
   Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'jinja2', 'html'] }

   " plug-in which provides support for expanding abbreviations
   Plug 'mattn/emmet-vim', { 'for': ['html', 'jinja2', 'tsx', 'htmldjango', 'typescriptreact'] }


   " Integrates vim with git
   Plug 'tpope/vim-fugitive'

   " Custom font icons.
   Plug 'ryanoasis/vim-devicons'

   " Auto close (), {} etc.
   Plug 'Townk/vim-autoclose'

   Plug 'chr4/nginx.vim'

   " A collection of language packs for Vim.
   Plug 'sheerun/vim-polyglot'

   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   " Integrates vim and tmux statusline
   Plug 'edkolev/tmuxline.vim'

   " Plug stuff
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
   Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}


   " Code snippets for several languages
   Plug 'honza/vim-snippets'

   Plug 'szw/vim-maximizer'
   Plug 'airblade/vim-gitgutter'
   Plug 'thinca/vim-localrc'
   Plug 'vim-test/vim-test'

   " Display a thin vertical lines at each indentation level for code indented with spaces
   Plug 'Yggdroot/indentLine'

   " code auto formatting
   Plug 'dense-analysis/ale'

   Plug 'liuchengxu/vista.vim'
   Plug 'tpope/vim-commentary'
call plug#end()
