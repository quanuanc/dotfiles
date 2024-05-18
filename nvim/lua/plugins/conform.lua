return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        c = { "clang-format" },
        swift = { "swiftformat" },
        yaml = { { "prettierd", "prettier" } },
        json = { "biome" },
      },
    })
  end,
}
