function DiffNameOnly(target)
	print(target)
	local diff_target = string.format("%s...HEAD", target)
	local diff_cmd = string.format("Git difftool --name-status %s", diff_target)
	vim.cmd(diff_cmd)
end

vim.keymap.set("n", "<leader>dn", ":lua DiffNameOnly('")
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit ")
vim.keymap.set("n", "<leader>gw", ":Gwrite<cr>")
