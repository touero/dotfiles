-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jkf", "<Esc>:wq<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })

vim.api.nvim_set_keymap("n", ";", ":", {})
vim.api.nvim_set_keymap("x", ";", ":", { expr = true })
vim.api.nvim_set_keymap("n", "<Tab>", ">>", {})
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", {})
vim.api.nvim_set_keymap("n", "<CR>", ":normal o<CR>", {})
vim.api.nvim_set_keymap("n", "<S-Enter>", ":normal O<CR>", {})

vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

if vim.g.vscode then
  vim.api.nvim_set_keymap(
    "n",
    "<leader>f",
    "<Cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>",
    { noremap = true, silent = true }
  )
end

vim.api.nvim_set_keymap("n", "<leader>au", "", {
  noremap = true,
  silent = true,
  callback = function()
    local path = vim.fn.expand("%:p")
    path = path:gsub(".*/dotfiles", "$HOME")
    path = path:gsub("^" .. vim.env.HOME, "$HOME")

    local lines = {
      "# " .. path,
      "# @author: weiensong(touero) <touer0018@gmail.com>",
      "# @since: " .. os.date("%Y"),
      "",
    }

    vim.api.nvim_put(lines, "l", false, true)
  end,
})
