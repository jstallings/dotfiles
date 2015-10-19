set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required!
let mapleader=","

inoremap <leader>, <ESC>
nnoremap <leader><leader> <c-^>

:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Remap those nasty arrow keys to stop using them
"
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Save a keystroke when navigating splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

Plugin 'VundleVim/Vundle.vim'

Plugin 'msanders/cocoa.vim'

" Search and Navigation
"
Plugin 'rking/ag.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Snippets
"
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-surround'

" Dash integration
"
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'

" Git integration
"
Plugin 'tpope/vim-fugitive'

" Ruby and Rails stuff
"
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'

" Colorschemes
"
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'


call vundle#end()            " required
filetype plugin indent on    " required


nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gs :Gstatus<CR>



" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g_rspec_command = "Dispatch rspec {spec}"


"let g:solarized_termcolors=16
colorscheme solarized

filetype plugin indent on
syntax on
set noswapfile
set nobackup

"
" Powerline overrides
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'skwp'
let g:Powerline_colorscheme = 'skwp'
"
" Text Formatting
"

set autoindent
set smartindent
inoremap # X<BS>#
set nowrap
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shiftround
set expandtab
set nosmarttab
set formatoptions+=n
set virtualedit=block
set encoding=utf-8
set cursorline

"
" UI
"

set ruler
set showcmd
set nolazyredraw
set number
set wildmenu
set wildmode=list:longest,full
set ch=2
set backspace=2
set whichwrap+=<,>,h,l,[,]
set shortmess=filtIoOA
set report=0
set nostartofline
set background=dark
set autoread

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
end


nnoremap <leader>rs :source $MYVIMRC<CR>


" Set up filetype mapping for files that fall through autodetect
au BufRead,BufNewFile {GemFile,Rakefile,Vagrantfile} set ft=ruby

au BufRead,BufNewFile *.json set ft=javascript

"
" Visual Cues
"

set showmatch
set mat=5
set incsearch
set laststatus=2
set ignorecase
set nohlsearch
set visualbell

set foldmethod=indent
set foldlevel=99
" ------------------
"  NERDTree
"  -----------------
nmap <silent><C-n> :NERDTree<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nc :NERDTreeClose<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"-----------------------
"  Control-P
"-----------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"  ----------------------
"  OmniComplete
"
"  ----------------------
inoremap <Nul> <C-x><C-o>
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Spelling aliases
command! Q q " Bind :Q to :q


map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-S> <esc>:wq<CR>
imap <C-S> <esc>:wq<CR>
