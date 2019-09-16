"-------------- Functions --------------"
function! OpenGitLog()
    execute(":tabnew % | Glog -- | copen")
endfunction

function! CloseGitLog()
   execute(":cclose | q! | tabprevious")
endfunction

function! OpenTerminalOnSplit()
	execute(":set splitbelow | 10split | set nosplitbelow | terminal")
endfunction

function! OpenConfig(config)
	let config_path = ":e ~/.config/nvim/components/" . a:config . ".vim"
	echom config_path
	execute(config_path)
endfunction

function! InstallCocExtensions()
	execute(":CocInstall coc-angular")
	" coc-python depends on jedi binary. If the code runs in virtualenv, jedi
	" must be installed on virtualenv, and not globally.
	" With CocCommand python.setInterpreter it's possible to change coc-python
	" python binary.
	execute(":CocInstall coc-python")
	"coc-gocode depends on https://github.com/mdempsky/gocode binary.
	execute(":CocInstall coc-gocode")

	execute(":CocInstall coc-snippets")
endfunction


" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'