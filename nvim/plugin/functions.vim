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
	CocInstall coc-prettier
	CocInstall coc-css
endfunction
