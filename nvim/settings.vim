
" general settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax
syntax on

" tabs and spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" gui stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=79 " line length marker
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list


" ui configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start  " backspace to prev line
" set nowrap             " don't wrap long lines
set number             " show line numbers
set relativenumber     " show relative numbering
set showcmd            " show command on bottom bar
set cursorline         " highlight current line
set showmatch          " show matching [{()}]
set wildmenu           " autocomplete for command line
set updatetime=100     " some plugins require fast update time
set ttyfast            " Improve redrawing
set mouse+=a           " mouse support - necessary evil
set encoding=utf-8     " set korean incodings
set termencoding=utf-8 " set korean incodings
set ttimeout           " faster esc
set ttimeoutlen=50     " faster esc 50ms
set clipboard=unnamedplus
filetype indent on     " load filetype-specific indent files
filetype plugin on     " load filetype-specific plugin files

let g:python_recommended_style=0

" search options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch          " search as characters are entered
set hlsearch           " highlight matches
set ignorecase         " ignore case
set smartcase          " but make it case sensitive if an uppercase in entered
" set shortmess-=S       " Show search count on status bar

" for status-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode         " no show mode for default
set laststatus=2       " turn on bottom bar

" buffer setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden             " hide buffer
set autowrite          " for buffer autowrite

" code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual

" YCM Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ycm_autoclose_preview_window_after_completion = 1


" termdebug config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd termdebug
let g:termdebug_wide=1
let g:termdebug_leftsource = 1
let g:termdebug_focussource = 1
let g:termdebug_disable_toolbar = 1
hi debugPC term=reverse ctermbg=8 guibg=darkblue

" change termdebug path
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:termdebugger="/scratch/joonho.whangbo/coding/riscv-gnu-toolchain/bin/riscv64-unknown-elf-gdb"



" add keywords like TODO, FIXME, NOTE, HACK, FEAT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateTodoKeywords(...)
  let newKeywords = join(a:000, " ")
  let synTodo = map(filter(split(execute("syntax list"), '\n') , { i,v -> match(v, '^\w*Todo\>') == 0}), {i,v -> substitute(v, ' .*$', '', '')})
  for synGrp in synTodo
    execute "syntax keyword " . synGrp . " contained " . newKeywords
  endfor
endfunction

augroup now
  autocmd!
  autocmd Syntax * call UpdateTodoKeywords("NOTE", "HACK", "FEAT")
augroup END

" CY stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;/

" cscopes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("./cscope.out")
  cs add cscope.out
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Chisel syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ft_scala
  autocmd!
  autocmd Syntax scala syn keyword chiselKeyword when elsewhen otherwise
  autocmd Syntax scala hi link chiselKeyword Keyword
  autocmd Syntax scala syn match chiselFunction /\<printf\>/
  autocmd Syntax scala hi link chiselFunction Function
  autocmd Syntax scala syn match chiselOperator ":="
  autocmd Syntax scala syn match chiselOperator "<>"
  autocmd Syntax scala syn match chiselOperator "==="
  autocmd Syntax scala syn match chiselOperator "=/="
  autocmd Syntax scala syn match chiselOperator "+%"
  autocmd Syntax scala syn match chiselOperator "+&"
  autocmd Syntax scala syn match chiselOperator "-%"
  autocmd Syntax scala syn match chiselOperator "-&"
  autocmd Syntax scala hi link chiselOperator Special
augroup end


" Show hidden files
let NERDTreeShowHidden=1

" oscyank buffer limit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:oscyank_max_length = 100000000

" conflict-marker, use only basic highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:conflict_marker_enable_mappings = 0
let g:conflict_marker_enable_matchit = 0
let g:conflict_marker_enable_mappings = 0
