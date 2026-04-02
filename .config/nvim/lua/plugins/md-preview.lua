return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }

    vim.g.mkdp_auto_close = 1

    vim.g.mkdp_preview_options = {
      sync_scroll_type = "middle",
      hide_yaml_meta = 1,
      disable_sync_scroll = 0,
    }

    vim.g.mkdp_page_title = "「${name}」"

    vim.g.mkdp_theme = "dark"
  end,
  ft = { "markdown" },
  config = function()
    vim.keymap.set("n", "r", "<cmd>MarkdownPreviewToggle<CR>", { buffer = true, desc = "MarkdownPreviewToggle" })

    vim.opt_local.updatetime = 100
  end,
}
