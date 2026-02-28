require('hover').config({
  --- List of modules names to load as providers.
  --- @type (string|Hover.Config.Provider)[]
  providers = {
    'hover.providers.diagnostic',
    'hover.providers.lsp',
    'hover.providers.dap',
    'hover.providers.man',
    'hover.providers.dictionary',
    -- Optional, disabled by default:
    -- 'hover.providers.gh',
    -- 'hover.providers.gh_user',
    -- 'hover.providers.jira',
    -- 'hover.providers.fold_preview',
    -- 'hover.providers.highlight',
  },
  preview_opts = {
    border = 'single'
  },
  -- Whether the contents of a currently open hover window should be moved
  -- to a :h preview-window when pressing the hover keymap.
  preview_window = false,
  title = true,
  mouse_providers = {
    'hover.providers.lsp',
  },
  mouse_delay = 1000
})

vim.keymap.set('n', 'K', function()
  require('hover').open()
end, { desc = 'hover.nvim (open)' })

vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#282828" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828" })
