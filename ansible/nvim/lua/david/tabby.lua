local theme = {
	-- fill = 'TabLineFill',
	fill = "Normal",
	head = 'TabLine',
	current_tab = 'TabLine',
	tab = 'Normal',
	win = 'Normal',
	tail = 'Normal',
}
require('tabby').setup({
	line = function(line)
		return {
			line.tabs().foreach(function(tab)
				local hl = tab.is_current() and theme.current_tab or theme.tab
				return {
					line.sep(' ', hl, hl),
					tab.is_current() and '' or '󰆣',
					line.sep(' ', hl, hl),
					tab.name(),
					hl = hl,
					line.sep(' ', hl, hl),
					line.sep(' ', hl, theme.fill),
				}
			end),
			hl = theme.fill,
		}
	end,
	-- option = {}, -- setup modules' option,
})
