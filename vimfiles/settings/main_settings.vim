if !1 | finish | endif

let g:MyStartUpFunc = {}

set runtimepath+=~/.vim
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
  "" call neobundle#rc()
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

runtime! settings/neocomplete_settings.vim
runtime! settings/myfunction_settings.vim
"" runtime! settings/you_complete_me_settings.vim
runtime! settings/unite_settings.vim

runtime! settings/ft_settings.vim
runtime! settings/vimshell_settings.vim
runtime! settings/look_settings.vim
runtime! settings/operator_settings.vim

if !empty(glob("~/.vim/settings/local_settings.vim"))
  runtime! settings/local_settings.vim
endif


" vim-scripts リポジトリ (1)
NeoBundle "tpope/vim-fugitive"
NeoBundle "The-NERD-tree"
NeoBundle "endwise.vim"
NeoBundle 'surround.vim'
"" NeoBundle 'trinity.vim'
"" NeoBundle 'taglist.vim'
"" NeoBundle 'Align'
NeoBundle 'matchit.zip'

" github の任意のリポジトリ (2)"
"" NeoBundle "thinca/vim-ref"
"" NeoBundle "tsaleh/vim-matchit"

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'

let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
\       "runner/vimproc/updatetime" : 10,
\       "outputter/buffer/close_on_empty" : 1,
\ }

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tomoasleep/vim-open-atom'
let g:open_atom_silent_simojo_atom=0
let g:open_atom_unix_options='-n'

"" let g:EditorConfig_core_mode="python_external"
"" NeoBundle "editorconfig/editorconfig-vim"

"" let g:syntastic_auto_loc_list = 1

"" NeoBundle "kana/vim-smartchr"
NeoBundle "Shougo/vinarise"
"" NeoBundle "gregsexton/gitv"

"" Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
"" http://ctrlpvim.github.com/ctrlp.vim
NeoBundle "ctrlpvim/ctrlp.vim"
let g:ctrlp_extensions = ['locate', 'outline']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.aux,*/node_modules/*

NeoBundle 'nixprime/cpsm', {
\ 'build' : {
\     'unix' : './install.sh',
\    },
\ }
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

"" NeoBundle "tyru/open-browser.vim"
"" NeoBundle "mattn/webapi-vim"
"" NeoBundle "mattn/favstar-vim"
"" NeoBundle "basyura/twibill.vim"
"" NeoBundle "basyura/bitly.vim"
"" NeoBundle "basyura/TweetVim"
NeoBundle "rbtnn/vimconsole.vim"
NeoBundle 'sjl/gundo.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'mattn/googletranslate-vim'
"" NeoBundle 'tpope/vim-unimpaired'

" NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'

"" label code and manage easily
NeoBundle 'tomoasleep/codelabel.vim'
" , { 'type': 'no-sync' }

"" Utility for vimscript
NeoBundle 'vim-jp/vital.vim'

"" write and management simple memos
"" NeoBundle 'glidenote/memolist.vim'

"" define a command `Restart` to restart vim (linux, windows)
NeoBundle 'tyru/restart.vim'

"" google translate plugin
"" NeoBundle 'mattn/googletranslate-vim'

"" excite translate plugin
"" NeoBundle 'mattn/excitetranslate-vim', {
""       \ 'depends': 'mattn/webapi-vim' }

"" show a git diff in the gutter (sign column) and stages/reverts hunks
NeoBundle 'airblade/vim-gitgutter', {
      \ 'gui' : 1,
      \ }

"" make benchmark result of your vimrc http://mattn.kaoriya.net/
NeoBundle 'mattn/benchvimrc-vim'

"" measure laptime
NeoBundle 'LeafCage/laptime.vim'

"" Perform the replacement in quickfix.
"" NeoBundle 'thinca/vim-qfreplace'

" NeoBundle 'bartman/git-wip', { 'rtp': 'vim' }

let g:gitgutter_eager=0

" github 以外のリポジトリ (3)
"" Bundle "git://git.wincent.com/command-t.git"
"
runtime! settings/map_settings.vim

" for development
let filelist = split(expand("~/.vim/dev/bundle/*"), "\n")
for fname in filelist
  if isdirectory(fname)
    NeoBundleLocal fname
  endif
endfor

call neobundle#end()

filetype plugin indent on
syntax on
filetype on

NeoBundleCheck

if !has('vim_starting')
  call neobundle#call_hook('on_source')
endif

set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

"" call all startup functions
for e in keys(g:MyStartUpFunc)
  call g:MyStartUpFunc[e]()
endfor
unlet g:MyStartUpFunc


"" set runtimepath+=/path/to/vimdoc-ja
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

" set fileformat=unix
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
    \ = 'winsize,winpos,blank,buffers,curdir,folds,help,localoptions,tabpages'

