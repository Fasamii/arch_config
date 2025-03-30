-- removes terminal padding (kitty) --
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.fn.system({
			"kitty",
			"@",
			"set-spacing",
			"padding=0",
			--"margin=0",
		});
	end,
});
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		vim.fn.system({
			"kitty",
			"@",
			"set-spacing",
			"padding=default",
			"margin=default",
		});
	end,
});

-- font size changing (neovide) --
vim.g.gui_font_default_size = 12
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Fira Code Retina"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function ()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- to set default val on startup
ResetGuiFont()

local opts = { noremap = true, silent = true }
vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-_>", function() ResizeGuiFont(-1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-BS>", function() ResetGuiFont() end, opts)
