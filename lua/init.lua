require'nvim-treesitter.configs'.setup{
	ensure_installed = { "go", "typescript" },
  	sync_install = false,
  	auto_install = true,
  	-- ignore_install = { "javascript" }
  	highlight = {
  		enable = true,
  		additional_vim_regex_highlighting = false,
	},
}

require'lspconfig'.gopls.setup {
	cmd = {"/home/jarvis/go/bin/gopls", "serve"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = require'lspconfig'.util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = { analyses = { unusedparams = true, }, staticcheck = true, },
    },
 	single_file_support = true,
}

require'lspconfig'.tsserver.setup{
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	init_options = { host_info = "neovim" },
	root_dir = require'lspconfig'.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

