set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' " code navigation
Plug 'vim-airline/vim-airline' " fancy status line
Plug 'vim-airline/vim-airline-themes' " make it fancier
Plug 'airblade/vim-gitgutter' " marks changed lines
Plug 'tpope/vim-fugitive' " git support within vim
Plug 'rhysd/conflict-marker.vim' " fight against merge conflicts
Plug 'chrisbra/vim-commentary' " easier commenting
Plug 'arcticicestudio/nord-vim' " ice cold colors
Plug 'w0rp/ale' " syntax check
Plug 'yggdroot/indentline' " show vertical lines for indents
Plug 'andymass/vim-matchup' " move between matching parenthesis
Plug 'ycm-core/YouCompleteMe' " autocomplete
Plug 'ojroques/vim-oscyank' " copy to system clipboard
Plug 'universal-ctags/ctags' " for ctags
Plug 'craigemery/vim-autotag' " automatic update of ctags
Plug 'sheerun/vim-polyglot' " try out new syntax highlighting
Plug 'machakann/vim-highlightedyank' " highlight yanked parts
Plug 'junegunn/vim-slash' " highlights for in-buf search
Plug 'obcat/vim-hitspop' " highlights for search-hits
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" -------------------------- Key Mappings ---------------------------
"
" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" faster Scroll
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" for nerdtree
map <C-n> :NERDTreeToggle<CR>

" Leader
let mapleader=" "       " leader is space

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move btw buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" grep
nnoremap <C-g> :!grep -irn


" general settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax
syntax on

" colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme nord


" tabs and spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


" ui configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start  " backspace to prev line
set nowrap             " don't wrap long lines
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

" for lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode         " no show mode for default
set laststatus=2       " turn on bottom bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" for indenting and spacing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 243
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set colorcolumn=79 " line length marker
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" tmux color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set term=screen-256color

" buffer setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden             " hide buffer
set autowrite          " for buffer autowrite

" code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual

" better view for nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore =['\.o$']
let NERDTreeSortOrder=['\.c$']

" highlighted yank config for older vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
endif

" YCM Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1


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


" vim-cpp-modern configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1


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

