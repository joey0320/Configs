
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

" GUI RELATED PLUGINS
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-slash'
" Plug 'obcat/vim-hitspop' "No support for Neovim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" GIT GUI
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

""" FOR COMMENTING
Plug 'chrisbra/vim-commentary' 

" COLOR SCHEMES
" Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" SYNTATIC LANGUAGE SUPPORT
" Plug 'w0rp/ale'
" Plug 'bfrg/vim-cpp-modern'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" HIGHLIGHTING
Plug 'yggdroot/indentline'
Plug 'andymass/vim-matchup'
Plug 'machakann/vim-highlightedyank'

" AUTO COMPLETE
" Plug 'ycm-core/YouCompleteMe'

" JUMPING TO DEFINITION
Plug 'jlanzarotta/bufexplorer'
Plug 'universal-ctags/ctags'

" USING THE SYSTEM CLIPBOARD
" Plug 'christoomey/vim-system-copy'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.config/nvim/settings.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/coc.vim
