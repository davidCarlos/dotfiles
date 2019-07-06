"==== nerdtree maps ====="
nmap <leader>F :NERDTreeToggle<CR>
" when nerdtree is open, <C-c>c will jump to it
noremap <C-c>c <Nop>

"==== js maps ====="
"Insert console.log and put the cursor inside ().
imap <leader>K console.log()<esc>i

" Move current directory
nmap cd :cd ~/projects/pencillabs/

"==== Regex maps ===="
"remove empty spaces
nmap <F10> :%s/\s\+$//<CR>

"==== Commands maps ===="
nmap <leader>f :FZF <CR>

" Use C-] to go to tag definition
nmap <C-]> g<c-]>

" Open tag bar using coc symbols.
nmap <LEADER>C :Vista coc<CR>

"Ripgrep, better then Ag.
nnoremap <LEADER>a :Rg

"==== Movimentation maps ===="
nmap j gj
nmap k gk
" g_ get the line without the new line char.
nmap E g_
nmap B ^
vmap E $
vmap B ^
"inprove movements, use f{char}, F{char}, t{char} or T{char}
nmap l <nop>
nmap h <nop>
"use <c-q> to match tags.
nmap <c-q> %

"==== Editing maps ===="
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
nmap <LEADER>l :Buffers<CR>
nmap lw :lwindow<CR>
nmap lc :lclose<CR>
nmap <LEADER>d :bd!<CR>

"==== File maps ===="
nmap <LEADER>q :q<CR>
nmap ll :w<CR>
nmap <LEADER>x :x<CR>
" Save file with sudo permission (nice mapping)
nmap <LEADER>R :w !sudo tee %<CR>
"Reload vimrc
nmap <LEADER>m :so $MYVIMRC<CR>
"Open vimrc/init.vim in a split window
nmap <leader>vs :call OpenConfig("
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
"Show registers
nmap <LEADER>r :reg<CR>

"==== Fugitive maps ===="
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

"==== Tabs maps ===="
nmap <C-T> :tabnew<CR>
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>

"==== list maps ===="
nmap <LEADER>N :lnext<CR>
nmap <LEADER>P :lprevious<CR>
" clean hlsearch
nnoremap <F12> :nohl<CR><C-L>
" Increase width vertical resize.
nnoremap <C-W>< :vertical resize +10<CR>
nnoremap <C-W>> :vertical resize -10<CR>

" go to command mode
nmap hh :
" list command window
nmap qq q:
" open terminal on split
nmap mm :call OpenTerminalOnSplit()<CR>
tnoremap <C-]> <C-\><C-n>


" Open split on a new tab, an keep the layout.
nnoremap <C-W>o :tab split<CR>

" Open split on a new tab, an keep the layout.
nnoremap <leader>z <c-w>_ \| <c-w>\|
nnoremap <leader>zz <c-w>=
