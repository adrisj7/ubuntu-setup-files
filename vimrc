filetype plugin on

""" General Formatting
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set showcmd    " show command in bottom bar
set wildmenu   " visual autocomplete for command menu
set lazyredraw
set showmatch  " highlight matching brackets
set incsearch  " search as characters are entered
set hlsearch   " highlight matches


""" Special file formatting
"HTML
au FileType html setlocal shiftwidth=2 softtabstop=2 et
"Makefile
autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=0 softtabstop=0 et

