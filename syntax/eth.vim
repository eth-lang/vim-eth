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

" builtin macro syntax
syntax keyword ethBuiltin quote
syntax keyword ethBuiltin quasi-quote
syntax keyword ethBuiltin unquote
syntax keyword ethBuiltin unquote-splicing

" builtin macros
syntax keyword ethBuiltin import
syntax keyword ethBuiltin package
syntax keyword ethBuiltin export
syntax keyword ethBuiltin defmacro
syntax keyword ethBuiltin defn

" stdlib ramda
syntax keyword ethFunc "contains"
syntax keyword eth-Func F T __ add add-index adjust all all-pass all-uniq always and any any-pass ap aperture append apply apply-spec assoc assoc-path binary bind both call chain clamp clone comparator complement compose compose-k compose-p concat cond construct construct-n converge count-by curry curry-n dec default-to difference difference-with dissoc dissoc-path divide drop drop-last drop-last-while drop-repeats drop-repeats-with drop-while either empty eq-by eq-props equals evolve filter find find-index find-last find-last-index flatten flip for-each from-pairs group-by group-with gt gte has has-in head identical identity if-else inc index-by index-of init insert insert-all intersection intersection-with intersperse into invert invert-obj invoker is array-like? empty? nil? join juxt keys keys-in last last-index-of length lens lens-index lens-path lens-prop lift lift-n lt lte map map-accum map-accum-right map-obj-indexed match math-mod max max-by mean median memoize merge merge-all merge-with merge-with-key min min-by modulo multiply n-ary negate none not nth nth-arg obj-of of omit once or over pair partial partial-right partition path path-eq path-or path-satisfies pick pick-all pick-by pipe pipe-k pipe-p pluck prepend product project prop prop-eq prop-is prop-or prop-satisfies props range reduce reduce-by reduce-right reduced reject remove repeat replace reverse scan sequence set slice sort sort-by split split-at split-every split-when subtract sum symmetric-difference symmetric-difference-with tail take take-last take-last-while take-while tap test times to-lower to-pairs to-pairs-in to-string to-upper transduce transpose traverse trim try-catch type unapply unary uncurry-n unfold union union-with uniq uniq-by uniq-with unless unnest until update use-with values values-in view when where where-eq without wrap xprod zip zip-obj zip-with

" stdlib eth
syntax keyword ethFunc assert
syntax keyword ethFunc print
syntax keyword ethFunc to-json
syntax keyword ethFunc from-json
syntax keyword ethFunc regexp
syntax keyword ethFunc regexp-match
syntax keyword ethFunc regexp-find
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
syntax keyword ethFunc keyword
syntax keyword ethFunc symbol
syntax keyword ethFunc list

syntax match ethKeyword ":\<\k\+\>"

syntax match ethStringEscape "\v\\%([\\btnfr"]|u\x{4}|[0-3]\o{2}|\o{1,2})" contained
syntax region ethString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=soloStringEscape,@Spell

syntax match ethNumber "\v<[-+]?%(0|[1-9]\d*)\.?\d*>"

syntax keyword ethBoolean null undefined true false

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
