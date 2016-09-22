" pgn.vim
"
" Vim syntax file
" Language: Portable Game Notation, http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm
" Maintainer: Ryan Delaney <ryan delaney AT gmail com>
" Home: https://github.com/rpdelaney/vim-pgn
"

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = "pgn"
endif

syntax case ignore
if v:version >= 700
  syntax spell toplevel
endif

" Section: Syntax {{{1
" Variations
syn region pgnType      start=+(+    end=+)+    contains=pgnComment
" Comments
syn region pgnComment   start=+{+    end=+}+
syn match  pgnComment   ";.*"
" Headers
syn region pgnFlow      start=+\[+   end=+\]+  contains=pgnString
" Strings
syn region pgnString    start=+"+    end=+"+
" Numeric Annotation Glyphs
syn match pgnOperator   "\$[0-9]\+"
" Escape mechanism
syn match pgnSpecial    "^%.*"
" Tokens
syn match pgnFunction   "[\*\[\]\>\<]"
" Game-end notation
syn match pgnOperator   "1/2-1/2"
syn match pgnOperator   "1-0"
syn match pgnOperator   "0-1"
syn match pgnOperator   "\*"


" Move numbers
syn match pgnNumber     "-\=\<[0-9]*\>\."
syn match pgnNumber     "-\=\<[0-9]*\>\.\.\."
" Syntax 1}}}

" Section: Definition {{{1
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_pgn_syn_inits")
  if version < 508
    let did_pgn_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pgnKeyword     Statement
  HiLink pgnSpecial     Special
  HiLink pgnString      String
  HiLink pgnNumber      Number
  HiLink pgnVariable    Identifier
  HiLink pgnComment     Comment
  HiLink pgnType        Type
  HiLink pgnOperator    Statement
  HiLink pgnFunction    Function
  delcommand HiLink
endif
" Definition 1}}}

let b:current_syntax = "pgn"

" Section: Modelines {{{1
" vim600: set foldmethod=marker foldlevel=0 :
