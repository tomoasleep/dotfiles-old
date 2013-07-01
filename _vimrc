set nocompatible
filetype off
 
set rtp+=~/.vim/vundle.git/
"" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

call vundle#rc()


" vim-scripts リポジトリ (1)
""Bundle 'css_color.vim'
Bundle "unite.vim"
Bundle "fugitive.vim"
Bundle "The-NERD-tree"
Bundle "endwise.vim"
Bundle 'TwitVim'
Bundle 'neco-look'
Bundle 'surround.vim'
Bundle 'Quich-Filter'
Bundle 'trinity.vim'
Bundle 'taglist.vim'
Bundle 'Align'
Bundle 'ZenCoding.vim'
Bundle 'pyte'
"" Bundle 'java_getset.vim'
Bundle 'matchit.zip'
"" Bundle "TagHighlight"

"
" github の任意のリポジトリ (2)"
Bundle "tpope/vim-rvm"
Bundle 'altercation/vim-colors-solarized'
Bundle "Shougo/unite.vim"
Bundle "thinca/vim-unite-history"
Bundle "Sixeight/unite-grep"
Bundle "tsukkee/unite-help"
"" Bundle "tpope/vim-rails" 
"" Bundle "tpope/vim-fugitive"
Bundle "thinca/vim-ref"
Bundle "Shougo/neocomplcache"
"" Bundle 'othree/eregex.vim'
"" Bundle 'vim-ruby/vim-ruby'
Bundle "Shougo/neocomplcache-rsense.vim"
Bundle "tsaleh/vim-matchit"
Bundle 'thinca/vim-quickrun'
"Bundle 'm2ym/rsense'
"" Bundle 'Lokaltog/vim-powerline'
"" Bundle 'Shougo/vimshell.git'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neosnippet'
"" Bundle "Shougo/neocomplcache-snippets-complete"
Bundle "scrooloose/syntastic"
Bundle "kana/vim-smartchr"
Bundle "h1mesuke/unite-outline"
Bundle "tsukkee/unite-tag"
"Bundle "tyru/eskk.vim"
Bundle "Shougo/vinarise"
"Bundle "kana/vim-textobj-indent"
Bundle "gregsexton/gitv"
"" Bundle "wesleyche/SrcExpl"
Bundle "alpicola/vim-egison"
Bundle "dag/vim2hs"
Bundle "eagletmt/ghcmod-vim"
Bundle "ujihisa/neco-ghc"
Bundle "kien/ctrlp.vim"
Bundle "jcf/vim-latex"
Bundle "jonathanfilip/vim-lucius"
Bundle "Rip-Rip/clang_complete"
Bundle "eagletmt/unite-haddock"
Bundle "w0ng/vim-hybrid"


" github 以外のリポジトリ (3)
"Bundle "git://git.wincent.com/command-t.git"
	 
filetype plugin indent on
syntax on
filetype on

set autoindent
set tabstop=4
set number
set splitbelow

set runtimepath+=/path/to/vimdoc-ja
set helplang=ja,en

if has('kaoriya')
	let s:ruby_libruby = system('ruby -rrbconfig -e "print Config::CONFIG[\"libdir\"] + \"/\" + Config::CONFIG[\"LIBRUBY\"]"')
	if filereadable(s:ruby_libruby)
		let $RUBY_DLL = s:ruby_libruby
	endif
endif


badd ~/.vimrc



" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:NeoComplCache_SmartCase = 1
let g:neocomplcache_enable_smart_case = 1
" キャメルケース補完を有効にする
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスファイルの補完対象キーワードとする最小の長さ
let g:NeoComplCache_MinSyntaxLength = 3
" プラグイン毎の補完関数を呼び出す文字数
let g:NeoComplCache_PluginCompletionLength = {
  \ 'keyword_complete'  : 2,
  \ 'syntax_complete'   : 2
  \ }

""let g:rsenseHome = '~/.vim/bundle/rsense'
""let g:rsenseUseOmniFunc = 1

"" do not close preview window automatically
let g:neocomplcache_enable_auto_close_preview = 0

let g:neocomplcache#sources#rsense#home_directory = "/usr/local/bin"
if !exists('g:neocomplcache_omni_patterns')
 let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
  \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
  \ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0

" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

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

" For snippet_complete marker.
if has('conceal')
		set conceallevel=2 concealcursor=nc
endif
"" imap <C-m>    <Plug>(neocomplcache_snippets_expand)
"" smap <C-m>    <Plug>(neocomplcache_snippets_expand)


imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)
imap <C-q>  <Plug>(neocomplcache_start_unite_quick_match)

noremap es :<C-u>NeoComplCacheEditSnippets<CR>


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
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除 
  	inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
	if has("gui_running")
			inoremap <silent> <Esc> <Esc>:set noimdisable<CR>
	endif
endif



set mouse=a
set ttymouse=xterm2


"行頭のスペースの連続をハイライトさせる
"tab文字も区別されずにハイライトされるので、区別したいときはtab文字の表示を別に
"設定する必要がある。
"function! solspacehilight()
""    syntax match solspace "^\s\+" display containedin=all
""    highlight solspace term=underline ctermbg=lightgray
""	set list
""	set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"endf
"全角スペースをハイライトさせる。
"function! jisx0208spacehilight()
""    syntax match jisx0208space "　" display containedin=all
""    highlight jisx0208space term=underline ctermbg=lightcyan
"endf

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

set noexpandtab

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


" Unite Commands
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
" all
command! Ua UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file


" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1


autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction


""twitvim
let twitvim_login_b64 = "bmVtdW5lbXUzZGVzdTphc2xlZXAzMjk="
let twitvim_count = 100

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

""colorscheme pyte


""Solarized
syntax enable  
""let g:solarized_termcolors=256
""set background=dark  
""light にしたければ下  
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

colorscheme lucius
set background=dark

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


"" powerline
source ~/.vim/bundle/powerline/powerline/bindings/vim/plugin/powerline.vim
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
