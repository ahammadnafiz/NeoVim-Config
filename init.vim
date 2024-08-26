call plug#begin()
" Core plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'lewis6991/gitsigns.nvim'

" Lazy-loaded plugins
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'html', 'javascript'] }
Plug 'vimwiki/vimwiki', { 'on': ['VimwikiIndex', 'VimwikiDiaryIndex'] }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Python-specific plugins (lazy-loaded)
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" Git plugins (lazy-loaded)
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'tpope/vim-fugitive', { 'on': ['Git', 'Gstatus', 'Gcommit', 'Gpush', 'Gpull'] }

" Additional plugins (lazy-loaded)
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }

Plug 'lewis6991/impatient.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-tree/nvim-web-devicons'

" New powerful plugins (lazy-loaded)
Plug 'folke/trouble.nvim', { 'on': 'TroubleToggle' }
Plug 'lukas-reineke/indent-blankline.nvim', { 'on': 'IndentBlanklineToggle' }
Plug 'numToStr/Comment.nvim', { 'on': ['CommentToggle', 'CommentToggleInline'] }
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'windwp/nvim-autopairs'

" Zettelkasten plugins (lazy-loaded)
Plug 'michal-h21/vim-zettel', { 'for': 'markdown' }

" Rust plugin (lazy-loaded)
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

call plug#end()

" Basic Settings
set number relativenumber
set autoindent expandtab
set tabstop=4 shiftwidth=4 smarttab softtabstop=4
set mouse=a encoding=UTF-8
set nowrap cursorline hidden
set nobackup nowritebackup
set cmdheight=2 updatetime=300 shortmess+=c signcolumn=yes
set scrolloff=8 noshowmode
set wrap linebreak showbreak=↪\  breakindent
set guicursor=n-v-c-i:block
set ignorecase smartcase incsearch hlsearch
set undofile undodir=~/.vim/undodir
set completeopt=menuone,noselect
set pumheight=10 timeoutlen=300
set splitbelow splitright

" Color Scheme and Syntax Highlighting
syntax enable
set termguicolors
colorscheme moonfly
let g:python_highlight_all = 1

" CoC Configuration
let g:coc_global_extensions = [
    \ 'coc-pyright', 'coc-json', 'coc-git', 'coc-prettier', 'coc-pairs',
    \ 'coc-snippets', 'coc-yaml', 'coc-tslint-plugin', 'coc-tsserver',
    \ 'coc-css', 'coc-html', 'coc-lua', 'coc-rust-analyzer'
    \ ]

" Key mappings
let mapleader = " "
nnoremap <leader>e :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Python-specific mappings
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Pydocstring configuration
let g:pydocstring_formatter = 'google'

" Rust-specific settings
autocmd FileType rust nmap <leader>rt :RustTest<CR>
autocmd FileType rust nmap <leader>rr :RustRun<CR>

" Zettelkasten key mappings
nnoremap <leader>zn :ZettelNew<space>
nnoremap <leader>zo :ZettelOpen<CR>
nnoremap <leader>zb :ZettelBacklinks<CR>
nnoremap <leader>zu :ZettelInbox<CR>
nnoremap <leader>zl :ZettelGenerateLinks<CR>
nnoremap <leader>zt :ZettelGenerateTags<CR>
nnoremap <leader>zs :ZettelSearch<CR>

" fzf configuration
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>

" NERDTree configuration
let g:NERDTreeDirArrowExpandable=" "
let g:NERDTreeDirArrowCollapsible=" "

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

" Lua Configuration
lua << EOF
-- Load impatient for faster startup
require('impatient')

-- Gitsigns setup
require('gitsigns').setup()

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

-- Treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "lua", "vim", "rust"},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}

-- Set foldmethod to use treesitter, but start with all folds open
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99

EOF
