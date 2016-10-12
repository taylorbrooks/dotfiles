" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'skwp/greplace.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>j :%!cat % <bar> jq '.'<CR>
nnoremap <Leader>a :Ack!
nnoremap <Leader><bs> :Ack! '\b<c-r><c-w>\b'<cr>
nnoremap <C-w>- :spl<cr>
nnoremap <C-w><bar> :vsp<cr>

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

let g:ackprg = 'ag --vimgrep'
