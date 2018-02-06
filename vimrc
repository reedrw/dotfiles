"
"                      ##
"                      ""
"         ##m  m##   ####     ####m##m   ##m####   m#####m
"          ##  ##      ##     ## ## ##   ##"      ##"    "
"          "#mm#"      ##     ## ## ##   ##       ##
"  ##       ####    mmm##mmm  ## ## ##   ##       "##mmmm#
"  ""        ""     """"""""  "" "" ""   ""         """""

execute pathogen#infect()
let g:airline_powerline_fonts = 1
colorscheme wal
syntax on
set title
set nu
set relativenumber
set hidden
set mouse=a
set tabstop=4
set noshowmode
set ttimeoutlen=50
set updatetime=40
set foldmethod=marker
set list lcs=tab:\│\ ,eol:¬
let g:livepreview_previewer = 'mupdf'
autocmd BufWritePre * %s/\s\+$//e
autocmd BufNewFile,BufRead *.tex :set spell
autocmd BufNewFile,BufRead *.md :set spell
command W w !sudo tee % > /dev/null
map q :q<CR>
map <Space> za
map <C-S-c> :w !xclip -i -selection clipboard<CR><CR>
nnoremap <C-L> :NERDTreeTabsToggle<CR>
nnoremap <C-T> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
