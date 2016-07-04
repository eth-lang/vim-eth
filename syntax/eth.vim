" Vim syntax file
" Language:     Eth
" Maintainer:   Frederic Gingras <frederic@gingras.cc>
" Last change:  02 Jul 2016

if exists("b:current_syntax")
  finish
endif

syntax case match

" ! $ - . / 0-9 ? @ a-zA-Z _
setlocal iskeyword=33,36,45-47,48-57,63-64,@,_
syntax match ethSymbol "\<\k\+\>"

syntax keyword ethBuiltin fn do if while set = get . def let package import export var
syntax keyword ethBuiltin new throw try
syntax keyword ethBuiltin + - * / %
syntax keyword ethBuiltin < <= > >= == !=
syntax keyword ethBuiltin "||"
syntax keyword ethBuiltin "&&"
syntax keyword ethBuiltin in instanceof
syntax keyword ethBuiltin ! void delete typeof
syntax keyword ethFunc type of-type? null? undefined? boolean? number? string? object? array? function?
syntax keyword ethFunc assert not apply curry curry2 curry3 curryN
syntax keyword ethFunc add sub mul div mod
syntax keyword ethFunc PI abs ceil floor log sin cos tan pow max min round sqrt inc dec random even? odd?
syntax keyword ethFunc len head tail last concat cons append map reduce filter for-each join
syntax keyword ethFunc "contains"
syntax keyword ethFunc string array object and or
syntax keyword ethFunc print identity always
syntax keyword ethFunc from-json to-json
syntax keyword ethFunc prop prop-eq pick keys values merge clone assoc get-in set-in update-in

syntax match ethKeyword ":\<\k\+\>"

syntax match ethStringEscape "\v\\%([\\btnfr"]|u\x{4}|[0-3]\o{2}|\o{1,2})" contained
syntax region ethString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=soloStringEscape,@Spell

syntax match ethNumber "\v<[-+]?%(0|[1-9]\d*)\.?\d*>"

syntax keyword ethBoolean null true false

syntax match ethVarArg "\.\.\."

syntax match ethComment ";.*$" contains=ethCommentTodo,@Spell
syntax keyword ethCommentTodo contained FIXME TODO HACK FIXME: TODO: HACK:

syntax cluster ethTop contains=@Spell,ethBracketError,ethComment,ethVarArg,ethBoolean,ethNumber,ethKeyword,ethString,ethStringEscape,ethBuiltin,ethFunc,ethSymbol,ethList,ethArray,ethObject

syntax region ethList   matchgroup=ethDelim start="("  matchgroup=ethDelim end=")" contains=@ethTop fold
syntax region ethArray  matchgroup=ethDelim start="\[" matchgroup=ethDelim end="\]" contains=@ethTop fold
syntax region ethObject matchgroup=ethDelim start="{"  matchgroup=ethDelim end="}" contains=@ethTop fold

syntax match ethBracketError display ")"

syntax sync fromstart

highlight default link ethBuiltin      Keyword
highlight default link ethFunc         Identifier
highlight default link ethKeyword      String
highlight default link ethString       String
highlight default link ethStringEscape Character
highlight default link ethNumber       Number
highlight default link ethBoolean      Boolean
highlight default link ethVarArg       Special

highlight default link ethComment      Comment
highlight default link ethCommentTodo  Todo

highlight default link ethDelim        Delimiter
highlight default link ethBracketError Error

highlight link ethDelim Comment

let b:current_syntax = "eth"
