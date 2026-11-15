return {
  { "folke/tokyonight.nvim", enabled = false },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = true,
          comments = false,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "",
        palette_overrides = {},
        overrides = {
          DiffAdd = { bg = "#32361a", fg = "#ebdbb2" },
          DiffDelete = { bg = "#3c1f1e", fg = "#ebdbb2" },
          DiffChange = { bg = "#3a3320", fg = "#ebdbb2" },
          DiffText = { bg = "#504945", fg = "#fbf1c7" },
        },
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
