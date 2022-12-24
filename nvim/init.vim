" vim plug options

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '$XDG_CONFIG_HOME/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " parse file into tree for better highlighting, etc
Plug 'nvim-lua/plenary.nvim' " see nextline
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " fuzzy finder
Plug 'shaunsingh/nord.nvim' " colors, easy for my eyes
Plug 'preservim/nerdtree' " file tree explorer
Plug 'ojroques/nvim-hardline' " buff+status line
Plug 'craigemery/vim-autotag' " save (and update) ctags on file save
Plug 'akinsho/git-conflict.nvim' " git conflict marker highlighting
Plug 'lukas-reineke/indent-blankline.nvim' " indentation guides
Plug 'airblade/vim-gitgutter' " marks changed lines
Plug 'rhysd/conflict-marker.vim' " fight against merge conflicts
Plug 'chrisbra/vim-commentary' " easier commenting
Plug 'w0rp/ale' " syntax check
Plug 'andymass/vim-matchup' " move between matching parenthesis
Plug 'ojroques/vim-oscyank' " copy to system clipboard
Plug 'universal-ctags/ctags' " for ctags
Plug 'craigemery/vim-autotag' " automatic update of ctags
Plug 'machakann/vim-highlightedyank' " highlight yanked parts
Plug 'junegunn/vim-slash' " highlights for in-buf search
Plug 'tpope/vim-fugitive' " Git inside vim

Plug 'VonHeikemen/lsp-zero.nvim' " plugin to rule all the lsp stuff
Plug 'neovim/nvim-lspconfig' " neovim built in lsp (lsp-zero req)
Plug 'williamboman/mason.nvim' " (lsp-zero req)
Plug 'williamboman/mason-lspconfig.nvim' " (lsp-zero req)
Plug 'hrsh7th/nvim-cmp' " autocmp (lsp-zero req)
Plug 'hrsh7th/cmp-buffer' " autocmp (lsp-zero req)
Plug 'hrsh7th/cmp-path' " autocmp (lsp-zero req)
Plug 'saadparwaiz1/cmp_luasnip' " autocmp (lsp-zero req)
Plug 'hrsh7th/cmp-nvim-lsp' " autocmp (lsp-zero req)
Plug 'hrsh7th/cmp-nvim-lua' " autocmp (lsp-zero req)
Plug 'L3MON4D3/LuaSnip' " autocmp snippets (lsp-zero req)
Plug 'rafamadriz/friendly-snippets' " autocmp snippets (lsp-zero req)
call plug#end()
" automatically calls
"syntax on " enable syntax highlighting
"filetype plugin indent on " allow auto-indenting depending on file type

source ~/.config/nvim/settings.vim
source ~/.config/nvim/mappings.vim

" install lua side
lua require('config')
