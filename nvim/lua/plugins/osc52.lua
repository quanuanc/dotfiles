return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    local is_ssh = os.getenv("SSH_CONNECTION") ~= nil
    if not is_ssh then
      return
    else
      require("osc52").setup({
        max_length = 0, -- Maximum length of selection (0 for no limit)
        silent = true, -- Disable message on successful copy
        trim = false, -- Trim surrounding whitespaces before copy
        tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
      })

      local function copy()
        if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
          require("osc52").copy_register("+")
        end
      end
      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end
  end,
}
