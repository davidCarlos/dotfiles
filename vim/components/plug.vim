call plug#begin('~/.config/nvim/plugins')
  " Colorschemes
   Plug 'ayu-theme/ayu-vim'
   let ayucolor="dark"

   " Tree explorer.
   Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle' }
   nmap <leader>F :NERDTreeToggle<CR>

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
   nmap gs :Gstatus<CR>
   nmap gd :Gvdiff<CR>
   nmap gc :Gcommit
   nmap gik :Git checkout %<CR>
   nmap gp :Gpush
   nmap gl :call OpenGitLog()<CR>
   nmap gq :call CloseGitLog()<CR>
   nmap gq :call CloseGitLog()<CR>
   nmap gS :Git show<CR>
   nmap gv :Gitv<CR>

   " Custom font icons.
   Plug 'ryanoasis/vim-devicons'

   " Auto close (), {} etc.
   Plug 'Townk/vim-autoclose'

   Plug 'chr4/nginx.vim'

   " A collection of language packs for Vim.
   Plug 'sheerun/vim-polyglot'

   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   " Plug stuff
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   " Plug 'neoclide/coc-snippets'
   " Plug 'neoclide/coc-python'
   " Plug 'neoclide/coc-sources'
   " Plug 'neoclide/coc-prettier'
   " Plug 'neoclide/coc-yaml'
   " Plug 'iamcco/coc-angular'
   " Plug 'marlonfan/coc-phpls'
   "Plug 'neoclide/coc-tsserver'
   
   " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
   " delays and poor user experience.
   set updatetime=300
   " Don't pass messages to |ins-completion-menu|.
   set shortmess+=c
   " Always show the signcolumn, otherwise it would shift the text each time
   " diagnostics appear/become resolved.
   set signcolumn=yes
   " Use tab for trigger completion with characters ahead and navigate.
   " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
   " other plugin before putting this into your config.
   inoremap <silent><expr> <TAB>
         \ pumvisible() ? "\<C-n>" :
         \ <SID>check_back_space() ? "\<TAB>" :
         \ coc#refresh()
   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
   function! s:check_back_space() abort
     let col = col('.') - 1
     return !col || getline('.')[col - 1]  =~# '\s'
   endfunction
   " Use <c-space> to trigger completion.
   inoremap <silent><expr> <c-space> coc#refresh()
   
   " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
   " position. Coc only does snippet and additional edit on confirm.
   if exists('*complete_info')
     inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
   else
     imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
   endif

   nmap <silent> <C-]> <Plug>(coc-definition)
call plug#end()

colorscheme ayu
