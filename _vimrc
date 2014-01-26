" --- vundle.vim - プラグインの集中管理
" doc/vundle.md
" ＊filetype を一度offにして、Vundle の処理のあとでftpluginとindent を読み込むように指定。

set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
"" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif


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
NeoBundle "Shougo/unite.vim"
NeoBundle "thinca/vim-unite-history"
NeoBundle "Sixeight/unite-grep"
NeoBundle "tsukkee/unite-help"
NeoBundle "tpope/vim-rails"
NeoBundle "thinca/vim-ref"
NeoBundle "Shougo/neocomplete"
NeoBundle "tsaleh/vim-matchit"
NeoBundle 'thinca/vim-quickrun'
"Bundle 'm2ym/rsense'
"" Bundle 'Lokaltog/vim-powerline'
NeoBundle 'Shougo/vimshell.git'
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
NeoBundle "Shougo/unite-outline"
NeoBundle "tsukkee/unite-tag"
"Bundle "tyru/eskk.vim"
NeoBundle "Shougo/vinarise"
"Bundle "kana/vim-textobj-indent"
NeoBundle "gregsexton/gitv"
"" Bundle "wesleyche/SrcExpl"
NeoBundle "alpicola/vim-egison"
NeoBundle "dag/vim2hs"
NeoBundle "zenzike/vim-haskell"
NeoBundle "eagletmt/ghcmod-vim"
NeoBundle "ujihisa/neco-ghc"
NeoBundle "kien/ctrlp.vim"
NeoBundle "jcf/vim-latex"
NeoBundle "jonathanfilip/vim-lucius"
"" NeoBundle "Rip-Rip/clang_complete"
NeoBundle "eagletmt/unite-haddock"
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



" neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

nnoremap <C-z> <C-w><C-z>
let g:SrcExpl_winHeight = 4
let g:SrcExpl_jumpKey = ""
let g:SrcExpl_gobackKey = ""

let g:clang_use_library=1
let g:echodoc_enable_at_startup=1

""let g:clang_debug=1




" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#force_omni_patterns')
  let g:neocomplete#force_omni_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0

" 補完をキャンセル
inoremap <expr><C-e>  neocomplete#close_popup()

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

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
"" imap <C-m>    <Plug>(neocomplete#snippets_expand)
"" smap <C-m>    <Plug>(neocomplete#snippets_expand)


imap <C-s>  <Plug>(neocomplete#start_unite_snippet)
imap <C-q>  <Plug>(neocomplete#start_unite_quick_match)

noremap es :<C-u>neocompleteEditSnippets<CR>


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

" eskk.vim
" don't use default mappings
let g:eskk#no_default_mappings = 1

nnoremap <A-j> <Plug>(eskk:enable)
nnoremap <A-e> <Plug>(eskk:disable)

""" ref.vim
nmap ,ra :<C-u>Ref alc<Space>

let g:ref_refe_cmd = "/Users/kamadoinc/Documents/Reference/ruby-refm-1.9.2-dynamic-20110729/refe-1_9_2"
let g:ref_alc_start_linenumber = 39 " 表示する行数
let g:ref_phpmanual_path = "/Users/kamadoinc/Documents/Reference/php-chunked-xhtml"

"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

set linespace=0
set title
set wildmenu
set showcmd
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"set notimeout          " don't timeout on mappings
"set ttimeout           " do timeout on terminal key codes
"set timeoutlen=100     " timeout after 100 msec"


"Quich filter
nnoremap ,f :call FilteringNew().addToParameter('alt', @/).run()<CR>
if has('gui_running')
  "nnoremap ,F :call FilteringNew().parseQuery(input('>'), '|').run()<CR>
endif
nnoremap ,g :call FilteringGetForSource().return()<CR>
" filtering.vimの機能を利用。カーソル下文字の検索
nmap ,r :call Gather(expand("<cword>"), 0)<CR>:echo<CR>

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

"inoremap <C-k> <Up>
"inoremap <C-j> <down>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

""#BackSpaceもDeleteも遠すぎ。俺には押せない
inoremap <C-u> <BS>
inoremap <C-f> <BS>
inoremap <C-i> <Del>
""#現在行の下に空行入れたくなることってよくあるよね？
inoremap <C-o> <ESC>o

imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>
noremap ;; :

nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap <C-c><C-c> :nohlsearch<CR><Esc>

""Taglist.vim
nnoremap <silent> <C-s> :TlistToggle<CR>

""Trinity.vim
"nnoremap <silent> <C-l> :TrinityToggleAll<CR>

""Nerdtree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

nnoremap mh :<C-u>help 
" Unite Commands
nnoremap mm :<C-u>Unite 
nnoremap mg :<C-u>Ggrep 
nnoremap mb :<C-u>UniteWithBufferDir 
nnoremap mf :<C-u>UniteWithBufferDir -buffer-name=files 
nnoremap mi :<C-u>UniteWithInput 
nnoremap mc :<C-u>UniteWithCursorWord 

" File
command! Uf UniteWithBufferDir -buffer-name=files file bookmark file/new
command! UF Uf
" Buffer
command! Ub Unite buffer
command! UB Ub
" Bookmark
command! Ubk Unite -buffer-name=files bookmark file file/new
command! UBK Ubk
" Bookmark Add
command! Uba UniteBookmarkAdd
command! UBA Uba
" Regeister
command! Ur Unite -buffer-name=register register
command! UR Ur
" outline
command! Uo Unite -buffer-name=outline outline
command! UO Uo
command! Uov Unite -no-quit -toggle -vertical -winwidth=45 -buffer-name=outline outline
command! Uovl Unite -no-quit -toggle -vertical -winwidth=80 -buffer-name=outline outline
command! UOV Uov
command! UOv Uov
" File mru
command! Um Unite file_mru
command! UM Um
" source
command! Uso Unite source
command! USO Uo
" line search
command! Ul Unite line
command! UL Ul
command! Ulc UniteWithCursorWord line
command! ULC Ulc
" find
command! Ufi Unite find
command! UFi Ufi
" grep
command! Ug Unite grep
command! UG Ug
" tag search
command! Ut Unite tag
command! UT Ut
command! Utf Unite tag/file
command! UTF Utf
command! Uti Unite tag/include
command! UTI Uti
" history
command! Uhc Unite history/command
command! UHC Uhc
command! Uhs Unite history/search
command! UHS Uhs
command! Uhy Unite history/yank
command! UHY Uhy
" window
command! Uw Unite window
command! UW Uw
" snipmate
command! Us Unite snippet
command! US Us
" snipmate
command! Utw Unite tweetvim
command! UTW Utw
" all
command! Ua UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file


" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction

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


""tabでのcomp設定
function! InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

nnoremap tt :<C-u>tabnew<CR>
nnoremap tn :<C-u>tabnext<CR>
nnoremap tp :<C-u>tabprevious<CR>


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
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>
nnoremap <C-c><C-c> :<C-u>nohlsearch<CR>


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


""カレントディレクトリの移動
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif

  if a:bang == ''
    pwd
  endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>


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

"" commit message length is less than 71
autocmd FileType gitcommit  setlocal textwidth=69

"" vimshell

augroup vimshell_cmd
  autocmd!
  autocmd FileType vimshell :nnoremap <buffer> <C-c> <C-c>
  autocmd FileType vimshell :inoremap <buffer> <C-c> <C-c>
  autocmd FileType vimshell :nmap <buffer> <C-x> <Plug>(vimshell_hangup)
  autocmd FileType vimshell :imap <buffer> <C-x> <Plug>(vimshell_interrupt)
augroup END

" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

" restart
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

