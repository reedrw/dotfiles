call plug#begin()

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'dylanaraps/wal.vim'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'jceb/vim-orgmode'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-speeddating'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ' ln'
let g:airline_symbols.branch = '⭠'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tabs = 0

let g:airline_mode_map = {
	\ '__'     : ' - ',
	\ 'c'      : ' C ',
	\ 'i'      : ' I ',
	\ 'ic'     : ' I ',
	\ 'ix'     : ' I ',
	\ 'n'      : ' N ',
	\ 'multi'  : ' M ',
	\ 'ni'     : ' N ',
	\ 'no'     : ' N ',
	\ 'R'      : ' R ',
	\ 'Rv'     : ' R ',
	\ 's'      : ' S ',
	\ 'S'      : ' S ',
	\ ''     : ' S ',
	\ 'v'      : ' V ',
	\ 'V'      : 'V-L',
	\ ''     : 'V-B',
\}

let base16colorspace=256
colorscheme base16-classic-dark
syntax on
set t_Co=256
set title
set nu
"set relativenumber
set numberwidth=5
set hidden
set smartindent
set nohlsearch
set mouse=a
set tabstop=4
set shiftwidth=4
set noshowmode
set ttimeoutlen=50
set updatetime=40
set foldmethod=marker
set list lcs=tab:\|\ 
let g:livepreview_previewer = 'mupdf'
autocmd BufWritePre * %s/\s\+$//e
autocmd BufNewFile,BufRead *.tex :set spell
autocmd BufNewFile,BufRead *.md :set spell
command W w !sudo tee % > /dev/null
map Q :q<CR>
map <Space> za
map <C-c> "+y
map <S-Insert> "+p
