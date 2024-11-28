return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = false,
        virtual_text = false,
      },
      servers = { eslint = {}, sourcekit = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)

          -- local lspconfig = require("lspconfig")
          -- lspconfig.sourcekit.setup({
          --   capabilities = {
          --     workspace = {
          --       didChangeWatchedFiles = {
          --         dynamicRegistration = true,
          --       },
          --     },
          --   },
          -- })
        end,
      },
    },
  },
}
