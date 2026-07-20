return {
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",

    keys = {
      {
        "<leader>gd",
        "<cmd>CodeDiff<cr>",
        desc = "Open Git Diff",
      },
      {
        "<leader>gh",
        "<cmd>CodeDiff history<cr>",
        desc = "Open Git History",
      },
    },

    opts = {
      explorer = {
        position = "left",
        width = 40,
        hidden = false,
        initial_focus = "explorer",

        view_mode = "tree",
        flatten_dirs = true,
        indent_markers = true,

        auto_refresh = true,
        auto_open_on_cursor = true,
        focus_on_select = false,

        file_filter = {
          ignore = {
            ".git/**",
            ".jj/**",
            "node_modules/**",
            "dist/**",
            "build/**",
            ".venv/**",
            "venv/**",
            "__pycache__/**",
          },
        },

        visible_groups = {
          staged = true,
          unstaged = true,
          conflicts = true,
        },
      },

      diff = {
        layout = "side-by-side",
        original_position = "left",

        jump_to_first_change = true,
        disable_inlay_hints = true,
        ignore_trim_whitespace = false,

        cycle_next_hunk = true,
        cycle_next_file = true,
        cycle_hunks_across_files = true,

        compact_context_lines = 3,
        compact_sync_folds = true,

        hide_merge_artifacts = true,
        max_computation_time_ms = 5000,
        highlight_priority = 100,
      },

      history = {
        position = "bottom",
        height = 15,
        initial_focus = "history",
        view_mode = "tree",
      },

      keymaps = {
        view = {
          quit = "q",

          toggle_explorer = "<leader>b",
          focus_explorer = "<leader>e",

          next_hunk = "]c",
          prev_hunk = "[c",

          next_file = "]f",
          prev_file = "[f",

          diff_get = "do",
          diff_put = "dp",

          open_in_prev_tab = "gf",
          close_on_open_in_prev_tab = false,

          toggle_stage = "-",
          stage_hunk = "<leader>hs",
          unstage_hunk = "<leader>hu",
          discard_hunk = "<leader>hr",

          hunk_textobject = "ih",

          show_help = "g?",
          toggle_layout = "t",
          toggle_compact = "gc",
        },

        explorer = {
          select = "<CR>",
          hover = "K",
          refresh = "R",

          toggle_view_mode = "i",

          stage_all = "S",
          unstage_all = "U",
          restore = "X",

          toggle_changes = "gu",
          toggle_staged = "gs",

          fold_open = "zo",
          fold_open_recursive = "zO",
          fold_close = "zc",
          fold_close_recursive = "zC",
          fold_toggle = "za",
          fold_toggle_recursive = "zA",
          fold_open_all = "zR",
          fold_close_all = "zM",
        },

        history = {
          select = "<CR>",
          toggle_view_mode = "i",
          refresh = "R",

          fold_open = "zo",
          fold_open_recursive = "zO",
          fold_close = "zc",
          fold_close_recursive = "zC",
          fold_toggle = "za",
          fold_toggle_recursive = "zA",
          fold_open_all = "zR",
          fold_close_all = "zM",
        },

        conflict = {
          accept_incoming = "<leader>ct",
          accept_current = "<leader>co",
          accept_both = "<leader>cb",
          discard = "<leader>cx",

          accept_all_incoming = "<leader>cT",
          accept_all_current = "<leader>cO",
          accept_all_both = "<leader>cB",
          discard_all = "<leader>cX",

          next_conflict = "]x",
          prev_conflict = "[x",

          diffget_incoming = "2do",
          diffget_current = "3do",
        },
      },
    },
  },
}
