-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("notify").setup({background_colour = "#000000"})
local handle = io.popen("ip route | grep 'default' | awk '{print $3}'")
local gateway = ""

if handle then
    gateway = handle:read("*a") or ""
    handle:close()
end

if gateway:match("^192%.168%.6%.") then
    vim.env.HTTP_PROXY = "http://127.0.0.1:7890"
    vim.env.HTTPS_PROXY = "http://127.0.0.1:7890"
end
