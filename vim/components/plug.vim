call plug#begin('~/.config/nvim/plugins')

   " Preview colours in source code while editing
   Plug 'ap/vim-css-color'

   " plug-in which provides support for expanding abbreviations
   Plug 'mattn/emmet-vim'

  " vim status bar.
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   " Tree explorer.
   Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle' }

   " Grammar checker.
   Plug 'vim-scripts/LanguageTool'

  " Colorschemes
   Plug 'NLKNguyen/papercolor-theme'
   Plug 'whatyouhide/vim-gotham'
   Plug 'morhetz/gruvbox'

   " highlights JavaScript's Template Strings in other FileType syntax rule
   " Plug 'Quramy/vim-js-pretty-template'

   " Integrates vim with git
   Plug 'tpope/vim-fugitive'
   Plug 'airblade/vim-gitgutter'
   let g:gitgutter_terminal_reports_focus=0
   let g:gitgutter_enabled = 1
   set updatetime=100

   " Custom font icons.
   Plug 'ryanoasis/vim-devicons'

   " Fuzzy search engine
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Plug 'junegunn/fzf.vim'

   " Auto close (), {} etc.
   Plug 'Townk/vim-autoclose'

   " Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more.
   Plug 'tpope/vim-surround'

   " Vim's MatchParen for HTML tags
   Plug 'gregsexton/MatchTag'

   " A collection of language packs for Vim.
   Plug 'sheerun/vim-polyglot'

   " LSP Engine implementation
   Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
   Plug 'neoclide/coc-snippets'
   Plug 'neoclide/coc-python'
   Plug 'neoclide/coc-sources'
   
   " Vim snippets loaded by coc-snippets
   Plug 'honza/vim-snippets'

   "View and search LSP symbols, tags in Vim/NeoVim
   Plug 'liuchengxu/vista.vim'

   " Gutentags is a plugin that takes care of the much needed management of tags files in Vim
   Plug 'ludovicchabant/vim-gutentags'

   " The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file.
   Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
