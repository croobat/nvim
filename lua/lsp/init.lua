-- Github copilot
require "../plugins/copilot"

-- Mappings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Lsp handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-- Icons
local signs = {
	{ name = "DiagnosticSignError", text = "x" },
	{ name = "DiagnosticSignWarn",  text = "w" },
	{ name = "DiagnosticSignHint",  text = "i" },
	{ name = "DiagnosticSignInfo",  text = "?" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Config
local config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

-- Execute after attached server
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- buffer mappings
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
				augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
				augroup END
			]],
			false
		)
	end
end

local lsp_flags = {
	debounce_text_changes = 150,
}

-- vue server path
local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
	'/node_modules/@vue/language-server'

-- CPM support
local def_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities(def_capabilities)
local lspconfig = require('lspconfig')


local default_servers = {
	"intelephense",
	"html",
	"emmet_ls",
	"bashls",
	"jqls",
	"sqlls",
	"volar",
	"jsonls",
	"marksman",
}

for _, server in ipairs(default_servers) do
	lspconfig[server].setup {
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
	}
end

vim.g.intelephense_format_concatenation_no_spaces = 1
lspconfig.intelephense.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		intelephense = {
			diagnostics = {
				undefinedProperties = false,
			},
		},
	},
}

lspconfig.pyright.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
}

lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {}
	}
}

lspconfig.lua_ls.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		Lua = {
			-- https://luals.github.io/wiki/settings
			runtime = {
				version = 'Lua 5.3',
			},
			path = {
				'?.lua',
				'?/init.lua',
				vim.fn.expand '~/.luarocks/share/lua/5.3/?.lua',
				vim.fn.expand '~/.luarocks/share/lua/5.3/?/init.lua',
				'/usr/share/5.3/?.lua',
				'/usr/share/lua/5.3/?/init.lua'
			},
			workspace = {
				library = {
					vim.fn.expand '~/.luarocks/share/lua/5.3',
					'/usr/share/lua/5.3',
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			diagnostics = {
				globals = { "vim", "awesome", "client", "root", "screen", "tag", "mouse", "root", "screen", "tag", "mouse" },
			},
			completion = {
				telemetry = {
					enable = false,
				},
			},
		},
	},
}

lspconfig.tsserver.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue"
	},
	init_options = {
		hostInfo = "neovim",
		html = {
			options = {
				-- options: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
				["output.format"] = true,
			},
		},
		plugins = {
			{
				name = '@vue/typescript-plugin',
				location = vue_language_server_path,
				languages = { 'vue' },
			},
		},
	}
}

lspconfig.eslint.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
	},
}

lspconfig.clangd.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	cmd = { "clangd", "--offset-encoding=utf-16" },
}

lspconfig.cssls.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
	}
}
