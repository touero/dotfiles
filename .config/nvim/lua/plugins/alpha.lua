return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local header = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                           weiensong touero                            ]],
    }

    dashboard.section.header.val = header

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰮗  Find file", ":lua require('fzf-lua').files()<CR>"),
      dashboard.button("e", "  File explorer", ":Neotree reveal<CR>"),
      dashboard.button("w", "  Find word", ":lua require('fzf-lua').live_grep()<CR>"),
      dashboard.button("r", "󰑓  Recent", ":lua require('fzf-lua').oldfiles()<CR>"),
      dashboard.button("y", "󰇥  Yazi", ":Yazi<CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
      dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("m", "  Mason", ":Mason<CR>"),
      dashboard.button("q", "󰿅  Quit", ":qa<CR>"),
    }

    dashboard.section.header.opts.hl = "DashboardHeader"

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl_shortcut = "DashboardButtonKey"
      button.opts.hl = "DashboardButtonText"
    end

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local plugins = require("lazy").stats()
        local time = (math.floor(plugins.startuptime * 100) / 100)
        local footer_hl = "DashboardFooterNormal"

        if time > 60 then
          footer_hl = "DashboardFooterRed"
        elseif time > 50 then
          footer_hl = "DashboardFooterOrange"
        end

        dashboard.section.footer.opts.hl = footer_hl

        dashboard.section.footer.val = {
          " ",
          " ",
          " ",
          "󱐌 " .. plugins.count .. " plugins loaded in " .. time .. " ms",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
