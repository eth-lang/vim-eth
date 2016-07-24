" Vim syntax file
" Language:     Eth
" Maintainer:   Frederic Gingras <frederic@gingras.cc>
" Last change:  24 Jul 2016

if exists("b:current_syntax")
  finish
endif

syntax case match

" ! $ - . / 0-9 < = > ? @ a-zA-Z _
setlocal iskeyword=33,35-37,42,43,45-47,48-57,60-64,124,@,_
syntax match ethSymbol "\<\k\+\>"

" builtin
syntax keyword ethBuiltin get
syntax keyword ethBuiltin set
syntax keyword ethBuiltin =
syntax keyword ethBuiltin let
syntax keyword ethBuiltin delete
syntax keyword ethBuiltin fn
syntax keyword ethBuiltin cond
syntax keyword ethBuiltin loop
syntax keyword ethBuiltin recur
syntax keyword ethBuiltin or
syntax keyword ethBuiltin and
syntax keyword ethBuiltin package
syntax keyword ethBuiltin import
syntax keyword ethBuiltin export

" builtin functions
syntax keyword ethBuiltin new
syntax keyword ethBuiltin throw
syntax keyword ethBuiltin try
syntax keyword ethBuiltin in
syntax keyword ethBuiltin instanceof
syntax keyword ethBuiltin void

" builtin operators
syntax keyword ethBuiltin "+"
syntax keyword ethBuiltin "-"
syntax keyword ethBuiltin "*"
syntax keyword ethBuiltin "/"
syntax keyword ethBuiltin "%"
syntax keyword ethBuiltin "<"
syntax keyword ethBuiltin "<="
syntax keyword ethBuiltin ">"
syntax keyword ethBuiltin ">="
syntax keyword ethBuiltin "=="
syntax keyword ethBuiltin "!="
syntax keyword ethBuiltin "||"
syntax keyword ethBuiltin "&&"
syntax keyword ethBuiltin "!"

" stdlib eth
syntax keyword ethFunc print
syntax keyword ethFunc assert
syntax keyword ethFunc fromJson
syntax keyword ethFunc toJson
syntax keyword ethFunc regexp
syntax keyword ethFunc regexp-match
syntax keyword ethFunc regexp-find
syntax keyword ethFunc regexp-replace
syntax keyword ethFunc getIn
syntax keyword ethFunc setIn
syntax keyword ethFunc type
syntax keyword ethFunc isOfType

" stdlib ramda
syntax keyword ethFunc "contains"
syntax keyword ethFunc F T __ add addIndex adjust all allPass allUniq always and any anyPass ap aperture append apply applySpec assoc assocPath binary bind both call chain clamp clone comparator complement compose composeK composeP concat cond construct constructN converge countBy curry curryN dec defaultTo difference differenceWith dissoc dissocPath divide drop dropLast dropLastWhile dropRepeats dropRepeatsWith dropWhile either empty eqBy eqProps equals evolve filter find findIndex findLast findLastIndex flatten flip forEach fromPairs groupBy groupWith gt gte has hasIn head identical identity ifElse inc indexBy indexOf init insert insertAll intersection intersectionWith intersperse into invert invertObj invoker is isArrayLike isEmpty isNil join juxt keys keysIn last lastIndexOf length lens lensIndex lensPath lensProp lift liftN lt lte map mapAccum mapAccumRight mapObjIndexed match mathMod max maxBy mean median memoize merge mergeAll mergeWith mergeWithKey min minBy modulo multiply nAry negate none not nth nthArg objOf of omit once or over pair partial partialRight partition path pathEq pathOr pathSatisfies pick pickAll pickBy pipe pipeK pipeP pluck prepend product project prop propEq propIs propOr propSatisfies props range reduce reduceBy reduceRight reduced reject remove repeat replace reverse scan sequence set slice sort sortBy split splitAt splitEvery splitWhen subtract sum symmetricDifference symmetricDifferenceWith tail take takeLast takeLastWhile takeWhile tap test times toLower toPairs toPairsIn toString toUpper transduce transpose traverse trim tryCatch type unapply unary uncurryN unfold union unionWith uniq uniqBy uniqWith unless unnest until update useWith values valuesIn view when where whereEq without wrap xprod zip zipObj zipWith

syntax match ethKeyword ":\<\k\+\>"

syntax match ethStringEscape "\v\\%([\\btnfr"]|u\x{4}|[0-3]\o{2}|\o{1,2})" contained
syntax region ethString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=ethStringEscape,@Spell

syntax match ethNumber "\v<[-+]?%(0|[1-9]\d*)\.?\d*>"

syntax keyword ethBoolean nil true false

syntax match ethVarArg "\.\."

syntax match ethComment "//.*$" contains=ethCommentTodo,@Spell
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
