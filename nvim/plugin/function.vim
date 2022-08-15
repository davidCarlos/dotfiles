function! OpenConfig(config)
	let config_path = ":e ~/.config/nvim/components/" . a:config . ".vim"
	echom config_path
	execute(config_path)
endfunction

function OpenTerminalOnVerticalSplit()
	execute("vs")
	execute("terminal")
endfunction

function OpenTerminalOnHorizontalSplit()
	execute("sp")
	execute("terminal")
endfunction

function InstallCocExtensions()
	CocInstall coc-pyright
	CocInstall coc-jedi
	CocInstall coc-tsserver
	CocInstall coc-yaml
	CocInstall coc-snippets
	CocInstall coc-html
endfunction

" helper function to easily replace text
function Replace(foo, bla)
	execute(":%s#".a:foo."#".a:bla."#gc")
endfunction
map <leader>r :call Replace('

call localrc#load('.local.vimrc', "./")
