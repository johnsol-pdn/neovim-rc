local M = {}

local modes = {
    [ "n" ] = "NORMAL",
    [ "c" ] = "COMMAND",
    [ "i" ] = "INSERT",
    [ "v" ] = "VISUAL",
    [ "V" ] = "VISUAL-LINE",
    [ "" ] = "VISUAL-BLOCK",
    [ "R" ] = "REPLACE"
}

M.get_mode = function()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format("%s", modes[current_mode])
end


return M
