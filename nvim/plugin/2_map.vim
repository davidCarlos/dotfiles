"-------------- normal mode maps  --------------"

" copy the line and not add empty line after paste
" nmap yY vEy

nmap j gj
nmap k gk

" go to the end of the line on normal mode
nmap E g_

" go to the begining of the line on normal mode
nmap B ^

"source vimrc
nmap <LEADER>m :so $MYVIMRC<CR>

"inprove movements, use f{char}, F{char}, t{char} or T{char}
nmap l <nop>
nmap h <nop>

"Add a empty line below on normal mode
nnoremap <leader>j o<esc>

"Add a empty line above on normal mode
nnoremap <leader>k ko<esc>

nmap ll :w<CR>
nmap <LEADER>x :x<CR>
nmap <LEADER>q :q<CR>

" Save file with sudo permission (nice mapping)
nmap <LEADER>R :w !sudo tee %<CR>

"Open vimrc/init.vim in a split window
nmap <leader>vs :call OpenConfig("

"reread current file
nmap <leader>e :e!<CR>

" split maps 
nmap <LEADER>v :vsplit <CR>
nmap <LEADER>s :split <CR>

" yank maps. Depends on xclip package 
noremap YY "+y<CR>

"Show registers
nmap <LEADER>r :reg<CR>

" clean hlsearch
nnoremap <F10> :nohl<CR><C-L>

" go to command mode
nmap hh :

" list command window
nmap qq q:

" terminal maps
nmap <leader>os :call OpenTerminalOnHorizontalSplit()<CR>
nmap <leader>ov :call OpenTerminalOnVerticalSplit()<CR>
tnoremap <C-]> <C-\><C-n>

" split movement maps
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

nmap <C-c> <C-[>


" buffer maps
nmap <LEADER>b :b#<CR>
nmap <C-N> :bnext<CR>
nmap <C-M> :bprevious<CR>
nmap <CR> <CR>

" Move current directory
nmap cd :cd ~/projects/pencillabs/

nmap <C-q> %

" Creates new tab from current buffer
map <LEADER>t :tabnew %<CR>
"-------------- normal mode maps  --------------"

"-------------- visual mode maps  --------------"
" go to the end of the line
vmap E $
" go to the begining of the line
vmap B ^
"-------------- visual mode maps  --------------"


"-------------- insert mode maps  --------------"
" Insert line above on insert mode
imap <c-k> <esc>O
" Insert line bellow on insert mode
imap <c-j> <esc>o
"jump to beginning of the line
imap <leader>K console.log()<C-c>i
"-------------- insert mode maps  --------------"
"
"
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
let test#neovim#term_position = "vert"

nmap <C-T> :tabnew<CR>
nmap <A-l> :tabnext<CR>
nmap <A-h> :tabprevious<CR>

imap <C-c> <esc><esc>

nmap <LEADER>G :Git 

" Vista maps
nmap <leader>V :Vista!!<CR>

" Nerdtree maps
nmap <leader>F :NERDTreeToggle<CR>
nmap <leader>IF :NERDTreeFind<CR>
map <leader>FB :NERDTreeFromBookmark<Space>

" FZF maps
nmap <LEADER>l :Buffers<CR>
nmap <leader>f :FZF <CR>
nmap <leader>g :GFiles <CR>
nmap <leader>a :Ag <CR>

" Fugitive maps
nmap gs :Git<CR>
nmap <leader>gd :Git diff %<CR>
nmap <leader>gc :Git commit
nmap gik :Git checkout %<CR>
nmap gp :Git push
nmap gl :Git log<CR>
nmap <leader>gw :Git show<CR>
nmap <leader>gpl :Git pull

" Polyglot maps
let g:polyglot_disabled = ['markdown']

" Maximazer maps
nmap <leader>z :MaximizerToggle!<CR>

" Vim-test maps
let test#strategy = "neovim"

" Ale maps
let g:ale_fixers = {'javascript': ['prettier'], 'python': ['black'], 'html': ['prettier']}
let g:ale_linters = {'javascript': ['prettier'], 'python': ['black'], 'html': ['prettier']}
let g:ale_fix_on_save = 1
