
call plug#begin()

" PRODUCTIVITY
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'              " GIT
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-rails'                 " RUBY
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'

Plug 'elixir-lang/vim-elixir'          " ELIXIR
Plug 'slashmili/alchemist.vim'


call plug#end()

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
set noshowmode
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
map <Leader>l :call RunLastSpec()<CR>
map <Leader>s :call RunAllSpecs()<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>j :%!cat % <bar> jq '.'<CR>
nnoremap <Leader>a :Ack!
nnoremap <Leader><bs> :Ack! '<c-r><c-w>'<cr>
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

let g:ackprg = 'ag --vimgrep'

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
let g:fzf_layout = { 'down' : '~20%' }
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

iabbrev bpry      require 'pry'; binding.pry
iabbrev brpry     require 'pry-remote'; binding.remote_pry
