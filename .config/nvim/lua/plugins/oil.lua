return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        watch_for_changes = true,
        case_insensitive = true,
        skip_confirm_for_simple_edits = true,
        columns = {
          "permissions",
          "mtime",
          "size",
          "icon",
        },
        float = {
          padding = 2,
          max_width = 80,
          max_height = 30,
        },
        view_options = {
          show_hidden = true,
        },
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<C-l>"] = "actions.select",
          ["<C-h>"] = "actions.parent",
          ["<C-j>"] = "actions.select_split",
          ["<C-k>"] = "actions.select_vsplit",
          ["<C-r>"] = "actions.refresh",
          ["<C-p>"] = "actions.preview",
          ["_"] = "actions.open_cwd",
          ["gs"] = "actions.change_sort",
          ["g."] = "actions.toggle_hidden",
          ["q"] = "actions.close",
          ["<esc>"] = "actions.close",
        },
      })
    end,
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil (current dir)" },
    },
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}
