local platform = require("utils.platform")()

local options = {
  default_prog = {},
  launch_menu = {},
}

if platform.is_win then
  options.default_prog = { "powershell" }
  options.launch_menu = {
    { label = "PowerShell Core", args = { "pwsh" } },
    { label = "PowerShell Desktop", args = { "powershell" } },
    { label = "Command Prompt", args = { "cmd" } },
    { label = "Nushell", args = { "nu" } },
    {
      label = "Git Bash",
      args = { "C:\\Users\\kevin\\scoop\\apps\\git\\current\\bin\\bash.exe" },
    },
    -- {
    --    label = 'Alma Linux',
    --    args = { 'ssh', 'kali@192.168.44.147', '-p', '22' },
    -- },
  }
elseif platform.is_mac or platform.is_linux then
  options.default_prog = { "/bin/zsh", "-l" }
  options.launch_menu = {
    { label = "Zsh", args = { "zsh", "-l" } },
    { label = "Bash", args = { "bash", "-l" } },
    { label = "Fish", args = { "/opt/homebrew/bin/fish", "-l" } },
  }
elseif platform.is_linux then
  options.default_prog = { "zsh", "-l" }
  options.launch_menu = {
    { label = "Zsh", args = { "zsh", "-l" } },
    { label = "Bash", args = { "bash", "-l" } },
    { label = "Fish", args = { "fish", "-l" } },
  }
end

return options
