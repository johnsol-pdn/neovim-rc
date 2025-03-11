" Name:        justmyrc
" Author:      John Solntsev <johnsol@internet.ru>
" License:     Same as Vim
" Last Change: 2025 Mar 11

" === Пользовательские функции ===
"Функция получения текущего режима редактора
let g:git_branch = ""

function justmyrc#GetBranchName(filename)
    let l:cur_dir = fnamemodify(system("readlink -f " . a:filename), ":h")
    let g:git_branch = trim(system("git -C " . l:cur_dir . " rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d '\r\n'"))
endfunction

function justmyrc#TabLine()
  let l:s = ''

  for l:i in range(tabpagenr('$'))
    " Выбираем, какую вкладку подсвечивать
    if l:i + 1 == tabpagenr()
      let l:s .= '%#TabLineSel#'
    else
      let l:s .= '%#TabLine#'
    endif

    "Указываем номер вкладки
    let l:s .= ' ' . (i + 1) . ':'

    "Получаем подпись (имя файла) из TabLabel
    let l:s .= ' %{justmyrc#TabLabel(' . (l:i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let l:s .= '%#TabLineFill#%T'

  return l:s
endfunction

function justmyrc#TabLabel(n)
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)

  return bufname(buflist[winnr - 1])
endfunction
