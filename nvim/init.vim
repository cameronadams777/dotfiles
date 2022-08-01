:set number
:set expandtab
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/jremmen/vim-ripgrep'
Plug 'sbdchd/neoformat'

call plug#end()

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <C-f> :Rg
nnoremap <C-S-e> :NERDTreeToggle<CR>

let g:neoformat_try_node_exe = 1

auto BufWritePre *.{html,js,jsx,ts,tsx} Neoformat
