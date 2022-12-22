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
" Plug 'frazrepo/vim-rainbow' " colors for parentheses
" Plug 'bfrg/vim-cpp-modern' " C++ highlighting
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'PhilRunninger/nerdtree-visual-selection' " open multiple files at once
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/startup/settings.vim
source ~/.vim/startup/mappings.vim
" source ~/.vim/startup/coc.vim
