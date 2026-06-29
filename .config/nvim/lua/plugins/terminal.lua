return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",

    opts = {
      open_mapping = [[<C-\>]],
      direction = "float",
      shading_factor = 0,
      shade_terminals = false,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
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

      local function set_terminal_keymaps()
        local keymap_opts = {
          buffer = 0,
          silent = true,
        }

        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], keymap_opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], keymap_opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], keymap_opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], keymap_opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], keymap_opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], keymap_opts)
      end

      set_toggleterm_highlight()

      local group = vim.api.nvim_create_augroup("ToggleTermConfig", {
        clear = true,
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_toggleterm_highlight,
      })

      vim.api.nvim_create_autocmd("TermOpen", {
        group = group,
        pattern = "term://*toggleterm#*",
        callback = set_terminal_keymaps,
      })
    end,
  },
}
