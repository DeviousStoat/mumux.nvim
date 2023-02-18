local mumux = require("mumux")

vim.api.nvim_create_user_command("Mumux", function(opts)
	mumux.open_in_tmux_pane(opts.args, "horizontal", opts.bang)
end, { nargs = "?", complete = "file", bang = true })

vim.api.nvim_create_user_command("VMumux", function(opts)
	mumux.open_in_tmux_pane(opts.args, "vertical", opts.bang)
end, { nargs = "?", complete = "file", bang = true })
