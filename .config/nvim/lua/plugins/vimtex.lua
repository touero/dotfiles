return {
  "lervag/vimtex",
  -- Current master requires Neovim 0.12.4+. Pin to the latest release that
  -- supports Neovim 0.11.x; remove this after upgrading Neovim.
  tag = "v2.18",
  lazy = false,
  init = function()
    -- MacTeX installs CLI tools here. Add it to Neovim's environment so
    -- latexmk can also find latex/pdflatex/xelatex when it spawns them.
    local texbin = "/Library/TeX/texbin"
    if vim.fn.isdirectory(texbin) == 1 and not vim.env.PATH:find(texbin, 1, true) then
      vim.env.PATH = texbin .. ":" .. vim.env.PATH
    end

    -- Use XeLaTeX by default. VimTeX appends the engine after `options`, so
    -- this must be set via `vimtex_compiler_latexmk_engines`, not as an option.
    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-xelatex",
      pdflatex = "-pdf",
      luatex = "-lualatex",
      lualatex = "-lualatex",
      xelatex = "-xelatex",
    }

    vim.g.vimtex_compiler_latexmk = {
      executable = "/Library/TeX/texbin/latexmk",
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
  end,
}
