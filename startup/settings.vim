
" general settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax
syntax enable

" colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
" colorscheme solarized8
" colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'
" colorscheme nord
" set termguicolors
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
colorscheme nord


" tabs and spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" backspace to prev line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start

" ui configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

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
" set autowrite          " for buffer autowrite

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


" termdebug config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd termdebug
let g:termdebug_wide=1
let g:termdebug_leftsource = 1
let g:termdebug_focussource = 1
let g:termdebug_disable_toolbar = 1
hi debugPC term=reverse ctermbg=8 guibg=darkblue


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

" ctags (jumping to def)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags

" auto update ctags when a file is written
function! DelTagOfFile(file)
	let fullpath = a:file
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let f = substitute(fullpath, cwd . "/", "", "")
	let f = escape(f, './')
	let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
	let resp = system(cmd)
endfunction

function! UpdateTags()
	let f = expand("%:p")
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
	call DelTagOfFile(f)
	let resp = system(cmd)
endfunction

autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
