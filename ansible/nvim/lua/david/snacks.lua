require("snacks").setup({
  input = {
    enabled = true, -- Enhances `ask()`
  },
  picker = {
    enabled = true, -- Enhances `select()`
    actions = {
      opencode_send = function(picker) ---@param picker snacks.Picker
        local items = vim.tbl_map(function(item) ---@param item snacks.picker.Item
          return item.file
            and require("opencode").format({ path = item.file, from = item.pos, to = item.end_pos })
            or item.text
        end, picker:selected({ fallback = true }))

        require("opencode").prompt(table.concat(items, ", ") .. " ")
      end,
    },
    win = {
      input = {
        keys = {
          ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
        },
      },
    },
  },
})
