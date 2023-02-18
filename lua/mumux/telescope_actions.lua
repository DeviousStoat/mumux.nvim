local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
    error("nvim-telescope/telescope.nvim needs to be installed to use telescope actions from mumux.nvim")
end

local mumux = require("mumux")

--- @param prompt_bufnr number
--- @param side         side
--- @param shell        boolean
local function mumux_action(prompt_bufnr, side, shell)
    local selected_path = require("telescope.actions.state").get_selected_entry().value
    require("telescope.actions").close(prompt_bufnr)

    mumux.open_in_tmux_pane(selected_path, side, shell)
end

return require("telescope.actions.mt").transform_mod({
    open_in_vertical_pane = function(prompt_bufnr)
        mumux_action(prompt_bufnr, "vertical", false)
    end,
    open_in_horizontal_pane = function(prompt_bufnr)
        mumux_action(prompt_bufnr, "horizontal", false)
    end,
    open_in_vertical_pane_shell = function(prompt_bufnr)
        mumux_action(prompt_bufnr, "vertical", true)
    end,
    open_in_horizontal_pane_shell = function(prompt_bufnr)
        mumux_action(prompt_bufnr, "horizontal", true)
    end,
})
