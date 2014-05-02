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
"" runtime! settings/you_complete_me_settings.vim
runtime! settings/unite_settings.vim

runtime! settings/ft_settings.vim
runtime! settings/vimshell_settings.vim
runtime! settings/look_settings.vim

" vim-scripts リポジトリ (1)
NeoBundle 'Shougo/neobundle.vim'
NeoBundle "fugitive.vim"
NeoBundle "The-NERD-tree"
NeoBundle "endwise.vim"
NeoBundle 'surround.vim'
"" NeoBundle 'trinity.vim'
"" NeoBundle 'taglist.vim'
NeoBundle 'Align'
NeoBundle 'matchit.zip'

" github の任意のリポジトリ (2)"
NeoBundle "thinca/vim-ref"
NeoBundle "tsaleh/vim-matchit"
NeoBundle 'thinca/vim-quickrun'
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
NeoBundle "Shougo/vinarise"
NeoBundle "gregsexton/gitv"
NeoBundle "kien/ctrlp.vim"
NeoBundle "tyru/open-browser.vim"
NeoBundle "mattn/webapi-vim"
NeoBundle "mattn/favstar-vim"
NeoBundle "basyura/twibill.vim"
NeoBundle "basyura/bitly.vim"
NeoBundle "basyura/TweetVim"
NeoBundle "rbtnn/vimconsole.vim"
NeoBundle 'sjl/gundo.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'

"" define a command `Restart` to restart vim (linux, windows)
NeoBundle 'tyru/restart.vim'

"" google translate plugin
NeoBundle 'mattn/googletranslate-vim'

"" excite translate plugin
NeoBundle 'mattn/excitetranslate-vim', {
      \ 'depends': 'mattn/webapi-vim' }

" github 以外のリポジトリ (3)
"Bundle "git://git.wincent.com/command-t.git"
"
runtime! settings/map_settings.vim

filetype plugin indent on
syntax on
filetype on

NeoBundleCheck

set runtimepath+=/path/to/vimdoc-ja
set helplang=ja,en
set updatetime=400
set imdisable
set ignorecase
"" not use left scroll bar to prevent from resizing when spliting varticaly
set guioptions-=L
set backspace=indent,eol,start
set foldmethod=marker
set autoread

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

"set notimeout          " don't timeout on mappings
"set ttimeout           " do timeout on terminal key codes
"set timeoutlen=100     " timeout after 100 msec"

set mouse=a
set ttymouse=xterm2
""taglist
set tags=./tags,tags

let g:SrcExpl_winHeight = 4
let g:SrcExpl_jumpKey = ""
let g:SrcExpl_gobackKey = ""

""srcexpl.vim
let g:srcexpl_updatetags = 1
let g:srcexpl_refreshtime = 0
nnoremap <silent> <c-z> :srcexpltoggle<cr>
let g:srcexpl_refreshmapkey = "<c-b>r"
let g:srcexpl_gobackmapkey = "<c-b>b"

set fileformat=unix
set fileformats=unix,dos

function! s:set_fileformat()
  try
    setlocal fileformat=unix
  catch
  endtry
endfunction

augroup fileformat
  autocmd BufRead * :call <SID>set_fileformat()
augroup END

command! W w

"" open quickfix window auto
augroup Search
    autocmd!
    autocmd QuickFixCmdPost *grep cwindow
augroup END

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

command! W w

set directory=~/.vim_backup
set backupdir=~/.vim_backup

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" Tweetvim
let g:tweetvim_display_icon = 1

" restart
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'
let g:restart_save_window_values = 0

