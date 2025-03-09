-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("notify").setup({background_colour = "#000000"})
vim.env.HTTP_PROXY = "http://127.0.0.1:7890"
vim.env.HTTPS_PROXY = "http://127.0.0.1:7890"
