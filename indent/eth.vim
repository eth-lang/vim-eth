setlocal indentexpr=EthIndent()

function! EthIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  if previous =~ "{"
    return indent(previousNum) + &tabstop
  endif

  return indent(previousNum)
endfunction
