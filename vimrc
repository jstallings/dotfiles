set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'elixir-lang/vim-elixir'
Plugin 'hashivim/vim-terraform'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Bundle 'edkolev/tmuxline.vim'

call vundle#end()            " required

let mapleader=","

inoremap <leader>, <ESC>
nnoremap <leader><leader> <c-^>


map <Leader>pp :%!python -m json.tool<CR>

" Save a keystroke when navigating splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l


filetype plugin indent on    " required

" Git mappings

nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gs :Gstatus<CR>

let g:rspec_command = "Dispatch bundle exec rspec {spec}"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"let g:solarized_termcolors=16
colorscheme solarized

"vim-terraform
let g:terraform_align=1
autocmd FileType terraform setlocal commentstring=#%s

autocmd FileType qf setlocal wrap linebreak

syntax on
set noswapfile
set nobackup

"
" Text Formatting
"

set autoindent
inoremap # X<BS>#
set nowrap

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

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
set relativenumber
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

map <leader>b :call ToggleBackground()<CR>
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


" Spelling aliases
command! Q q " Bind :Q to :q
command! Wq wq "Bind :Wq to wq


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

function! ToggleBackground()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction


python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
