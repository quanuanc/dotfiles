local wezterm = require("wezterm")
local act = wezterm.action
local platform = wezterm.target_triple

local config = {}
local mod = {}

config = wezterm.config_builder()

-- keymaps --
config.disable_default_key_bindings = true
config.leader = { key = " ", mods = "CTRL" }
mod.SUPER = "SUPER"
mod.SUPER_REV = "SUPER|CTRL"
local keys = {
  { key = [[\]], mods = mod.SUPER, action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  { key = [[\]], mods = mod.SUPER_REV, action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "h", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Left" }) },
  { key = "j", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Down" }) },
  { key = "k", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Up" }) },
  { key = "l", mods = mod.SUPER, action = act({ ActivatePaneDirection = "Right" }) },

  { key = "p", mods = mod.SUPER, action = act.ActivateCommandPalette },
  { key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },
  {
    key = "u",
    mods = mod.SUPER,
    action = wezterm.action.QuickSelectArgs({
      label = "open url",
      patterns = {
        "\\((https?://\\S+)\\)",
        "\\[(https?://\\S+)\\]",
        "\\{(https?://\\S+)\\}",
        "<(https?://\\S+)>",
        "\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info("opening: " .. url)
        wezterm.open_with(url)
      end),
    }),
  },
  { key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
  { key = "c", mods = mod.SUPER, action = act.CopyTo("Clipboard") },
  { key = "v", mods = mod.SUPER, action = act.PasteFrom("Clipboard") },
  { key = "w", mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },
  { key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
  { key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
  { key = "n", mods = mod.SUPER, action = act.SpawnWindow },
  { key = "i", mods = mod.SUPER, action = act.QuickSelect },
  { key = "e", mods = mod.SUPER, action = act.ActivateCopyMode },
  {
    key = "k",
    mods = mod.SUPER_REV,
    action = act.Multiple({ act.ClearScrollback("ScrollbackAndViewport"), act.SendKey({ key = "L", mods = "CTRL" }) }),
  },

  -- resizes fonts
  {
    key = "f",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_font",
      one_shot = false,
      timemout_miliseconds = 1000,
    }),
  },
  -- resize panes
  {
    key = "p",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
      timemout_miliseconds = 1000,
    }),
  },
}
for i = 1, 8 do
  table.insert(keys, { key = tostring(i), mods = mod.SUPER, action = act.ActivateTab(i - 1) })
end
local key_tables = {
  resize_font = {
    { key = "k", action = act.IncreaseFontSize },
    { key = "j", action = act.DecreaseFontSize },
    { key = "r", action = act.ResetFontSize },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
  },
  resize_pane = {
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
  },
}
config.keys = keys
config.key_tables = key_tables

-- config --
config.color_scheme = "Afterglow"
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.initial_cols = 155
config.initial_rows = 44
config.font_size = 13
config.front_end = "WebGpu"

-- platform --
if string.find(platform, "windows") then
  config.default_prog = { "powershell.exe" }
elseif string.find(platform, "darwin") then
  config.font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "PingFang SC",
  })
end

return config
