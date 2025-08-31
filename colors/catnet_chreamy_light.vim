" Name:        CatNet Creamy Light
" Author:      John Solntsev <johnsol@internet.ru>
" License:     Same as Vim
" Last Change: 2025 Aug 30

hi clear

if exists("syntax_on")
    syntax reset
endif

set bg=light
let colors_name="catnet_chreamy_light"

"=== Пользовательские цвета ===
hi      MainColor                          gui=none guifg=#000000 guibg=#ffd787
hi      SecondColor                                 guifg=#000000 guibg=#ffaf87

"=== Основного интерфейса интерфейса ===
hi      Normal                                      guifg=#000000 guibg=none
"Цвета линейки строк (та, что слева номера строк показыват)
hi      LineNr                             gui=none guifg=#121212 guibg=#d4ccc1
hi      CursorLineNr                       gui=none guifg=#343434 guibg=#c3bbb1
hi      CursorLine                         gui=none               guibg=#d4ccc1
hi      Folded                             gui=none guifg=#8700ff guibg=none
hi      ModeMsg                            gui=none guifg=#000000 guibg=#ffd787
hi      NonText                                     guifg=#ffaf5f
hi      Visual                                      guifg=#5f5f5f guibg=#ffcc00
hi      ColorColumn                                               guibg=#262626
hi      VertSplit                          gui=none guifg=#87ff87 guibg=none
hi      Search                                      guifg=#121212 guibg=#ffd787

"=== Строка вкладок ===
hi      TabLine                            gui=none guifg=#d0d0d0 guibg=#c3bbb1
hi      TabLineSel                         gui=none guifg=#000000 guibg=#ffd787
hi      TabLineFill                        gui=none guifg=none    guibg=#c2bbb1

hi      WildMenu                           gui=none guifg=#000000 guibg=#949494

hi      Pmenu                                       guifg=#6c6c6c guibg=#121212
hi      PmenuSel                                    guifg=#c0c0c0 guibg=#262626

" Статусная строка
hi      StatusLine                         gui=none guifg=#343434 guibg=#d4ccc1
hi link StatusLineEditorMode MainColor
hi link StatusLineBranchName SecondColor
hi      StatusLineFileFormat                        guifg=#3e3e3e guibg=#c3bbb1
hi      StatusLineEmpty                                           guibg=#c3bbb1
hi      StatusLineReadOnlyFlag                      guifg=#3e3e3e guibg=#c3bbb1
hi      StatusLineEncoding                          guifg=#3e3e3e guibg=#c3bbb1
hi link StatusLineRuler      SecondColor
hi link StatusLineFileType   MainColor

"=== Подсвтека синтаксиса ===
" Заголовки Markdown
hi      Title                              gui=bold guifg=#9797af
" Комментарии в языках программирования
hi      Comment                                     guifg=#767656

hi      Constant                                    guifg=#7fa7cf
hi      String                                      guifg=#a77fcf
hi      Number                                      guifg=#87af5f
hi      Boolean                                     guifg=#ffaf5f

hi      Identifier                         gui=none guifg=#afafff
hi      Function                                    guifg=#7fa7cf

hi      Statement                                   guifg=#cf7f7f

hi      PreProc                                     guifg=#d78787
hi      Include                            gui=bold guifg=#7fcf57

hi      Type                                        guifg=#cf7fa7

hi      Delimiter                                   guifg=#a7a7cf

hi      Special                                     guifg=#cf7fcf

hi      Todo                               gui=bold guifg=#ff6600 guibg=none
hi      Error                                                     guibg=#ff005f

" === Встроенные плагины ===

" Netrw
hi      netrwDir                           gui=bold guifg=#cfa700
hi      netrwLink                          gui=bold guifg=#875fff
hi      netrwSymLink                       gui=bold guifg=#875fff
hi      netrwExe                           gui=bold guifg=#008000

" Diff
hi      diffRemoved                                               guibg=#800000
hi      diffAdded                                                 guibg=#008000
hi      diffChanged                                               guibg=#808000
