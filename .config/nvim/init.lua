-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.opt.linespace = 13
vim.g.lazyvim_check_order = false
local handle = io.popen("ip route | awk '/default/ {print $3}'")
local gateway = handle and handle:read("*a"):match("%S+") or ""
if handle then
  handle:close()
end

if gateway:match("^192%.168%.6%.") then
  vim.env.HTTP_PROXY = nil
  vim.env.HTTPS_PROXY = nil
  vim.env.http_proxy = nil
  vim.env.https_proxy = nil
else
  local proxy = "http://127.0.0.1:7890"
  vim.env.HTTP_PROXY = proxy
  vim.env.HTTPS_PROXY = proxy
  vim.env.http_proxy = proxy
  vim.env.https_proxy = proxy
end
