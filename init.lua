require("user")
local utils = require("utils")

utils.fix_telescope_parens_win()
-- make help and man open up on the side instead above
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	command = "wincmd L",
})

vim.cmd("colorscheme vague")
-- vim.cmd("colorscheme base16-black-metal-gorgoroth")
if vim.g.colors_name == "vague" then
	utils.color_overrides.vague_line_colors()
	utils.color_overrides.vague_status_colors()
elseif vim.g.colors_name == "base16-black-metal-gorgoroth" then
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })
	vim.api.nvim_set_hl(0, "TSComment", { fg = "#555555", gui = nil })
	vim.api.nvim_set_hl(0, "Visual", { bg = "#8c7f70", fg = "#d6d2c8" })

	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })
end

vim.api.nvim_create_user_command("VagueStatus", utils.color_overrides.vague_status_colors, {})
vim.api.nvim_create_user_command("VagueLine", utils.color_overrides.vague_line_colors, {})
vim.api.nvim_create_user_command("DefStatus", function()
	require("lualine").setup({ options = { theme = "auto" } })
end, {})
