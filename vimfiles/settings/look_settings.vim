
"" colorscheme
NeoBundle 'pyte'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle "w0ng/vim-hybrid"
NeoBundle "jonathanfilip/vim-lucius"

"" airline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

"" look utils
NeoBundle 't9md/vim-quickhl'
"" Bundle "TagHighlight"

NeoBundle 'osyo-manga/vim-precious',
  \ {'depends': 'Shougo/context_filetype.vim' }

" カーソル行をハイライト
set cursorline
" " カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=white guibg=black

set autoindent
set expandtab
set shiftwidth=4
set number
set splitbelow
set laststatus=2
set hlsearch

set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set linespace=0
set title
set wildmenu
set showcmd
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set notitle
set nowrap
"set listchars=tab:>\
set nocursorline

if has("gui_running")
else
  set vb t_vb=
endif

set vb
set t_vb=''

""Solarized
syntax enable
""let g:solarized_termcolors=256
""set background=dark
""light にしたければ下
colorscheme solarized
set background=light
