local wezterm = require('wezterm')
-- local colors = require('colors.custom')
local platform = require('utils.platform')()

local config = {}
if platform.is_mac then
   config.button_style = 'MacOsNative'
   config.button_alignment = 'Left'
elseif platform.is_linux then
   config.button_style = 'Gnome'
   config.button_alignment = 'Right'
else
   config.buttun_style = 'Windows'
   config.button_alignment = 'Right'
end

return {
   term = 'xterm-256color',
   animation_fps = 60,
   max_fps = 60,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   warn_about_missing_glyphs = false,

   -- color scheme
   -- colors = colors, if you want to setting your color custom
   color_scheme = 'Gruvbox dark, medium (base16)',

   -- Set to deault rows and columns
   initial_cols = 175,
   initial_rows = 43,

   -- background
   window_background_opacity = 1.00,
   win32_system_backdrop = 'Acrylic',
   background = {
      {
         source = { File = wezterm.config_dir .. '/backdrops/bg_img2.jpg' },
      },
      {
         source = { Color = '#1d2021' },
         height = '100%',
         width = '100%',
         opacity = 0.95,
      },
   },

   -- scrollbar
   enable_scroll_bar = true,
   min_scroll_bar_height = '3cell',
   colors = {
      scrollbar_thumb = '#34354D',
   },

   -- tab bar
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = true,
   tab_max_width = 25,
   show_tab_index_in_tab_bar = true,
   switch_to_last_active_tab_when_closing_tab = true,

   -- cursor
   default_cursor_style = 'BlinkingBlock',
   cursor_blink_ease_in = 'Constant',
   cursor_blink_ease_out = 'Constant',
   cursor_blink_rate = 0,

   -- window
   adjust_window_size_when_changing_font_size = true,
   window_decorations = 'INTEGRATED_BUTTONS|RESIZE',
   integrated_title_button_style = config.button_style,
   integrated_title_button_color = '#282828',
   integrated_title_button_alignment = config.button_alignment,

   window_padding = {
      left = 5,
      right = 10,
      top = 12,
      bottom = 7,
   },
   window_close_confirmation = 'AlwaysPrompt',
   window_frame = {
      active_titlebar_bg = '#282828',
      inactive_titlebar_bg = '#282828',
      -- font = fonts.font,
      -- font_size = fonts.font_size,
   },
   inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
