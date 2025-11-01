-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.opt.linespace = 13
vim.g.lazyvim_check_order = false
vim.opt.guicursor = table.concat({
  "n-v-c:block", -- 普通模式：方块
  "i-ci-ve:ver25", -- 插入模式：竖线
  "r-cr:hor20", -- 替换模式：下划线
  "o:hor50", -- 选择模式：下划线
}, ",")
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
