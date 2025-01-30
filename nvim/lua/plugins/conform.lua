return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  cond = require('utils').not_in_vscode,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        json = { "biome" },
        python = { "ruff_format" },
        beancount = { "bean_black" },
        ["_"] = { "prettierd", "prettier" },
      },
      formatters = {
        bean_black = {
          command = "bean-black",
          args = { "-s" },
          stdin = true,
        },
      },
    })
  end,
}
