"-------------- general configurations --------------"
syntax on
filetype plugin indent on
"-------------- general configurations --------------"

source ~/.config/nvim/components/set.vim
source ~/.config/nvim/components/map.vim
source ~/.config/nvim/components/plug.vim
source ~/.config/nvim/components/function.vim

nmap <leader>vs :call OpenConfig("")<left><left>
set guifont=FiraCode\ Nerd\ Font\ Mono:h10

if exists('g:Gui')
    " Starts in fullscreen, Maximized should work too (untested)
    call GuiWindowFullScreen(1)
endif
