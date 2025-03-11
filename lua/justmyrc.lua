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

M.get_branch_name = function()
    -- FIXME: Небезопасная подстановка пути в команду system
    local current_directory = vim.fn.fnamemodify(vim.fn.system("readlink -f " .. vim.fn.expand("%")), ":h")

    -- FIXME: Небезопасная подстановка пути в команду system
    local git_branch_name = vim.fn.trim(vim.fn.system("git -C " .. current_directory .. " rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d '\r\n'"))

    return git_branch_name
end

local get_tab_label = function(number)
    local buffers_list = vim.fn.tabpagebuflist(number)
    local window_number = vim.fn.tabpagewinnr(number)

    return vim.fn.bufname(buffers_list[window_number])
end

M.get_tab_line = function()
    local tab_line = ""

    for i = 1, vim.fn.tabpagenr("$") do
        if i == vim.fn.tabpagenr() then
            tab_line = tab_line .. "%#TabLineSel#"
        else
            tab_line = tab_line .. "%#TabLine#"
        end

        tab_line = tab_line .. " " .. get_tab_label(i) .. " "
    end

    tab_line = tab_line .. "%#TabLineFill#"

    return tab_line
end

return M
