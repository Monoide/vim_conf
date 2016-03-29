set nocompatible " be iMproved
execute pathogen#infect()

" Enable the mouse for all modes
" set mouse=a

" ?
set t_Co=256

""""""""""""""""""
" Mandatory remaps
""""""""""""""""""
let mapleader = "," " Leader key
let maplocalleader = "\\" " Leader key
nnoremap ; :
vnoremap ; :
map <tab> %
"Let's - act like $ (easier on qwerty for end of line)
map - $

"""""""""""""
" ColorScheme
"""""""""""""
syntax enable
colorscheme solarized

" Colorscheme
let g:solarized_termcolors=256

" Background black
let g:theme="black"
let g:solarized_termtrans=1
set background=dark

" Toggle color black <-> white
nnoremap <leader>c :call Toggle_theme()<CR>
"""""""""""""

" Access to this configuration file in a new tab
nnoremap <leader>rc :tabnew ~/.vim/vimrc<CR>

"Minimum setting
set encoding=utf-8
set showmode
set showcmd
set hidden

set modeline

set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~,*bbl,*.pdf,*.out,*.aux,*.blg "ignore when tab completing

" Minimum priority
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg,.pdf,.fls

" Scrolling
set scrolloff=7 "Start scrolling when we are 8 lines away from margins
set sidescrolloff=14
set sidescroll=0

" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

set relativenumber "relative line
set nu
set showmatch "cute parenthesis

" Omnicompletion
set omnifunc=syntaxcomplete#Complete

" Buffers manipulation
nnoremap <F9> :buffers<CR>:buffer<Space>
nnoremap <C-b> <C-^>

" Rainbow parenthesis activated
let g:rainbow_active = 1

""""""""""
" Research
""""""""""
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <leader><space> :noh<cr>

" Magic search
nnoremap / /\v
vnoremap / /\v

" Splitting windows
nnoremap <leader>sh :split<cr>
nnoremap <leader>sv :vsp<cr>

" Move between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Makefile
nnoremap <leader>ll :!make<cr>

" Fileformat
set fileformats=unix,dos,mac

" Indentation
filetype plugin indent on
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set modeline

" Smart spaces and tabs
set smarttab

" Fold
set foldmethod=marker
set foldenable

set textwidth=79 "max width of a line

set pastetoggle=<F2> "Nice mouse paste in insert mode

highlight LineNr ctermfg=grey

" Extra white spaces
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
" Delete trailing whitespace
nnoremap <leader>w :%s/\s\+$//g<CR>:noh<CR>

"Avoid the escape key
imap jj <Esc>
imap kk <Esc>

" Grep the visual mode selection in the folder
set grepprg=grep\ --color\ -n\ $*\ /dev/null
vnoremap <leader>g :<c-u>call GrepFolder(visualmode())<CR>

""""""""""""""
" Code ToolBox
""""""""""""""

" Git blame, thanks to Fugitive
nnoremap <leader>gb :Gblame<CR>
vnoremap <leader>gb :Gblame<CR>

" Easy commenting
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Move quickly in QuickFixWindow (very bad, to change)
nnoremap <leader>n :cn <CR>
nnoremap <leader>p :cp <CR>

""""""""""""""""
" Sage toolbox "
""""""""""""""""
" Split screen verticaly with sage in it
nnoremap <leader>sa :ConqueTermVSplit sage<CR>
vnoremap <leader>sa :ConqueTermVSplit sage<CR>
" au BufRead,BufNewFile *.sage setfiletype python
au BufRead,BufNewFile *.sage set syntax=python
" Scala syntax
au BufRead,BufNewFile *.scala set syntax=scala
" Cython syntax
au BufRead,BufNewFile *.pyx set syntax=cython

" .tex and .cls are TeX
au BufRead,BufNewFile *.cls set syntax=tex
au BufRead,BufNewFile *.cls set filetype=tex
au BufRead,BufNewFile *.tex set filetype=tex
au BufRead,BufNewFile *.tex set syntax=tex
au BufRead,BufNewFile *.tex set filetype=tex

" Sage tests on the buffered file
nmap <leader>st :!sage -tp 4 %<CR>
" Recompile sage and make the tests on the buffered file
nmap <leader>bst :!sage -b && sage -tp 4 %<CR>

" When .vimrc is edited, auto-reload it
autocmd! bufwritepost ~/.vim/vimrc source %

" Toogle cross cursor
" TODO: make it beautiful
hi CursorLine   cterm=NONE ctermbg=LightGray ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=LightGray ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>C :set cursorline! cursorcolumn!<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>

" CtrlP
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.fls$\|\.so$\|\.toc$\|\.gz' }

" Write some emails...
autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>
"
" Lightline
set laststatus=2
" disable default showmode
set noshowmode
let g:bufferline_echo = 0

let g:Powerline_symbols = 'fancy'

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
