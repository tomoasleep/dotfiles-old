" --- vundle.vim - プラグインの集中管理
" doc/vundle.md
" ＊filetype を一度offにして、Vundle の処理のあとでftpluginとindent を読み込むように指定。

set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
set rtp+=~/.vim/
"" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

runtime! settings/neocomplete_settings.vim
runtime! settings/unite_settings.vim
runtime! settings/vimshell_settings.vim

" vim-scripts リポジトリ (1)
""Bundle 'css_color.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle "fugitive.vim"
NeoBundle "The-NERD-tree"
NeoBundle "endwise.vim"
NeoBundle 'neco-look'
NeoBundle 'surround.vim'
NeoBundle 'Quich-Filter'
NeoBundle 'trinity.vim'
NeoBundle 'taglist.vim'
NeoBundle 'Align'
NeoBundle 'ZenCoding.vim'
NeoBundle 'pyte'
"" Bundle 'java_getset.vim'
NeoBundle 'matchit.zip'
NeoBundle "project.tar.gz"
"" Bundle "TagHighlight"

"
" github の任意のリポジトリ (2)"
NeoBundle "tpope/vim-rvm"
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle "tpope/vim-rails"
NeoBundle "thinca/vim-ref"

NeoBundle "tsaleh/vim-matchit"
NeoBundle 'thinca/vim-quickrun'
"Bundle 'm2ym/rsense'
"" Bundle 'Lokaltog/vim-powerline'
NeoBundle 'Shougo/vimproc', {
      \ 'build': {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \     },
      \ }
NeoBundle 'Shougo/neosnippet'
NeoBundle "scrooloose/syntastic"
NeoBundle "kana/vim-smartchr"
"Bundle "tyru/eskk.vim"
NeoBundle "Shougo/vinarise"
"Bundle "kana/vim-textobj-indent"
NeoBundle "gregsexton/gitv"
"" Bundle "wesleyche/SrcExpl"
NeoBundle "alpicola/vim-egison"
NeoBundle "dag/vim2hs"
"" NeoBundle "zenzike/vim-haskell"
NeoBundle "eagletmt/ghcmod-vim"
NeoBundle "eagletmt/neco-ghc"
NeoBundle "kien/ctrlp.vim"
NeoBundle "jcf/vim-latex"
NeoBundle "jonathanfilip/vim-lucius"
"" NeoBundle "Rip-Rip/clang_complete"
NeoBundle "w0ng/vim-hybrid"
""Bundle "Shougo/vinarise.vim"
NeoBundle "kchmck/vim-coffee-script"
NeoBundle "nathanaelkane/vim-indent-guides"
NeoBundle "digitaltoad/vim-jade"
NeoBundle "tyru/open-browser.vim"
NeoBundle "mattn/webapi-vim"
NeoBundle "mattn/favstar-vim"
NeoBundle "basyura/twibill.vim"
NeoBundle "basyura/bitly.vim"
NeoBundle "basyura/TweetVim"
NeoBundle "rbtnn/vimconsole.vim"
NeoBundle "rainux/vim-vala"
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'airblade/vim-rooter'
"" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tyru/restart.vim'
NeoBundle 'osyo-manga/vim-precious'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 't9md/vim-quickhl'

" github 以外のリポジトリ (3)
"Bundle "git://git.wincent.com/command-t.git"
"
runtime! settings/map_settings.vim

filetype plugin indent on
syntax on
filetype on

NeoBundleCheck

set autoindent
set expandtab
set shiftwidth=4
set number
set splitbelow

set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set laststatus=2
set hlsearch

set runtimepath+=/path/to/vimdoc-ja
set helplang=ja,en
set updatetime=400
set laststatus=2
set hlsearch
set imdisable
set ignorecase
"" not use left scroll bar to prevent from resizing when spliting varticaly
set guioptions-=L
set backspace=indent,eol,start

if has("gui_running")
else
  set vb t_vb=
endif

set vb
set t_vb=''

if has("win32") || has("win64")
  badd C:/Users/tomoya/dotfiles/_vimrc
endif

"" syntastic
"let g:syntastic_mode_map = { 'mode': 'passive',
"            \ 'active_filetypes': ['C', 'VHDL'] }
"let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_quiet_warnings = 0

if has('kaoriya')
  let s:ruby_libruby = system('ruby -rrbconfig -e "print Config::CONFIG[\"libdir\"] + \"/\" + Config::CONFIG[\"LIBRUBY\"]"')
  if filereadable(s:ruby_libruby)
    let $RUBY_DLL = s:ruby_libruby
  endif
endif


badd ~/.vimrc


nnoremap <C-z> <C-w><C-z>
let g:SrcExpl_winHeight = 4
let g:SrcExpl_jumpKey = ""
let g:SrcExpl_gobackKey = ""

let g:clang_use_library=1
let g:echodoc_enable_at_startup=1

""let g:clang_debug=1



" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/vimfiles/snippets/'
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=c
endif

" surround.vim
let g:surround_{char2nr('%')} = "%(\r)"
let g:surround_{char2nr('w')} = "%w(\r)"
let g:surround_{char2nr('#')} = "#{\r}"
let g:surround_{char2nr('e')} = "begin \r end"
let g:surround_{char2nr('i')} = "if \1if\1 \r end"
let g:surround_{char2nr('u')} = "unless \1unless\1 \r end"
let g:surround_{char2nr('c')} = "class \1class\1 \r end"
let g:surround_{char2nr('m')} = "module \1module\1 \r end"
let g:surround_{char2nr('d')} = "def \1def\1\2args\r..*\r(&)\2 \r end"
let g:surround_{char2nr('p')} = "\1method\1 do \2args\r..*\r|&| \2\r end"
let g:surround_{char2nr('P')} = "\1method\1 {\2args\r..*\r|&|\2 \r }"

