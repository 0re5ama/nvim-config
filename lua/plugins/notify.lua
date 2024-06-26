return {
	"rcarriga/nvim-notify", -- lazify during notification
	config = function()
		require("notify").setup({
			background_colour = "#000000",
			-- background_colour = "NotifyBackground",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "fade_in_slide_out",
			timeout = 5000,
			top_down = false,
		})
		vim.notify = require("notify")
	end,
}
