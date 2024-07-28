'@ahammadnafiz'

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/plenary.nvim'

" New powerful plugins
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/trouble.nvim'
Plug 'kyazdani42/nvim-web-devicons'
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
"set colorcolumn=88
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
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <silent> <leader>z :ZenMode<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F8> :TagbarToggle<CR>

" FZF mappings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

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

" Lua Configuration
lua << EOF
-- Load impatient for faster startup
require('impatient')

-- Gitsigns setup
require('gitsigns').setup()

-- Which-Key setup
require('which-key').setup {}

-- Telescope setup
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
        -- Add any extensions here
    }
}

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

-- Indent-blankline setup (updated for version 3)
require("ibl").setup {
    -- Add any specific configurations you want here
    -- For example:
    -- indent = { char = "│" },
    -- scope = { show_start = false, show_end = false },
}

-- Zen-mode and Twilight setup
require('zen-mode').setup {}
require('twilight').setup {}
EOF

" Auto-commands
augroup PythonSpecific
    autocmd!
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
augroup END

" CoC completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

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

