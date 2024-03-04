return {
	"ibhagwan/fzf-lua",
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find file",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find buffer",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").grep_visual()
			end,
			desc = "Search in files",
		},
	},
}
