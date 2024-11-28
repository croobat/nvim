return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

			-- remove copilot
			table.remove(opts.sources, 1)

      opts.preselect = cmp.PreselectMode.None
      opts.experimental.ghost_text = false

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-l>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
        ["<CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<C-j>"] = cmp.mapping(function()
          if vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(1)
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
          if vim.snippet.active({ direction = -1 }) then
            vim.snippet.jump(-1)
          end
        end, { "i", "s" }),
      })
    end,
  },
}
