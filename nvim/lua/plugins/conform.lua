return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        json = { "biome" },
        python = { "ruff_format" },
        ["_"] = { { "prettierd", "prettier" } },
      },
    })
  end,
}
