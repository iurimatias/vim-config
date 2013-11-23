call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
let mapleader=","
let g:mapleader = ","

" CtrlP
let g:ctrlp_map = '<leader>.'
nmap <leader>b :CtrlPBuffer <cr>

set hidden
set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=80           " wrap at 80 chars by default
set virtualedit=block      " allow virtual edit in visual block ..

set hlsearch      " highlight search terms
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

"set nobackup
"set noswapfile

set backupdir=/tmp
set directory=/tmp

set wildmenu " turn on wild menu
set wildmode=longest,list " filename completion
set ruler " Always show current positions along the bottom
set cmdheight=2 " the command bar is 2 high
set t_Co=256
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set so=10 " Keep 10 lines (top/bottom) for scope
set wrap
"set gdefault " global substitution by default
set formatoptions=qrn1
set mouse=a

""""""""""""""""""""""""""""
" STOP USING ARROW KEYS
""""""""""""""""""""""""""""
map <Left> :echo "stop using arrow keys iuri"<cr>
map <Right> :echo "stop using arrow keys iuri"<cr>
map <Up> :echo "stop using arrow keys iuri"<cr>
map <Down> :echo "stop using arrow keys iuri"<cr>

" make Ctrl-Y copy complete words
noremap! <C-Y> <Esc>klyWjpa

set incsearch
set ignorecase smartcase

" configr for slime
let g:slime_target = "tmux"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Smart_TabComplete()
  let line = getline('.')
  let substr = strpart(line, -1, col('.')+1) 
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"  
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" if this was macvim
"nmap <D-t> :w!
" Use CTRL-S for saving, also in Insert mode
nnoremap <c-k> <Esc>:w!<CR>
vnoremap <c-k> <C-C>:update<CR>
inoremap <c-k> <C-O>:update<CR><esc>

" Folding stuff

hi Folded guibg=red guifg=Red cterm=bold ctermbg=DarkGrey ctermfg=lightblue
hi FoldColumn guibg=grey78 gui=Bold guifg=DarkBlue

set foldcolumn=2
set foldclose=
set foldmethod=indent
set foldnestmax=10
set foldlevel=20
set fillchars=vert:\|,fold:\
set foldminlines=1

fu! ToggleFold()
  if foldlevel('.') == 0
    normal! l
  else
    if foldclosed('.') < 0
      . foldclose
    else
      . foldopen
    endif
  endif
  echo
endf
noremap <space> :call ToggleFold()<CR>

" CtrlP improvements

let g:ctrlp_working_path_mode = 2
let g:ctrlp_cmd = 'CtrlPMixed'
set wildignore+=*/tmp/*,*/log/*,*/public/images/*,*/packages/*,*.png,*.ico,*.jpg,*.gif,*.swf,*.so,*.swp,*.zip  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.ico$'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0 
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_user_command = {
  \ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files'],
  \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }   

au BufRead,BufNewFile *.hamlc set ft=haml

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

nnoremap <leader>ga :open config/application.rb<cr>
nnoremap <leader>gd :open config/database.yml<cr>
nnoremap <leader>gg :open Gemfile<cr>
nnoremap <leader>gr :open config/routes.rb<cr>
nnoremap <leader>gi :open .gitignore<cr>
nnoremap <leader>ge :open Readme.md<cr>
nnoremap <leader>gl :open config/locales/en-CA.yml<cr>
nnoremap <leader>gs :e *.gemspec<cr>
nnoremap <leader>gk :e Rakefile<cr>
nnoremap <leader>gf :e Guardfile<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap ci: f:lcw

nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>ts :tab split<cr>

nnoremap \n :NERDTreeToggle<cr>

nnoremap <leader>c ct_
nnoremap <leader>C cT_

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

"mapping to yacc current line, comment the current line, and post below the new line

nnoremap <leader>yp yyI#<esc>p

color superman

nnoremap <leader>rs :call RunCurrentSpecFile()<cr>
nnoremap <leader>ra :call RunAllSpecs()<cr>

nmap <silent> <leader>d <Plug>DashGlobalSearch
"nmap <silent> <leader>d <Plug>DashSearch

nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>

nnoremap <leader>tg :GundoToggle<CR>

