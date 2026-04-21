return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal",
      size = 20,
      shading_factor = 0,
      shade_terminals = false,
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
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
        desc = "Leave terminal focus",
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
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local function set_toggleterm_highlight()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
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
        callback = function()
          set_toggleterm_highlight()
        end,
      })
    end,
  },
}
