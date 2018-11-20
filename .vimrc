set nocompatible                " choose no compatibility with legacy vi
filetype off
set rtp+=/home/adam/.vim/bundle/Vundle.vim
set number                      " display line numbers
set colorcolumn=80
set autoindent
"set autochdir                   " auto change current directory
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'danro/rename.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ervandew/supertab'
Plugin 'tomasr/molokai'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'slim-template/vim-slim'
Plugin 'rupa/z'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-latex/vim-latex'
" Python
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'python-mode/python-mode'
Plugin 'lepture/vim-jinja'
" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
" C++
Plugin 'octol/vim-cpp-enhanced-highlight'
" Colour schemes
Plugin 'sjl/badwolf'
Plugin 'cocopon/iceberg.vim'
Plugin 'chriskempson/base16-vim'

set t_Co=256   " terminal is in 256color mode

call vundle#end()            " required

filetype plugin on
filetype indent on
set autoindent    " required
"let base16colorspace=256
colorscheme badwolf

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
map <leader>tn :tabnew<cr>      " open a new tab
map <leader>tc :tabclose<cr>    " close the current tab
map } :tabn<cr>         " navigate tabs
map { :tabp<cr>

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set cursorline                  " highlight current line"
set wildmenu
" RSpec.vim mappings
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" Open the corresponding spec file
map <leader>/ :AV<cr>,.
let g:rspec_command = "!bundle exec rspec {spec}"

set smartcase                   " ... unless they contain at least one capital letter
" clear contents of current line
nmap <C-E> 0D
" create new empty line under current line
nmap <Enter> o<Esc>k
" search for visually selected text
vnoremap // y/<C-R>"<CR>

cabbr <expr> %% expand('%:p:h') " opens current directory when searching
:set sessionoptions-=options
set noswapfile

" toggle NERDtree
map <Leader>n :NERDTreeToggle<CR>
" insert binding.pry on a new line
map mm obinding.pry<ESC>

" indent entire page
map <Leader>= gg99999==''

" visually select the word under the cursor
noremap fv viw
" navigate vim windows
noremap <C-Right> <C-w><Right>
noremap <C-Left> <C-w><Left>
noremap <C-Up> <C-w><Up>
noremap <C-Down> <C-w><Down>
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
" resize vim windows
noremap <S-Left> <C-w><
noremap <S-Up> <C-W>+
noremap <S-Down> <C-W>-
noremap <S-Right> <C-w>>
noremap <S-h> <C-w><
noremap <S-k> <C-w>+
noremap <S-j> <C-w>-
noremap <S-l> <C-w>>
command! -nargs=1 -complete=file WE write | edit <args>
" for ctags and ctrl p
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <leader>b :TagbarToggle<CR>
" reopen last closed window
nmap <c-s> :vs<bar>:b#<CR>

set clipboard=unnamedplus        " yank from visual to clipboard
let g:ackprg = 'ag --nogroup --nocolor --column'
noremap gb :Gblame<Enter>
" for latex files
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor = 'latex'

" clear whitespace
map <leader>w :%s/\s\+$//<CR>
" text width for commit messages
au FileType gitcommit set tw=72
" open new split to the right
set splitright
" turn off highlight after search
set nohlsearch
