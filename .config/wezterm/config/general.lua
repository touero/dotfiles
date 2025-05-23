local session_type = os.getenv("XDG_SESSION_TYPE")
local is_wayland = session_type == "wayland"

return {
  enable_wayland = is_wayland,
  enable_zwlr_output_manager = is_wayland,
  automatically_reload_config = true,
  check_for_updates = false,
  exit_behavior = "CloseOnCleanExit", -- if the shell program exited with a successful status
  status_update_interval = 1000,

  -- scrollbar
  scrollback_lines = 5000,

  -- paste behaviours
  canonicalize_pasted_newlines = "CarriageReturn",

  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
      format = "$0",
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },
}
