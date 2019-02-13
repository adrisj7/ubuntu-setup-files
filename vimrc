filetype plugin on

set encoding=utf-8

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

set spelllang=en

""" Special file formatting
"HTML
au FileType html setlocal shiftwidth=2 softtabstop=2 et
"Makefile
autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=0 softtabstop=0 et
"Markdown spell checking
autocmd Filetype markdown setlocal spell

"""""""""""""""" Plugins
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Disabled YCM in favor of clang complete
" Plug 'Valloric/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'rip-rip/clang_complete'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'sophacles/vim-processing'
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()

" clang complete configs
let g:clang_library_path='/usr/lib/llvm-6.0/lib'

"" extra ycm configs
" let g:ycm_filetype_blacklist = { 'tex': 1 } " Don't mess with tex files
" let g:ycm_register_as_syntastic_checker = 1 " default 1
" let g:ycm_show_diagnostics_ui = 1           " default 1
" let g:ycm_always_populate_location_list = 1 " default 0
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
" let g:ycm_confirm_extra_conf = 1
" " will put icons in Vim's gutter on lines that have a diagnostic set.
" " Turning this off will also turn off the YcmErrorLine and YcmWarningLine
" " highlighting
" let g:ycm_enable_diagnostic_signs = 1
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_always_populate_location_list = 1 "default 0
" let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
"
" let g:ycm_complete_in_strings = 1 "default 1
" let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
" let g:ycm_path_to_python_interpreter = '' "default ''
"
" let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
    " let g:ycm_server_log_level = 'info' "default info

"" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"" airline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline_theme='badcat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_checkers   = ['gcc']

" Mainly for clang_complete, but goes for anything.
" Close the upper window if we move around.
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Clang speed ++
set completeopt-=preview
