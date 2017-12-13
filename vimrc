"          _
"   _   __(_)___ ___  __________
"  | | / / / __ `__ \/ ___/ ___/
" _| |/ / / / / / / / /  / /__
"(_)___/_/_/ /_/ /_/_/   \___/

execute pathogen#infect()
let base16colorspace=256
let g:airline_theme='base16'
colorscheme base16-default-dark
set nu
syntax on
set t_Co=256
set colorcolumn=80
set cursorline
set mouse=a
set tabstop=4
set noshowmode
set ttimeoutlen=50
set updatetime=40
set foldmethod=marker
set list lcs=tab:\¦\ "
let g:livepreview_previewer = 'zathura'
let g:airline_powerline_fonts = 1
autocmd BufNewFile,BufRead *.tex :set spell
autocmd BufNewFile,BufRead *.md :set spell
command W w !sudo tee % > /dev/null
map q :q<CR>
map <Space> za
