local M = {}

--- @alias side
--- | '"horizontal"'
--- | '"vertical"'

--- @param path  string?  -- path of the file to open
--- @param side  side?    -- horizontal or vertical split
--- @return      string?  -- pane id of the crated pane or nil if something went wrong
local function open_in_tmux_pane(path, side)
    local command = { "tmux", "split-window", "-P", "-F", '"#{pane_id}"' }
    if side == "horizontal" then
        table.insert(command, "-h")
    end

    local nvim_command = "nvim"
    if path then
        nvim_command = nvim_command .. " " .. path
    end

    table.insert(command, nvim_command)

    local res = vim.fn.system(command)

    local pane_id = string.match(res, [[^['"]*(%%%d+)['"]*$]])
    if not pane_id then
        vim.notify(res, vim.log.levels.ERROR)
        return nil
    end

    return pane_id
end

return M
