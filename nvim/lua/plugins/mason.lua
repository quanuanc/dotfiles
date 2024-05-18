return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  config = function()
    local settings = {
      ui = {
        border = "none",
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }
    require("mason").setup(settings)
  end,
}
