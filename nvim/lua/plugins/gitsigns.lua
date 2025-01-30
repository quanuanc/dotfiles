return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  cond = require('utils').not_in_vscode,
  config = function()
    require("gitsigns").setup()
  end,
}
