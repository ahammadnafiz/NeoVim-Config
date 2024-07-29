" @ahammadnafiz

" Explicitly set compiler path
let $PATH = $PATH . ';C:\MinGW\bin'
let g:make_program = 'C:\MinGW\bin\mingw32-make.exe'

" Vim-Plug Section
call plug#begin()
" Existing plugins
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/rstacruz/vim-closer'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'

" Python-specific plugins
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" Additional plugins for enhanced development
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/which-key.nvim'

" Telescope and its dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-tree/nvim-web-devicons'

" New powerful plugins
Plug 'folke/trouble.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/todo-comments.nvim'
Plug 'ahmedkhalf/project.nvim'
call plug#end()

" Basic Settings
set number
set relativenumber
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
set nowrap
set cursorline
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set scrolloff=8
set noshowmode
set wrap
set linebreak
set showbreak=↪\ 
set breakindent
set guicursor=n-v-c-i:block

" Additional settings
set ignorecase
set smartcase
set incsearch
set hlsearch
set undofile
set undodir=~/.vim/undodir
set completeopt=menuone,noselect
set pumheight=10
set timeoutlen=300
set splitbelow
set splitright

" Color Scheme and Syntax Highlighting
syntax enable
set termguicolors
colorscheme moonfly
let g:python_highlight_all = 1

" CoC Configuration
let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-prettier',
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-yaml',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-lua'
    \ ]

" Key mappings
let mapleader = " "
nnoremap <leader>e :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Python-specific mappings
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Pydocstring configuration
let g:pydocstring_formatter = 'google'

" NERDTree configuration
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Airline configuration
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '||'

" Auto-commands
augroup PythonSpecific
    autocmd!
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
augroup END


" Function to print compiler info (if needed)
function! PrintCompilerInfo()
    echo "Path: " . $PATH
    echo "Make Program: " . g:make_program
    if executable('gcc')
        echo "GCC is executable"
    else
        echo "GCC is not executable"
    endif
    if executable('clang')
        echo "Clang is executable"
    else
        echo "Clang is not executable"
    endif
endfunction

command! CompilerInfo call PrintCompilerInfo()

" Lua Configuration
lua << EOF
-- Load impatient for faster startup
require('impatient')

-- Gitsigns setup
require('gitsigns').setup()

-- Which-Key setup
require('which-key').setup {}

-- Telescope setup
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
    file_ignore_patterns = {"node_modules"},
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})

-- Trouble setup
require('trouble').setup {}

-- Lualine setup
require('lualine').setup {
    options = {
        theme = 'moonfly'
    }
}

-- Bufferline setup
require('bufferline').setup {}

-- Autopairs setup
require('nvim-autopairs').setup {}

-- Colorizer setup
require('colorizer').setup()

-- Todo-comments setup
require('todo-comments').setup {}

-- Project setup
require('project_nvim').setup {}

-- Comment setup
require('Comment').setup()

-- Indent-blankline setup
require("ibl").setup {
    -- Add any specific configurations you want here
}

-- Zen-mode and Twilight setup
require('zen-mode').setup {}
require('twilight').setup {}
EOF
