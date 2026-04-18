-- ~/.config/nvim/lua/plugins/blame.lua
return {
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      local formats = require("blame.formats.default_formats")

      require("blame").setup({
        date_format = "%Y-%m-%d",
        virtual_style = "right_align",
        relative_date_if_recent = false,

        views = {
          window = require("blame.views.window_view"),
          virtual = require("blame.views.virtual_view"),
          default = require("blame.views.window_view"),
        },
        focus_blame = true,

        merge_consecutive = false,

        max_summary_width = 30,

        colors = nil,

        blame_options = nil,

        commit_detail_view = "vsplit",

        format_fn = formats.commit_date_author_fn,

        mappings = {
          commit_info = "i",
          stack_push = "<TAB>",
          stack_pop = "<BS>",
          show_commit = "<CR>",
          close = { "<esc>", "q" },
          copy_hash = "y",
          open_in_browser = "o",
        },
      })
    end,

    keys = {
      { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Toggle Git Blame (window)" },
      { "<leader>gB", "<cmd>BlameToggle virtual<cr>", desc = "Toggle Git Blame (virtual)" },
    },
  },
}
