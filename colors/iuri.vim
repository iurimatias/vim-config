
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "iuri"

highlight rubyBlock  guifg=#FFFFFF ctermfg=Red
highlight rubyClass  guifg=#FFFFFF ctermfg=Red
" def
highlight rubyDefine guifg=#FFFFFF ctermfg=Red

" @variable
highlight rubyInstanceVariable      guifg=#D0D0FF ctermfg=189
" :symbol
highlight rubySymbol      guifg=#D0D0FF ctermfg=13
" 'string'
highlight rubyString      guifg=#D0D0FF ctermfg=107

highlight rubyControl      guifg=#D0D0FF ctermfg=Red
" | in a block
highlight rubyBlockParameterList        guifg=#FFFFFF ctermfg=Red
" { => and vars inside 
"highlight rubyCurlyBlock        guifg=#FFFFFF ctermfg=Red


highlight rubyEqual guifg=#FFFFFF ctermfg=Red
match rubyEqual /=/

"match rubyHashEqual /=>/
"highlight rubyHashEqual guifg=#FFFFFF ctermfg=Red

highlight railsParams guifg=#FFFFFF ctermfg=82
match railsParams /params/

highlight railsRender guifg=#FFFFFF ctermfg=82
syn match railsRender /render/

highlight railsRedirect guifg=#FFFFFF ctermfg=82
match railsRedirect /redirect_to/

highlight rubyConstant guifg=#FFFFFF ctermfg=11
