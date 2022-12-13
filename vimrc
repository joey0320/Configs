set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

" GUI RELATED PLUGINS
" Plug 'itchyny/lightline.vim'
" Plug 'ap/vim-buftabline'
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-slash'
Plug 'obcat/vim-hitspop'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" GIT GUI
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'xuyuanp/nerdtree-git-plugin' "incompatible issues in centos 8??

""" FOR COMMENTING
Plug 'chrisbra/vim-commentary' 

" COLOR SCHEMES
" Plug 'morhetz/gruvbox'
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
" Plug 'cocopon/iceberg.vim'

" SYNTATIC LANGUAGE SUPPORT
Plug 'w0rp/ale'
Plug 'bfrg/vim-cpp-modern'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" HIGHLIGHTING
Plug 'yggdroot/indentline'
Plug 'andymass/vim-matchup'
Plug 'machakann/vim-highlightedyank'
" Plug 'jackguo380/vim-lsp-cxx-highlight'

" AUTO COMPLETE
" Plug 'CmdlineComplete'
Plug 'ycm-core/YouCompleteMe'

" JUMPING TO DEFINITION
Plug 'jlanzarotta/bufexplorer'
Plug 'universal-ctags/ctags'

" USING THE SYSTEM CLIPBOARD
" Plug 'christoomey/vim-system-copy'

" DEBUG
" Plug 'puremourning/vimspector' "I really should work on setting this up

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE SPECIFIC PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN FOR SCALA
" Plug 'derekwyatt/vim-scala'

" PLUGIN FOR GO
" Plug 'fatih/vim-go'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/startup/settings.vim
source ~/.vim/startup/mappings.vim
" source ~/.vim/startup/coc.vim
