" function! MyFoldText()
    " let line = getline(v:foldstart)
    " let folded_line_num = v:foldend - v:foldstart
    " " let line_text = substitute(line, '^"{\+', '', 'g')
    " let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
    " return '+'. repeat('-', 4) . line_text . repeat('.', fillcharcount) . ' (' . folded_line_num . ' L)'
" endfunction

" set foldtext=MyFoldText()
" set fillchars=fold:\

" setlocal foldmethod=expr
" setlocal foldexpr=GetPotionFold(v:lnum)
" function! GetPotionFold(lnum)
  " if getline(a:lnum) =~? '\v^\s*$'
    " return '-1'
  " endif
  " let this_indent = IndentLevel(a:lnum)
  " let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
  " if next_indent == this_indent
    " return this_indent
  " elseif next_indent < this_indent
    " return this_indent
  " elseif next_indent > this_indent
    " return '>' . next_indent
  " endif
" endfunction
" function! IndentLevel(lnum)
    " return indent(a:lnum) / &shiftwidth
" endfunction
" function! NextNonBlankLine(lnum)
  " let numlines = line('$')
  " let current = a:lnum + 1
  " while current <= numlines
      " if getline(current) =~? '\v\S'
          " return current
      " endif
      " let current += 1
  " endwhile
  " return -2
" endfunction
" function! CustomFoldText()
  " " get first non-blank line
  " let fs = v:foldstart
  " while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  " endwhile
  " if fs > v:foldend
      " let line = getline(v:foldstart)
  " else
      " let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  " endif
  " let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  " let foldSize = 1 + v:foldend - v:foldstart
  " let foldSizeStr = " " . foldSize . " lines "
  " let foldLevelStr = repeat("+--", v:foldlevel)
  " let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
  " return line . expansionString . foldSizeStr . foldLevelStr
" endfunction
