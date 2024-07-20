-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
			-- delete buffer from list in normal mode
			-- https://github.com/nvim-telescope/telescope.nvim/pull/828
			n = {
				["d"] = "delete_buffer",
			},
		},
		wrap_results = true,
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
local telescope_bultin = require("telescope.builtin")
vim.keymap.set("n", "<leader>?", telescope_bultin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>l", telescope_bultin.buffers, { desc = "[ ] Find existing buffers" })
-- find_files can be called to search all files in the repository, including git ignored files.
-- https://stackoverflow.com/questions/71809098/how-to-include-specific-hidden-file-folder-in-search-result-when-using-telescope
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files({
		hidden = true,
		find_command = { "rg", "--files", "--hidden", "--no-ignore" },
	})
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>f", telescope_bultin.git_files, { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>sh", telescope_bultin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", telescope_bultin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", telescope_bultin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>g", telescope_bultin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>gb", telescope_bultin.current_buffer_fuzzy_find)
