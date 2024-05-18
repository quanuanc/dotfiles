return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  config = function()
    local function is_window_or_mac()
      local is_windows = vim.fn.has("win32") == 1
      local is_mac = vim.fn.has("mac") == 1

      return is_windows or is_mac
    end

    if is_window_or_mac() then
      require("im_select").setup({
        set_previous_events = {},
      })
    end
  end,
}
