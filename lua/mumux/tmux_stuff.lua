local M = {}

---@alias side
---| '"horizontal"'
---| '"vertical"'
---@param path  string
---@param side  side
function M.open_in_tmux_pane(path, side)
    local base_command = { "tmux", "split-window" }
    if side == "horizontal" then
        table.insert(base_command, "-h")
    end

    table.insert(base_command, "nvim " .. path)

    local result = vim.fn.system(base_command)
    print(result)
end

return M
