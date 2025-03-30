require("config.envTweaks");
require("config.remap");
require("config.options");
require("config.plugins");

-- colorscheme --
-- vim.cmd.colorscheme("wildcharm");
vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" });
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });

--[[
local lines = 0;
for _ in io.lines(vim.api.nvim_buf_get_name(0)) do
	lines = lines + 1;
end
print(lines);
]]--
