"-------------- Functions --------------"
function! OpenGitLog()
    execute(":tabnew % | Glog -- | copen")
endfunction

function! CloseGitLog()
   execute(":cclose | q! | tabprevious")
endfunction

function! OpenTerminalOnSplit()
	execute(":vsplit | terminal")
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

