-- ===== Базовая конфигурация =====
vim.opt.encoding = "utf8"

-- Параметры сохранения позиции курсора в файлах
--   :<n> - сохранять историю команд в количестве <n> строк
--   % - сохранение списка буферов
--   h - не подсвечивать прошлый поиск при открытии файла
--   n - путь до ShaDa
vim.opt.shada = "'10,\"100,:20,%,h,n~/.viminfo"

-- Настройка переноса строк
vim.opt.wrap = false

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Перенос курсора в визуальном режиме на следующую/предыдущую строку при нажатии Backspace, Space, Left и Right
vim.opt.whichwrap = "b,s,<,>"

-- Отслеживание изменений в редактируемом файле вне редактора
vim.opt.autoread = true

-- Довольно удобная реализация поддержки русской раскладки (говорят официальная)
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Читать первые и последние строки комментариев как настроечные в каждом файле
vim.opt.modeline = true

-- Стирать Backspace'ом отступы, начало строки и конец строчки
vim.opt.backspace = "indent,eol,start"

-- === Интерфейс ===
-- Цветовая схема
vim.cmd.colorscheme("catnet_chreamy_dark")
vim.opt.termguicolors = true

-- Линия вкладок
vim.opt.showtabline = 2
-- TODO: Переписать на Lua
vim.opt.tabline = "%!v:lua.require'justmyrc'.get_tab_line()"

-- Нумерация строк
-- Включает колонку нумерации строк
vim.opt.numberwidth = 4
-- Показывает относительные значения (от текущей строки)
vim.opt.relativenumber = true
-- Отображает номер у текущей строки в комбинации с относительной позицией при включенном relativenumber
vim.opt.number = true
-- Подсвечивает редактируемую строку
vim.opt.cursorline = true
-- При прокручивании страницы оставляет видимыми предыдущие/последующие строки (в количестве указанных)
vim.opt.scrolloff = 2

-- Поиск
-- Подсвечивание искомого текста
vim.opt.hlsearch = true
-- Направление поиска по нарастающей (от начала к концу)
vim.opt.incsearch = true

-- Окно подсказок команд
vim.opt.wildmenu = true
-- Игнорирование расширений в подсказках
vim.opt.wildignore = { '*.o', '*.obj', '*.pyc', '__pycache__' }

-- Не показывать режим (он отображается в кастомной строке статуса)
vim.opt.showmode = false

-- Режим отображения строки статуса (2 - всегда)
vim.opt.laststatus = 2

-- Определение содержания строки статуса
vim.opt.statusline = ""
vim.opt.statusline:append("%#StatusLineEditorMode# %{v:lua.require'justmyrc'.get_mode()} ")
vim.opt.statusline:append("%#StatusLineBranchName# %{v:lua.require'justmyrc'.get_branch_name()} ")
vim.opt.statusline:append("%#StatusLineFileFormat# %{&ff} ")
vim.opt.statusline:append("%#StatusLineEmpty# %= ")
vim.opt.statusline:append("%#StatusLineReadOnlyFlag# %r ")
vim.opt.statusline:append("%#StatusLineEncoding# %{&fileencoding?&fileencoding:&encoding} ")
vim.opt.statusline:append("%#StatusLineRuler# %v:%l (%p%%) ")
vim.opt.statusline:append("%#StatusLineFileType# %{&ft} ")

-- === Горячие клавиши ===
-- Отключение подсветки поиска по нажатию Space в нормальном режиме
vim.keymap.set("n", "<Space>", function()
    vim.opt.hlsearch = false
end)

-- Удобный бинд, чтобы каждый раз не тянуться до Esc в режиме вставки
vim.keymap.set("i", "jk", "<Esc>")

-- === Авто-команды ===
-- == Настройки для типов файлов ==
-- Python
local python_augroup = vim.api.nvim_create_augroup("Python", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufEnter" },
    {
        pattern = "*.py",
        group = python_augroup,
        callback = function()
            vim.keymap.set("n", "<F5>", ":!python3 %<CR>")
        end
    })

-- Markdown
local markdown_augroup = vim.api.nvim_create_augroup("Markdown", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufEnter"},
    {
        pattern = "*.md",
        group = markdown_augroup,
        callback = function()
            vim.opt.wrap = true
            vim.opt.colorcolumn = "80"
            vim.opt.textwidth = 80
        end
    })

vim.api.nvim_create_autocmd(
    { "BufLeave"},
    {
        pattern = "*.md",
        group = markdown_augroup,
        callback = function()
            vim.opt.wrap = false
            vim.opt.colorcolumn = "0"
            vim.opt.textwidth = 0
        end
    })

-- Язык C
local c_augroup = vim.api.nvim_create_augroup("C", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufEnter" },
    {
        pattern = "*.c",
        group = c_augroup,
        callback = function()
            vim.keymap.set("n", "<F5>", ":make<CR>")
        end
    })

-- Bash
local bash_augroup = vim.api.nvim_create_augroup("Bash", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufEnter" },
    {
        pattern = "*.sh",
        group = bash_augroup,
        callback = function()
            vim.keymap.set("n", "<F5>", ":!bash %<CR>")
        end
    })

-- Nftables
local nftables_augroup = vim.api.nvim_create_augroup("Nftables", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "nftables.conf", "*.nft", "*/etc/nftables/*" },
        group = nftables_augroup,
        callback = function()
            vim.opt.filetype = "nftables"
        end
    })

-- Для всех типов файлов
local readonly_augroup = vim.api.nvim_create_augroup("ReadOnly", { clear = true })

vim.api.nvim_create_autocmd(
    { "VimEnter" },
    {
        pattern = "*",
        group = readonly_augroup,
        callback = function()
            if vim.opt.ro:get() then
                vim.opt.number = false
                vim.opt.relativenumber = false
                vim.opt.spell = false
                vim.opt.cmdheight = 1
            end
        end
    })

local startup_augroup = vim.api.nvim_create_augroup("Startup", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufReadPost" },
    {
        pattern = "*",
        group = startup_augroup,
        callback = function()
            local ln = vim.fn.line("'\"")

            if (ln >= 1 and ln <= vim.fn.line("$"))
                    and vim.opt.filetype:get() ~= "commit"
                    and vim.fn.index({ "xxd", "gitrebase" }, vim.opt.filetype:get()) == -1 then
                vim.cmd("normal! g`\"")
            end
        end
    })
