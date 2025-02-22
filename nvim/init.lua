-- Initialize lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
-- 'preservim/nerdtree',
  'folke/tokyonight.nvim',
  'andymass/vim-matchup',
  'machakann/vim-highlightedyank',
  'junegunn/vim-slash',
  'nvim-lualine/lualine.nvim',
  'akinsho/bufferline.nvim',
  'famiu/bufdelete.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'rcarriga/nvim-notify',
  'petertriho/nvim-scrollbar',
  'airblade/vim-gitgutter',
  'akinsho/git-conflict.nvim',
  'tpope/vim-fugitive',
  'junegunn/gv.vim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'scalameta/nvim-metals',
  'L3MON4D3/LuaSnip',
  'NoahTheDuke/vim-just',
  'chrisbra/vim-commentary',
-- 'nvimdev/indentmini.nvim',
  { "cordx56/rustowl", dependencies = { "neovim/nvim-lspconfig" } },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      indent = {
        enabled = true,
        only_scope = true,
        hl = "SnacksIndent",
        animate = {
          enabled = false,
        }
      },
      scroll = { enabled = false },
      scope = { enable = false },
      statuscolumn = { enabled = false },
      notifier = { timeout = 3000, },
      input = {enable = true },
      quickfile = { enabled = true },
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      words = {enable = false },
      terminal = {
        enable = true,
      }
    },
  },
  {
    "tzachar/cmp-ai",
    enabled = true,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local cmp_ai = require("cmp_ai.config")

      cmp_ai:setup {
        max_lines = 1000,
        notify = false,
        notify_callback = function(msg)
          vim.notify(msg)
        end,
        run_on_every_keystroke = true,
        ignored_file_types = {
          TelescopePrompt = true,
        },
        -- provider = ollama
        provider = "Ollama",
        provider_options = {
          model = "codellama:7b-code",
        },
      }
    end,
  },
})


-- General Settings
vim.cmd [[
  syntax on
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set colorcolumn=79
  set listchars=tab:>·,trail:~,extends:>,precedes:<
  set list
  set background=dark
  set backspace=indent,eol,start
  set nowrap
  set number
  set relativenumber
  set showcmd
  set cursorline
  set showmatch
  set wildmenu
  set updatetime=100
  set ttyfast
  set mouse+=a
  set encoding=utf-8
  set termencoding=utf-8
  set ttimeout
  set ttimeoutlen=50
  set clipboard=unnamedplus
  filetype indent on
  filetype plugin on
  let g:python_recommended_style=0
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  set shortmess-=F
  set noshowmode
  set laststatus=2
  set hidden
  set autowrite
  set termguicolors
  set foldmethod=manual
  colorscheme tokyonight-night
  highlight WinSeparator guifg=#394b70 guibg=None
]]

-- Termdebug configuration
vim.cmd [[
  packadd termdebug
  let g:termdebug_wide=1
  let g:termdebug_leftsource = 1
  let g:termdebug_focussource = 1
  let g:termdebug_disable_toolbar = 1
  hi debugPC term=reverse ctermbg=8 guibg=darkblue
" change termdebug path
" let g:termdebugger="/scratch/joonho.whangbo/coding/the-one-profiler/chipyard/.conda-env/riscv-tools/bin/riscv64-unknown-linux-gnu-gdb"
]]

-- disable netrw at the very start of your init.lua (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })


-- Show hidden files in NERDTree
-- vim.g.NERDTreeShowHidden = 1

-- Conflict marker settings
vim.g.conflict_marker_enable_mappings = 0
vim.g.conflict_marker_enable_matchit = 0

-- Highlight the color column
vim.cmd [[highlight ColorColumn ctermbg=darkgray]]

 -- run the 'open' command on the current buffer
vim.api.nvim_create_user_command('Rfinder',
 function()
   local path = vim.api.nvim_buf_get_name(0)
   local path_format =  string.format('%q', path)
   os.execute('open ' .. path_format)
 end,
 {}
)

--------------------------------------------------------------
-- Key mappings
--------------------------------------------------------------

-- Faster scroll
vim.api.nvim_set_keymap('n', '<C-e>', '10<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-y>', '10<C-y>', { noremap = true, silent = true })

-- termdebug exit terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- For nerdtree
-- vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Leader key
vim.g.mapleader = ' '

-- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Better window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- move btw buffers
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Have ctags automatically check for all tags first and present them
vim.api.nvim_set_keymap('n', '<C-]>', 'g<C-]>', { noremap = true, silent = true })

-- run the "open" command on the current buffer on mac
vim.api.nvim_set_keymap('n', '<Leader>o', ':Rfinder<CR>', { noremap = true, silent = true })

-- Show diagnostic
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap=true, silent=true })


-- LSP Mappings
local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)


vim.notify = require("notify")


vim.g.augment_workspace_folders = { '/scratch/joonho.whangbo/coding/rusty-livehd/' }


--------------------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------------------
require "user.telescope"
require "user.metals"
require "user.lsp"
require "user.bufferline"
require "user.tokyonight"
require "user.noice"
require "user.nvimtree"

require("scrollbar").setup()
require('lualine').setup()
-- require('nvim-tree').setup()
