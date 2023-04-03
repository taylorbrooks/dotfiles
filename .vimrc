call plug#begin('~/.vim/plugged')

" THEME
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" PRODUCTIVITY
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'chrisbra/csv.vim'
Plug 'github/copilot.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'mattn/emmet-vim'                 " HTML
Plug 'pangloss/vim-javascript'         " JS
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-fugitive'              " GIT

Plug 'tpope/vim-rails'                 " RUBY
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'

Plug 'elixir-lang/vim-elixir'          " ELIXIR
Plug 'slashmili/alchemist.vim'

call plug#end()

syntax on
set background=dark
colorscheme gruvbox

set cursorline
set cursorcolumn
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
set re=2
set softtabstop=2 shiftwidth=2 expandtab
set splitright
set splitbelow
set visualbell
set wildmenu
set wildmode=list:longest,full

set colorcolumn=80
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
map <Leader>sdot :source ~/.vimrc<cr>
map <Leader><space> :nohl<cr>
map <Leader>vv :vsp<cr><C-p>
map <Leader>nn :vs ~/Documents/Sync/notes<cr>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>s :call RunAllSpecs()<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>f :F<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
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

let g:rg_command = '
  \ rg --line-number --no-heading --fixed-strings --ignore-case --no-ignore --color "always"
  \ --colors "line:fg:yellow"
  \ --colors "line:style:bold"
  \ --colors "path:fg:red"
  \ --colors "path:style:bold"
  \ --colors "match:fg:white"
  \ --colors "match:bg:black"
  \ -g "*.{js,md,jade,html,config,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 0, <bang>0)

let g:ale_fixers = { 'javascript' : ['eslint']}
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:gruvbox_contrast_light = "hard"
let g:user_emmet_leader_key=','

iabbrev bpry      require 'pry'; binding.pry
iabbrev brpry     require 'pry-remote'; binding.remote_pry
