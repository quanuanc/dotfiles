return {
  "gbprod/substitute.nvim",
  event = "VeryLazy",
  config = function()
    require("substitute").setup()
  end,
}
