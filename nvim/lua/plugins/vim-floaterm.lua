return {
  "voldikss/vim-floaterm",
  keys = {
    { "<C-\\>", "<Cmd>FloatermToggle<CR>", mode = "n", desc = "Toggle Floaterm" },
    { "<C-\\>", "<C-\\><C-n><Cmd>FloatermToggle<CR>", mode = "t", desc = "Toggle Floaterm" },
    { "<leader>tc", "<Cmd>FloatermNew<CR>", desc = "New Terminal" },
    { "<leader>tc", "<Cmd>FloatermNew<CR>", mode = "t", desc = "New Terminal" },
    { "<leader>tp", "<Cmd>FloatermPrev<CR>", mode = "t", desc = "Prev Terminal" },
    { "<leader>tn", "<Cmd>FloatermNext<CR>", mode = "t", desc = "Next Terminal" },
    { "<leader>tk", "<Cmd>FloatermKill<CR>", desc = "Kill Terminal" },
  },
  init = function()
    vim.g.floaterm_keymap_toggle = "<C-\\>"
    vim.g.floaterm_title = " Terminal ($1/$2)"
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.7
    vim.g.floaterm_position = "center"
    vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
  end,
  config = function()
    vim.cmd([[
      highlight! link Floaterm NormalFloat
      highlight! link FloatermBorder FloatBorder
      highlight! link FloatermNC NormalFloat
      highlight NormalFloat guibg=#1d2021
      highlight FloatBorder guifg=#928374 guibg=#1d2021
    ]])
  end,
}
