local wezterm = require("wezterm")

return {
  font = wezterm.font_with_fallback({
    { family = "FiraCode Nerd Font" },
    { family = "JetBrainsMono Nerd Font", weight = "Regular" },
    { family = "JetBrains Mono" },
    { family = "MesloLGS NF" },
    { family = "Monaca" },
    { family = "Noto Sans SC:style=Regular" },
    { family = "Noto Sans Mono CJK SC" },
  }),
  font_size = 15,

  --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
  freetype_load_target = "Light", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  freetype_render_target = "Light", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  harfbuzz_features = { "cv12", "cv01", "cv02", "cv13", "ss05" },
}
