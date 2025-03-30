-- Start of Bootstrap lazy.nvim --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- End of Bootstrap lazy.nvim --

local settings = require("config.settings")

require("lazy").setup({
	spec = {
		-- default themes in nvim are quite good -- 
		{ import = "plugins.themes." .. settings.theme, enabled = true, },
		{ import = "plugins.telescope", enabled = true, },
		{ import = "plugins.treesitter", enabled = true, },
		{ import = "plugins.gui.startupScreen", enabled = true, },
		{ import = "plugins.gui.smoothScroll", enabled = settings.smoothScrool, },
		{ import = "plugins.gui.scrollBar", enabled = true, },
		{ import = "plugins.gui.bottomBar", enabled = true, },
		{ import = "plugins.gui.yankHighlight", enabled = true },
		{ import = "plugins.gui.peekLines", enabled = true },
		{ import = "plugins.lsp", enabled = true, },
	},

	checker = {
		enabled = false,
		notify = true,
	},
})
