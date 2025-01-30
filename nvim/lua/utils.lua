local M = {}

M.not_in_vscode = function()
  return not vim.g.vscode
end

return M