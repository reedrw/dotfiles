"
"                      ##
"                      ""
"         ##m  m##   ####     ####m##m   ##m####   m#####m
"          ##  ##      ##     ## ## ##   ##"      ##"    "
"          "#mm#"      ##     ## ## ##   ##       ##
"  ##       ####    mmm##mmm  ## ## ##   ##       "##mmmm#
"  ""        ""     """"""""  "" "" ""   ""         """""

execute pathogen#infect()
let base16colorspace=256
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
colorscheme base16-default-dark
syntax on
set title
set nu
set t_Co=256
set colorcolumn=80
set cursorline
set hidden
set mouse=a
set tabstop=4
set noshowmode
set ttimeoutlen=50
set updatetime=40
set foldmethod=marker
set list lcs=tab:\│\ ,eol:¬
let g:livepreview_previewer = 'zathura'
autocmd BufNewFile,BufRead *.tex :set spell
autocmd BufNewFile,BufRead *.md :set spell
command C '<,'>w !xclip -i -selection clipboard
command W w !sudo tee % > /dev/null
map q :q<CR>
map <Space> za
map <C-S-c> :w !xclip -i -selection clipboard<CR><CR>
nnoremap <C-L> :NERDTreeTabsToggle<CR>
nnoremap <C-T> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
