return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")

		local function setup(name, config)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
			local nvim_lsp = require("mason-lspconfig.mappings.server").package_to_lspconfig[name]
			config.capabilities = require("blink.cmp").get_lsp_capabilities()
			config.on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end
			require("lspconfig")[nvim_lsp].setup(config)
		end

		setup("lua-language-server", {
			settings = {
				Lua = {
					diagnostics = {
  					globals = { "vim" },
					},
				},
			},
		})

		-- TypeScript/JavaScript，避免在 Vue 项目中启动
		setup("typescript-language-server", {
			root_dir = function(fname)
				local util = require("lspconfig.util")
				local vue_root =
					util.root_pattern("vite.config.ts", "vite.config.js", "vue.config.js", "package.json")(fname)
				-- 若项目中包含 .vue 文件，则不启用 tsserver
				if vue_root and vim.fn.glob(vue_root .. "/**/*.vue") ~= "" then
					return nil
				end
				return util.root_pattern("tsconfig.json", "package.json", ".git")(fname)
			end,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			},
		})

		-- Vue / Volar，支持 Vue + TS/JS 文件
		setup("vue-language-server", {
			filetypes = { "vue" },
			init_options = {
				vue = {
					hybridMode = false,
				},
				typescript = {
					tsdk = vim.fn.trim(vim.fn.system("npm root -g")) .. "/typescript/lib",
        },
			},
      languageFeatures = {
        implementation = true,
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        signatureHelp = true,
        codeAction = true,
        workspaceSymbol = true,
        completion = {
          defaultTagNameCase = "both",
          defaultAttrNameCase = "kebabCase",
          getDocumentNameCasesRequest = false,
          getDocumentSelectionRequest = false,
        },
      },
		})

		-- ESLint
		setup("eslint-lsp", {
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
		})

		-- HTML
		setup("html-lsp", {})

		-- CSS
		setup("css-lsp", {})

		-- JSON
		setup("json-lsp", {})

		vim.cmd("LspStart")
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
		})
	end,
}
