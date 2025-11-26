return {
	"goolord/alpha-nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		-- local dashboard = require'alpha.themes.dashboard'
		local dashboard = require("alpha.themes.startify")

		-- https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=NEOVIM
		--[[dashboard.section.header.val = {
        '  █████▒█    ██  ▄████▄   ██ ▄█▀   ▓██   ██▓ ▒█████   █    ██ ',
        '▓██   ▒ ██  ▓██▒▒██▀ ▀█   ██▄█▒     ▒██  ██▒▒██▒  ██▒ ██  ▓██▒',
        '▒████ ░▓██  ▒██░▒▓█    ▄ ▓███▄░      ▒██ ██░▒██░  ██▒▓██  ▒██░',
        '░▓█▒  ░▓▓█  ░██░▒▓▓▄ ▄██▒▓██ █▄      ░ ▐██▓░▒██   ██░▓▓█  ░██░',
        '░▒█░   ▒▒█████▓ ▒ ▓███▀ ░▒██▒ █▄     ░ ██▒▓░░ ████▓▒░▒▒█████▓ ',
        ' ▒ ░   ░▒▓▒ ▒ ▒ ░ ░▒ ▒  ░▒ ▒▒ ▓▒      ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒ ',
        ' ░     ░░▒░ ░ ░   ░  ▒   ░ ░▒ ▒░    ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░ ',
        ' ░ ░    ░░░ ░ ░ ░        ░ ░░ ░     ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░ ',
        '          ░     ░ ░      ░  ░       ░ ░         ░ ░     ░     ',
        '                ░                   ░ ░                       ',
        }]]

		local header = {
			"  ██▒   █▓ ██▓ ███▄ ▄███▓",
			" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
			"  ▓██  █▒░▒██▒▓██    ▓██░",
			"   ▒██ █░░░██░▒██    ▒██ ",
			"    ▒▀█░  ░██░▒██▒   ░██▒",
			"    ░ ▐░  ░▓  ░ ▒░   ░  ░",
			"    ░ ░░   ▒ ░░  ░      ░",
			"      ░░   ▒ ░░      ░   ",
			"       ░   ░         ░   ",
			"      ░                  ",
			" ",
		}

		local fortune = require("alpha.fortune")

		math.randomseed(os.time())

		-- :hi to see the hilight group and choose one
		-- local header_color = "Constant"
		-- local header_color = "Todo"
		-- local header_color = "Error"
		-- local header_color = "Conditional"
		local header_color = "TelescopeMultiIcon"

		-- dashboard.section.header.opts = { hl = header_color, position = "center" }
		dashboard.section.header.opts = { hl = header_color }

		local footer = fortune()
		for i = 1, #footer do
			header[#header + 1] = footer[i]
		end

		dashboard.section.header.val = header

		alpha.setup(dashboard.config)

		vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
        ]])
	end,
}
