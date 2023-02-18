local M = {}

--- @alias side
--- | '"vertical"'
--- | '"horizontal"'

--- @param path  string?  -- path of the file to open
--- @param side  side?    -- horizontal or vertical split
--- @param shell boolean? -- in a proper shell
--- @return      string?  -- pane id of the crated pane or nil if something went wrong
function M.open_in_tmux_pane(path, side, shell)
    local command = { "tmux", "split-window", "-P", "-F", '"#{pane_id}"' }
    if side == "vertical" then
        table.insert(command, "-h")
    end

    local nvim_command = "nvim"
    if path then
        nvim_command = nvim_command .. " " .. path
    end

    if not shell then
        table.insert(command, nvim_command)
    end

    local res = vim.fn.system(command)

    local pane_id = string.match(res, [[^['"]*(%%%d+)['"]*%s*$]])
    if not pane_id then
        vim.notify(res, vim.log.levels.ERROR)
        return nil
    end

    if shell then
        vim.fn.system({ "tmux", "send-keys", "-t", pane_id, nvim_command, "Enter" })
    end

    return pane_id
end

return M
