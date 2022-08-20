-- load and error handling
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return

end

-- Better supertab
--local check_backspace = function()
 -- local col = vim.fn.col "." - 1
  --return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

  mapping = {
  -- Chris mappings{{{
    --["<C-k>"] = cmp.mapping.select_prev_item(),
		--["<C-j>"] = cmp.mapping.select_next_item(),
    --["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    --["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    --["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    --["<C-y>"] = cmp.config.disable, -- `cmp.config.disable` to remove the default `<C-y>` mapping.
    --["<C-e>"] = cmp.mapping {
      --i = cmp.mapping.abort(),
      --c = cmp.mapping.close(),
    --},
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    --["<CR>"] = cmp.mapping.confirm { select = false },
    --["<Tab>"] = cmp.mapping(function(fallback)
      --if cmp.visible() then
        --cmp.select_next_item()
      --elseif luasnip.expandable() then
        --luasnip.expand()
      --elseif luasnip.expand_or_jumpable() then
        --luasnip.expand_or_jump()
      --elseif check_backspace() then
        --fallback()
      --else
        --fallback()
      --end
    --end, {
      --"i",
      --"s",
    --}),
    --["<S-Tab>"] = cmp.mapping(function(fallback)
      --if cmp.visible() then
        --cmp.select_prev_item()
      --elseif luasnip.jumpable(-1) then
        --luasnip.jump(-1)
      --else
        --fallback()
      --end
    --end, {
      --"i",
      --"s",
    --}),}}}
    -- TJ mappings{{{
    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<c-l>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),

    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },

    ["<tab>"] = cmp.config.disable,

    -- Testing
    ["<c-q>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },--}}}
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      --vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        npm = "[npm]",
        luasnip = "[snippet]",
        -- ultisnips = "[ultisnip]",
        nvim_lua = "[lua_API]",
        nvim_lsp = "[lsp]",
        buffer = "[buffer]",
        calc = "[calc]",
        path = "[path]",
      })[entry.source.name]
      return vim_item
    end,
  },

  sources = {
    { name = "npm" },       -- npm

    { name = "luasnip" },   -- Main snippets
    -- { name = "ultisnips" },

    { name = "nvim_lua" },  -- Lua API
    { name = "nvim_lsp" },  -- LSP
    { name = "buffer" },    -- Text
    { name = "calc" },      -- Calculator
    { name = "path", keyword_length = 5 },      -- Folder path
  },

  -- other options
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },

  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

-- cmdline completion '/' and ':'
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Comments
-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }

-- Load snippets
-- Lazy load VSlike (friendly snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- Lazy load .snipmate snippets
-- require("luasnip.loaders.from_snipmate").lazy_load()

