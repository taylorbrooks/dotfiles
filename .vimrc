call plug#begin()

Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'

if has('nvim')
  Plug 'slashmili/alchemist.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:SuperTabDefaultCompletionType = '<c-n>'
endif

call plug#end()

autocmd! BufWritePost * Neomake
autocmd! BufReadPost * Neomake

syntax on
colorscheme Tomorrow-Night-Eighties

set cursorline
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set hidden
set lazyredraw
set laststatus=2
set list listchars=tab:»·,trail:·
set number
set nobackup
set noswapfile
set nowritebackup
set softtabstop=2 shiftwidth=2 expandtab
set splitright
set splitbelow
set visualbell
set wildmenu
set wildmode=list:longest,full

set hlsearch
set incsearch
set ignorecase
set smartcase

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END
autocmd BufWritePre * %s/\s\+$//e

au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

let mapleader = ","

imap jj <esc>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <Leader><space> :nohl<cr>
map <Leader>vv :vsp<cr><C-p>
map <Leader>nn :vs ~/Documents/Sync/notes<cr>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>j :%!cat % <bar> jq '.'<CR>
nnoremap <Leader>a :Ack!
nnoremap <Leader><bs> :Ack! '\b<c-r><c-w>\b'<cr>
nnoremap <C-w>- :spl<cr>
nnoremap <C-w><bar> :vsp<cr>

inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

let g:ackprg = 'ag --vimgrep'
