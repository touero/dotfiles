return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal",
      size = 15,
    },
    keys = {
      {
        "<C-\\>",
        "<cmd>ToggleTerm<CR>",
        mode = "n",
        desc = "Toggle Terminal (open/close)",
      },

      {
        "<C-w>",
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
          vim.cmd("wincmd p")
        end,
        mode = "t",
        desc = "Leave terminal focus (don't close)",
      },
      {
        "<C-\\>",
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
          vim.cmd("ToggleTerm")
        end,
        mode = "t",
        desc = "Toggle Terminal",
      },
    },
  },
}
