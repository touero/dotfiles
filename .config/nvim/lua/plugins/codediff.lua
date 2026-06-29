return {
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",

    keys = {
      {
        "<leader>gd",
        "<cmd>CodeDiff<cr>",
        desc = "check git diff",
      },
    },

    opts = {
      explorer = {
        position = "left",
        width = 40,
        initial_focus = "explorer",
        view_mode = "tree",

        auto_open_on_cursor = true,

        focus_on_select = false,
      },

      diff = {
        layout = "side-by-side",
        jump_to_first_change = true,
      },
    },
  },
}
