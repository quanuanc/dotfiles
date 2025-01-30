return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cond = require('utils').not_in_vscode,
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "css",
        "diff",
        "java",
        "go",
        "javascript",
        "html",
        "ini",
        "json",
        "lua",
        "vim",
        "sql",
        "vimdoc",
        "beancount",
        "kotlin",
        "nix",
        "swift",
      },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
    })
  end,
}
