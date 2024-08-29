return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip").filetype_extend(
          "javascript",
          { "javascriptreact", "typescript", "typescriptreact", "jsdoc", "tsdoc" }
        )
        require("luasnip").filetype_extend(
          "javascriptreact ",
          { "javascript", "typescript", "typescriptreact", "jsdoc", "tsdoc" }
        )
        require("luasnip").filetype_extend(
          "typescript",
          { "javascript", "javascriptreact", "typescriptreact", "jsdoc", "tsdoc" }
        )
        require("luasnip").filetype_extend(
          "typescriptreact",
          { "javascript", "javascriptreact", "typescript", "jsdoc", "tsdoc" }
        )
        require("luasnip").filetype_extend("vue", { "javascript", "typescript", "jsdoc", "tsdoc" })

        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
}
