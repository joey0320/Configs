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
nnoremap <C-g> :!grep -irn

" Have ctags automatically check for all tags first and present them
nnoremap <C-]> g<C-]>

