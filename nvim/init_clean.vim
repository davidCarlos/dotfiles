"-------------- general configurations --------------"
syntax on
filetype plugin indent on
"-------------- general configurations --------------"

" source ~/.config/nvim/components/map.vim
source ~/.config/nvim/components/set.vim
call plug#begin('~/.config/nvim/plugins')
   Plug 'ellisonleao/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
   Plug 'sonph/onehalf', { 'rtp': 'vim' }
   Plug 'sjl/badwolf'
call plug#end()

set termguicolors
colorscheme onehalfdark
