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

" builtin
syntax keyword ethBuiltin fn
syntax keyword ethBuiltin do
syntax keyword ethBuiltin if
syntax keyword ethBuiltin loop
syntax keyword ethBuiltin recur
syntax keyword ethBuiltin get
syntax keyword ethBuiltin def
syntax keyword ethBuiltin let
syntax keyword ethBuiltin new
syntax keyword ethBuiltin throw
syntax keyword ethBuiltin try

" builtin binary operators
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
syntax keyword ethBuiltin in
syntax keyword ethBuiltin instanceof

" builtin unary operators
syntax keyword ethBuiltin "!"
syntax keyword ethBuiltin void
syntax keyword ethBuiltin delete
syntax keyword ethBuiltin typeof

" builtin macros
syntax keyword ethBuiltin import
syntax keyword ethBuiltin package
syntax keyword ethBuiltin export
syntax keyword ethBuiltin defmacro
syntax keyword ethBuiltin defn

" stdlib ramda
syntax keyword ethBuiltin "contains"
syntax keyword ethBuiltin F T __ add addIndex adjust all allPass allUniq always and any anyPass ap aperture append apply applySpec assoc assocPath binary bind both call chain clamp clone comparator complement compose composeK composeP concat cond construct constructN converge countBy curry curryN dec defaultTo difference differenceWith dissoc dissocPath divide drop dropLast dropLastWhile dropRepeats dropRepeatsWith dropWhile either empty eqBy eqProps equals evolve filter find findIndex findLast findLastIndex flatten flip forEach fromPairs groupBy groupWith gt gte has hasIn head identical identity ifElse inc indexBy indexOf init insert insertAll intersection intersectionWith intersperse into invert invertObj invoker is isArrayLike isEmpty isNil join juxt keys keysIn last lastIndexOf length lens lensIndex lensPath lensProp lift liftN lt lte map mapAccum mapAccumRight mapObjIndexed match mathMod max maxBy mean median memoize merge mergeAll mergeWith mergeWithKey min minBy modulo multiply nAry negate none not nth nthArg objOf of omit once or over pair partial partialRight partition path pathEq pathOr pathSatisfies pick pickAll pickBy pipe pipeK pipeP pluck prepend product project prop propEq propIs propOr propSatisfies props range reduce reduceBy reduceRight reduced reject remove repeat replace reverse scan sequence set slice sort sortBy split splitAt splitEvery splitWhen subtract sum symmetricDifference symmetricDifferenceWith tail take takeLast takeLastWhile takeWhile tap test times toLower toPairs toPairsIn toString toUpper transduce transpose traverse trim tryCatch type unapply unary uncurryN unfold union unionWith uniq uniqBy uniqWith unless unnest until update useWith values valuesIn view when where whereEq without wrap xprod zip zipObj zipWith
"

" stdlib eth
syntax keyword ethFunc to-json
syntax keyword ethFunc from-json
syntax keyword ethFunc print
syntax keyword ethFunc assert
syntax keyword ethFunc get-in
syntax keyword ethFunc set-in
syntax keyword ethFunc type
syntax keyword ethFunc of-type?
syntax keyword ethFunc null?
syntax keyword ethFunc undefined?
syntax keyword ethFunc boolean?
syntax keyword ethFunc number?
syntax keyword ethFunc string?
syntax keyword ethFunc keyword?
syntax keyword ethFunc symbol?
syntax keyword ethFunc list?
syntax keyword ethFunc array?
syntax keyword ethFunc object?
syntax keyword ethFunc function?
syntax keyword ethFunc string
syntax keyword ethFunc array
syntax keyword ethFunc object

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
