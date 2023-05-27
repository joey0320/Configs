" vim plug options


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

Plug 'scalameta/nvim-metals' " metals (scala lsp backend)
Plug 'neovim/nvim-lspconfig' " lsp config for nvim
Plug 'hrsh7th/nvim-cmp'      " auto cmp
Plug 'hrsh7th/cmp-nvim-lsp'  " lsp sources for auto cmp
Plug 'saadparwaiz1/cmp_luasnip' " buffer sources for auto cmp
Plug 'L3MON4D3/LuaSnip'      " Lua snip
call plug#end()
" automatically calls
"syntax on " enable syntax highlighting
"filetype plugin indent on " allow auto-indenting depending on file type

source ~/.config/nvim/settings.vim
source ~/.config/nvim/mappings.vim

" install lua side
lua require('config')
