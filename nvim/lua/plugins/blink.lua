return {
  "saghen/blink.cmp",
  dependencies = { "xzbdmw/colorful-menu.nvim", opt = {} },
  event = { "BufReadPost", "BufNewFile" },
  version = "1.*",
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    signature = {
      enabled = true,
    },
    menu = {
      draw = {
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
  },
}
