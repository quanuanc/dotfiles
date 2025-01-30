return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cond = require('utils').not_in_vscode,
  event = "VeryLazy",
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = {
            preview_width = 0.6,
          },
        },
      },
    })
  end,
}