""" ref.vim
nmap ,ra :<C-u>Ref alc<Space>

let g:ref_refe_cmd = "/Users/kamadoinc/Documents/Reference/ruby-refm-1.9.2-dynamic-20110729/refe-1_9_2"
let g:ref_alc_start_linenumber = 39 " 表示する行数
let g:ref_phpmanual_path = "/Users/kamadoinc/Documents/Reference/php-chunked-xhtml"

set linespace=0
set title
set wildmenu
set showcmd
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"set notimeout          " don't timeout on mappings
"set ttimeout           " do timeout on terminal key codes
"set timeoutlen=100     " timeout after 100 msec"


"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"

set mouse=a
set ttymouse=xterm2
""taglist
set tags=./tags,tags

""srcexpl.vim
let g:srcexpl_updatetags = 1
let g:srcexpl_refreshtime = 0
nnoremap <silent> <c-z> :srcexpltoggle<cr>
let g:srcexpl_refreshmapkey = "<c-b>r"
let g:srcexpl_gobackmapkey = "<c-b>b"

""powerline
"" let g:powerline_symbols = 'fancy'

let g:airline#extensions#tabline#enabled = 1

" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

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


""Solarized
syntax enable
""let g:solarized_termcolors=256
""set background=dark
""light にしたければ下
colorscheme solarized
set background=light
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


set fileformat=unix
set fileformats=unix,dos

function! s:set_fileformat()
  try
    setlocal fileformat=unix
  catch
  endtry
endfunction
autocmd BufRead * :call <SID>set_fileformat()

command! W w

"" open quickfix window auto
augroup Search
    autocmd!
    autocmd QuickFixCmdPost *grep cwindow
augroup END


"" filetype
" XAML
"" au BufNewFile,BufRead *.xaml	setf xml

" dotnet complete
"" au BufNewFile,BufRead *.cs      setl omnifunc=cs#complet
"" au BufNewFile,BufRead *.cs      setl bexpr=cs#balloon()
"" au BufNewFile,BufRead *.cs      setl ballooneval

"" au BufNewFile,BufRead *.xaml    setf xml
"" au BufNewFile,BufRead *.xaml    setl omnifunc=xaml#complete



if !has('gui_running')
  " MapFastKeycode: helper for fast keycode mappings
  " makes use of unused vim keycodes <[S-]F15> to <[S-]F37>
  function! <SID>MapFastKeycode(key, keycode)
    if s:fast_i == 46
      echohl WarningMsg
      echomsg "Unable to map ".a:key.": out of spare keycodes"
      echohl None
      return
    endif
    let vkeycode = '<'.(s:fast_i/23==0 ? '' : 'S-').'F'.(15+s:fast_i%23).'>'
    exec 'set '.vkeycode.'='.a:keycode
    exec 'map '.vkeycode.' '.a:key
    let s:fast_i += 1
  endfunction
  let s:fast_i = 0

  call <SID>MapFastKeycode('<C-Tab>', "[27;5;9~")
  call <SID>MapFastKeycode('<S-C-Tab>', "[27;6;9~")
endif


function! s:fwrap()
  if has("set nowrap?")
    noremap <F5> wrap
  else
    set nowrap
  endif
endfunction

noremap <F5> :call s:fwrap()<CR>

set notitle
set nowrap
"set listchars=tab:>\

set nocursorline

command! W w

""powerline
"" source ~/.vim/bundle/powerline/powerline/bindings/vim/plugin/powerline.vim
"" python from powerline.bindings.vim import source_plugin; source_plugin()

set directory=~/.vim_backup
set backupdir=~/.vim_backup

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""
"" Vim-LaTeX
""
" filetype plugin on
" filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_CompileRule_dvi = 'platex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = 'pbibtex'
"let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'mendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_dvi = 'pxdvi -watchfile 1'
"let g:Tex_ViewRule_dvi = 'advi -watch-file 1'
"let g:Tex_ViewRule_dvi = 'evince'
"let g:Tex_ViewRule_dvi = 'okular --unique'
"let g:Tex_ViewRule_dvi = 'wine ~/.wine/drive_c/w32tex/dviout/dviout.exe -1'
let g:Tex_ViewRule_ps = 'gv --watch'
"let g:Tex_ViewRule_ps = 'evince'
"let g:Tex_ViewRule_ps = 'okular --unique'
"let g:Tex_ViewRule_ps = 'zathura'
"let g:Tex_ViewRule_pdf = 'texworks'
let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
"let g:Tex_ViewRule_pdf = 'zathura -s -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'pdfviewer'
"let g:Tex_ViewRule_pdf = 'gv --watch'
"let g:Tex_ViewRule_pdf = 'acroread'
"let g:Tex_ViewRule_pdf = 'pdfopen -viewer ar9-tab'

"" Tweetvim
let g:tweetvim_display_icon = 1

au InsertLeave * call ImDisable()

function! ImDisable()
  ""  echo 'disable called'
  ""  let status = imstatusfunc()
  ""  imactivatefunc(0)
  ""  let status2 = imstatusfunc()
  ""  echo 'imstatus B'
  ""  echo status
  ""  echo 'imstatus A'
  ""  echo status2
endfunction


let $PATH= $PATH . ":" . $HOME . "/.cabal/bin"
set t_vb=''

"autocmd! rooter
autocmd BufEnter *.hs,*.coffee,*.rb,*.html,*.haml,*.erb,*.rjs,*.css,*.js,*.vhd :Rooter
let g:rooter_use_lcd = 1
let g:syntastic_ghdl_workdir = 'lib'

autocmd BufRead *.lhs :set syntax=haskell

"" commit message length is less than 71
autocmd FileType gitcommit  setlocal textwidth=69

" restart
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

