return {
  "voldikss/vim-floaterm",
  init = function()
    vim.g.floaterm_keymap_toggle = "<C-n>"
    vim.g.floaterm_title = "Terminal ($1/$2)"
  end,
  keys = {
    { "<C-m>", "<Cmd>FloatermToggle<CR>", desc = "Toggle Floaterm" },
  },
}
