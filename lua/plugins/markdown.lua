return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.cmd([[
            let g:mkdp_echo_preview_url = 1
            let g:mkdp_auto_start = 1
            nmap <leader>m     <Plug>MarkdownPreviewToggle
        ]])
	end,
}
