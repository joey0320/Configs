" vim plug options


call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " parse file into tree for better highlighting, etc
Plug 'nvim-lua/plenary.nvim' " see nextline
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " fuzzy finder
" Plug 'shaunsingh/nord.nvim' " colors, easy for my eyes
Plug 'oahlen/iceberg.nvim' " colors, easy for my eyes
Plug 'preservim/nerdtree' " file tree explorer
" Plug 'ojroques/nvim-hardline' " buff+status line
Plug 'craigemery/vim-autotag' " save (and update) ctags on file save
Plug 'akinsho/git-conflict.nvim' " git conflict marker highlighting
Plug 'lukas-reineke/indent-blankline.nvim' " indentation guides
Plug 'airblade/vim-gitgutter' " marks changed lines
Plug 'rhysd/conflict-marker.vim' " fight against merge conflicts
Plug 'chrisbra/vim-commentary' " easier commenting
" Plug 'w0rp/ale' " syntax check
Plug 'andymass/vim-matchup' " move between matching parenthesis
Plug 'ojroques/vim-oscyank' " copy to system clipboard
Plug 'universal-ctags/ctags' " for ctags
Plug 'craigemery/vim-autotag' " automatic update of ctags
Plug 'machakann/vim-highlightedyank' " highlight yanked parts
Plug 'junegunn/vim-slash' " highlights for in-buf search
Plug 'tpope/vim-fugitive' " Git inside vim

Plug 'scalameta/nvim-metals' " metals (scala lsp backend)
Plug 'neovim/nvim-lspconfig' " lsp config for nvim
Plug 'hrsh7th/nvim-cmp'      " auto cmp
Plug 'hrsh7th/cmp-nvim-lsp'  " lsp sources for auto cmp
Plug 'saadparwaiz1/cmp_luasnip' " buffer sources for auto cmp
Plug 'L3MON4D3/LuaSnip'      " Lua snip

Plug 'nvim-lualine/lualine.nvim' " status on the botton
Plug 'akinsho/bufferline.nvim'   " status on the top
call plug#end()
" automatically calls
"syntax on " enable syntax highlighting
"filetype plugin indent on " allow auto-indenting depending on file type

" install lua side
lua require('config')


" -------------------------- General Settings ---------------------------
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

set background=dark
colorscheme iceberg


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
set shortmess-=F       " Show nvim-metals logs

" for status-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode         " no show mode for default
set laststatus=2       " turn on bottom bar

" buffer setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden             " hide buffer
set autowrite          " for buffer autowrite
set termguicolors

" code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=manual

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
" let g:termdebugger="/scratch/joonho.whangbo/coding/the-one-profiler/chipyard/.conda-env/riscv-tools/bin/riscv64-unknown-linux-gnu-gdb"



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


highlight ColorColumn ctermbg=darkgray




" -------------------------- Key Mappings ---------------------------
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

" termdebug exit terminal-mode
tnoremap <Esc> <C-\><C-n>

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
" nnoremap <C-g> :!grep -irn

" Have ctags automatically check for all tags first and present them
nnoremap <C-]> g<C-]>

