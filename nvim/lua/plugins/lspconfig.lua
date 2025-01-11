return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(mod, keys, func, desc)
          vim.keymap.set(mod, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
        map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
        map("n", "gR", vim.lsp.buf.references, "Goto References")
        map("n", "<M-k>", vim.lsp.buf.hover, "Hover")
        map("i", "<M-k>", vim.lsp.buf.hover, "Hover")
        map("n", "<M-j>", vim.diagnostic.open_float, "Diagnostic")
        map("i", "<M-j>", vim.diagnostic.open_float, "Diagnostic")
        map("n", "<leader>li", "<CMD>LspInfo<CR>", "Lsp info")
        map("n", "<M-CR>", vim.lsp.buf.code_action, "Code Action")
        map("i", "<M-CR>", vim.lsp.buf.code_action, "Code Action")
        map("n", "cd", vim.lsp.buf.rename, "Rename symbol")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
            end,
          })
        end
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map("n", "<leader>ih", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, "Toggle Inlay Hints")
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            format = {
              enable = false,
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      jsonls = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "prettierd",
      "clang-format",
      "biome",
    })

    require("mason").setup()
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
