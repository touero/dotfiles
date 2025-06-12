---@alias lc.lang
---| "cpp"
---| "java"
---| "python"
---| "python3"
---| "c"
---| "csharp"
---| "javascript"
---| "typescript"
---| "php"
---| "swift"
---| "kotlin"
---| "dart"
---| "golang"
---| "ruby"
---| "scala"
---| "rust"
---| "racket"
---| "erlang"
---| "elixir"
---| "bash"

---@alias lc.hook
---| "enter"
---| "question_enter"
---| "leave"

---@alias lc.size
---| string
---| number
---| { width: string | number, height: string | number }

---@alias lc.position "top" | "right" | "bottom" | "left"

---@alias lc.direction "col" | "row"

---@alias lc.inject { before?: string|string[], after?: string|string[] }

---@alias lc.storage table<"cache"|"home", string>

---@alias lc.picker { provider?: "fzf-lua" | "telescope" }

local posision = "left"
if vim.fn.has("macunix") == 1 then
  posision = "top"
end

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    ---@type string
    arg = "lt",
    ---@type lc.lang
    lang = "python3",
    cn = {
      enabled = true, ---@type boolean
      translator = true, ---@type boolean
      translate_problems = true, ---@type boolean
    },
    description = {
      position = posision, ---@type lc.position
      width = "35%", ---@type lc.size
      show_stats = true, ---@type boolean
    },
  },
}
