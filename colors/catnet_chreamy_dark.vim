" Name:        CatNet Creamy Dark
" Author:      John Solntsev <johnsol@internet.ru>
" License:     Same as Vim
" Last Change: 2025 Aug 30

hi clear

if exists("syntax_on")
    syntax reset
endif

set bg=dark
let colors_name="catnet_chreamy_dark"

"=== Пользовательские цвета ===
hi      MainColor                          gui=none guifg=#000000 guibg=#ffd787
hi      SecondColor                                 guifg=#000000 guibg=#ffaf87

"=== Основного интерфейса интерфейса ===
hi      Normal                                                    guibg=none
"Цвета линейки строк (та, что слева номера строк показыват)
hi      LineNr                             gui=none guifg=#8a8a8a guibg=#1c1c1c
hi      CursorLineNr                       gui=none guifg=#af875f guibg=#444444
hi      CursorLine                         gui=none               guibg=#1c1c1c
hi      Folded                             gui=none guifg=#8700ff guibg=none
hi      ModeMsg                            gui=none guifg=#000000 guibg=#ffd787
hi      NonText                                     guifg=#ffaf5f
hi      Visual                                      guifg=#5f5f5f guibg=#ffcc00
hi      ColorColumn                                               guibg=#262626
hi      VertSplit                          gui=none guifg=#87ff87 guibg=none
hi      Search                                      guifg=#121212 guibg=#ffd787

"=== Строка вкладок ===
hi      TabLine                            gui=none guifg=#d0d0d0 guibg=#1c1c1c
hi      TabLineSel                         gui=none guifg=#000000 guibg=#ffd787
hi      TabLineFill                        gui=none guifg=none    guibg=#1c1c1c

hi      WildMenu                           gui=none guifg=#000000 guibg=#949494

hi      Pmenu                                       guifg=#6c6c6c guibg=#121212
hi      PmenuSel                                    guifg=#c0c0c0 guibg=#262626

" Статусная строка
hi      StatusLine                         gui=none guifg=#949494 guibg=#1c1c1c
hi link StatusLineEditorMode MainColor
hi link StatusLineBranchName SecondColor
hi      StatusLineFileFormat                        guifg=#9e9e9e guibg=#262626
hi      StatusLineEmpty                                           guibg=#262626
hi      StatusLineReadOnlyFlag                      guifg=#9e9e9e guibg=#262626
hi      StatusLineEncoding                          guifg=#9e9e9e guibg=#262626
hi link StatusLineRuler      SecondColor
hi link StatusLineFileType   MainColor

"=== Подсвтека синтаксиса ===
" Заголовки Markdown
hi      Title                              gui=bold guifg=#d7d7ff
" Комментарии в языках программирования
hi      Comment                                     guifg=#767676

hi      Constant                                    guifg=#afd7ff
hi      String                                      guifg=#d7afff
hi      Number                                      guifg=#87af5f
hi      Boolean                                     guifg=#ffaf5f

hi      Identifier                         gui=none guifg=#afafff
hi      Function                                    guifg=#afd7ff

hi      Statement                                   guifg=#ffafaf

hi      PreProc                                     guifg=#d78787
hi      Include                            gui=bold guifg=#afff87

hi      Type                                        guifg=#ffafd7

hi      Delimiter                                   guifg=#d7d7ff

hi      Special                                     guifg=#ffafff

hi      Todo                               gui=bold guifg=#ffff00 guibg=none
hi      Error                                                     guibg=#ff005f

" === Встроенные плагины ===

" Netrw
hi      netrwDir                           gui=bold guifg=#ffd700
hi      netrwLink                          gui=bold guifg=#875fff
hi      netrwSymLink                       gui=bold guifg=#875fff
hi      netrwExe                           gui=bold guifg=#008000

" Diff
hi      diffRemoved                                               guibg=#800000
hi      diffAdded                                                 guibg=#008000
hi      diffChanged                                               guibg=#808000
