return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",

      shading_factor = 0,
      shade_terminals = false,
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,

      float_opts = {
        border = "rounded",

        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,

        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,

        winblend = 0,

        highlights = {
          border = "FloatBorder",
          background = "NormalFloat",
        },
      },
    },

    keys = {
      {
        "<c-\\>",
        "<cmd>ToggleTerm<cr>",
        mode = "n",
        desc = "toggle floating terminal",
      },

      {
        "<c-w>",
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-\\><c-n>", true, false, true), "n", false)

          vim.cmd("wincmd p")
        end,
        mode = "t",
        desc = "leave terminal focus",
      },

      {
        "<c-\\>",
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-\\><c-n>", true, false, true), "n", false)

          vim.cmd("ToggleTerm")
        end,
        mode = "t",
        desc = "toggle floating terminal",
      },
    },

    config = function(_, opts)
      require("toggleterm").setup(opts)

      local function set_toggleterm_highlight()
        local normal = vim.api.nvim_get_hl(0, {
          name = "Normal",
          link = false,
        })

        local bg = normal.bg

        vim.api.nvim_set_hl(0, "ToggleTerm", {
          bg = bg,
        })

        vim.api.nvim_set_hl(0, "ToggleTermNormal", {
          bg = bg,
        })

        vim.api.nvim_set_hl(0, "ToggleTermBorder", {
          bg = bg,
        })

        vim.api.nvim_set_hl(0, "TermCursor", {})

        vim.api.nvim_set_hl(0, "NormalFloat", {
          bg = bg,
        })

        vim.api.nvim_set_hl(0, "FloatBorder", {
          bg = bg,
        })
      end

      set_toggleterm_highlight()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_toggleterm_highlight,
      })
    end,
  },
}
