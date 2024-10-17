local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.legacy"),
  require("plugins.theme"),
  require("plugins.neo-tree"),
  require("plugins.gitsigns"),
  require("plugins.telescope"),
  require("plugins.lspconfig"),
  require("plugins.conform"),
  require("plugins.mason"),
  require("plugins.cmp"),
  require("plugins.auto-save"),
  require("plugins.autopairs"),
  require("plugins.flash"),
  require("plugins.im-select"),
  require("plugins.osc52"),
  require("plugins.substitute"),
  require("plugins.surround"),
  require("plugins.treesitter"),
  require("plugins.ufo"),
  require("plugins.bg"),
})
