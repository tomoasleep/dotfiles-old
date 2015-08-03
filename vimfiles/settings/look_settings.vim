
"" colorscheme
NeoBundle 'pyte'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle "w0ng/vim-hybrid"
"" NeoBundle "jonathanfilip/vim-lucius"
"" NeoBundle "morhetz/gruvbox"
"" NeoBundle "vim-scripts/github-theme"
"" NeoBundle "chriskempson/vim-tomorrow-theme"

"" startify
NeoBundle 'mhinz/vim-startify'

let g:startify_custom_header = readfile($HOME . '/.vim/custom_header')

"" airline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

"" look utils
NeoBundle 't9md/vim-quickhl'
NeoBundle "nathanaelkane/vim-indent-guides"
"" Bundle "TagHighlight"

"" NeoBundle 'osyo-manga/vim-precious',
""   \ {'depends': 'Shougo/context_filetype.vim' }

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
set smarttab

set laststatus=2
set tabstop=2
set shiftwidth=2
set linespace=0

set number
set splitbelow
set hlsearch

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
""let g:solarized_termcolors=256
""set background=dark
""light にしたければ下
function! g:MyStartUpFunc.syntax()
  syntax enable
  colorscheme solarized
  set background=light
endfunction

if has("gui_running")
else
  let g:solarized_termcolors=256
  set t_Co=16
endif
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"


"" airline.vim
" * enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1
" * change the text for when no branch is detected
let g:airline#extensions#branch#empty_message = ''
