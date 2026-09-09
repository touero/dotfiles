return {
  "lervag/vimtex",
  tag = "v2.18",
  lazy = false,
  init = function()
    local is_mac = vim.fn.has("mac") == 1
    if is_mac then
      local texbin = "/Library/TeX/texbin"
      if vim.fn.isdirectory(texbin) == 1 and not vim.env.PATH:find(texbin, 1, true) then
        vim.env.PATH = texbin .. ":" .. vim.env.PATH
      end
    end

    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-xelatex",
      pdflatex = "-pdf",
      luatex = "-lualatex",
      lualatex = "-lualatex",
      xelatex = "-xelatex",
    }

    local latexmk_config = {
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    if is_mac then
      latexmk_config.executable = "/Library/TeX/texbin/latexmk"
    end

    vim.g.vimtex_compiler_latexmk = latexmk_config
  end,
}
