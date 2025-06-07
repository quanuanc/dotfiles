local wezterm = require("wezterm")
local act = wezterm.action
local platform = wezterm.target_triple

-- config --
local M = wezterm.config_builder()
M.disable_default_key_bindings = true
M.window_close_confirmation = 'NeverPrompt'
M.leader = { key = " ", mods = "CTRL" }
M.tab_bar_at_bottom = true
M.hide_tab_bar_if_only_one_tab = true
M.initial_cols = 150
M.initial_rows = 42
M.font_size = 13
M.front_end = "WebGpu"
M.color_scheme = "Dracula"
M.command_palette_rows = 7
M.max_fps = 120

local mod = {}
mod.SUPER = "SUPER"
mod.SUPER_REV = "SUPER|CTRL"
mod.SUPER_SHIFT = "SUPER|SHIFT"
mod.CTRL = "CTRL"
mod.CTRL_SHIFT = "SHIFT|CTRL"

-- keymaps --
local keys = {
  { key = "Tab", mods = mod.CTRL, action = act.ActivateTabRelative(1) },
  { key = "d", mods = mod.SUPER, action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "d", mods = mod.SUPER_SHIFT, action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
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
M.keys = keys
M.key_tables = key_tables

-- platform --
if string.find(platform, "windows") then
  M.default_prog = { "powershell.exe" }
elseif string.find(platform, "darwin") then
  M.font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "PingFang SC",
  })
end

return M
