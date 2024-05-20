return {
	"lervag/vimtex",
    ft = 'tex',
	config = function()
		vim.cmd([[
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_view_general_viewer = 'zathura'
        ]])
	end,
}
