return {
  "garymjr/nvim-snippets",
  opts = {
    friendly_snippets = true,
    extended_filetypes = {
      javascript = { "javascriptreact", "typescript", "typescriptreact", "jsdoc", "tsdoc" },
      javascriptreact = { "javascript", "typescript", "typescriptreact", "jsdoc", "tsdoc" },
      typescript = { "javascript", "javascriptreact", "typescriptreact", "jsdoc", "tsdoc" },
      typescriptreact = { "javascript", "javascriptreact", "typescript", "jsdoc", "tsdoc" },
      vue = { "javascript", "typescript", "jsdoc", "tsdoc" },
    },
  },
  dependencies = { "rafamadriz/friendly-snippets" },
}
