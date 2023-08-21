-- Configure and set the Everforest theme
vim.o.termguicolors = true
vim.g.everforest_background = "hard" -- Choose between 'hard', 'soft', and 'medium'
vim.g.everforest_enable_italic = 1
vim.g.everforest_disable_italic_comment = 1
vim.g.everforest_transparent_background = 1
vim.g.everforest_dim_inactive_windows = 1


vim.cmd("colorscheme everforest")

function ColorMyPencils(color) 
	color = color or "everforest"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
