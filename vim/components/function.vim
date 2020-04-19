function! OpenConfig(config)
	let config_path = ":e ~/.config/nvim/components/" . a:config . ".vim"
	echom config_path
	execute(config_path)
endfunction
