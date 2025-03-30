vim.g.mapleader = " ";

vim.keymap.set("n", "<leader>fd", vim.cmd.Ex);
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float);
vim.keymap.set("n", "<C-d>", "<C-d>zz");
