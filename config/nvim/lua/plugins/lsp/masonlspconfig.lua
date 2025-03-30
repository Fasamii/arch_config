return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "mason.nvim" },
	config = function()
		require("mason-lspconfig").setup();
		require("mason-lspconfig").setup_handlers({
			function(server_name)

				-- for removing diagnostic (annoying) -- 
				vim.diagnostic.config({
					signs = false,
				})
				-- or --
				--[[
				vim.fn.sign_define("DiagnosticSignError", { text = "" })
				vim.fn.sign_define("DiagnosticSignWarn",  { text = "" })
				vim.fn.sign_define("DiagnosticSignInfo",  { text = "" })
				vim.fn.sign_define("DiagnosticSignHint",  { text = "" })
				]]--

				require("lspconfig")[server_name].setup({});
			end,
		});
	end,
}
