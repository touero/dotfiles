return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  config = function()
    vim.keymap.set("n", "r", "<cmd>MarkdownPreviewToggle<CR>", { buffer = true, desc = "MarkdownPreviewToggle" })
  end,
}
