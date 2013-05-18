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
Bundle 'java_getset.vim'
Bundle 'matchit.zip'
""Bundle 'neco-ghc'
Bundle "TagHighlight"

"
" github の任意のリポジトリ (2)"
Bundle "tpope/vim-rvm"
Bundle 'altercation/vim-colors-solarized'
Bundle "Shougo/unite.vim"
Bundle "thinca/vim-unite-history"
Bundle "Sixeight/unite-grep"
Bundle "tsukkee/unite-help"
Bundle "tpope/vim-rails" 
Bundle "tpope/vim-fugitive"
Bundle "thinca/vim-ref"
Bundle "Shougo/neocomplcache"
Bundle 'othree/eregex.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle "tsaleh/vim-matchit"
Bundle 'thinca/vim-quickrun'
Bundle 'm2ym/rsense'
"" Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/vimshell.git'
Bundle 'Shougo/vimproc'
Bundle "Shougo/neocomplcache-snippets-complete"
"" Bundle "scrooloose/syntastic"
Bundle "kana/vim-smartchr"
Bundle "h1mesuke/unite-outline"
Bundle "tsukkee/unite-tag"
"Bundle "tyru/eskk.vim"
Bundle "Shougo/vinarise"
Bundle "gregsexton/gitv"
Bundle "wesleyche/SrcExpl"
Bundle "alpicola/vim-egison"
"" Bundle "dag/vim2hs"
"" Bundle "eagletmt/ghcmod-vim"
"" Bundle "ujihisa/neco-ghc"
Bundle "kien/ctrlp.vim"
Bundle "jcf/vim-latex"



" github 以外のリポジトリ (3)
"Bundle "git://git.wincent.com/command-t.git"
	 
filetype plugin indent on
syntax on
filetype on

set autoindent
set tabstop=4
set number

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

let g:rsenseHome = '~/.vim/bundle/rsense'
let g:rsenseUseOmniFunc = 1

if !exists('g:neocomplcache_omni_patterns')
 let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

""let g:neocomplcache_enable_insert_char_pre = 1
" Plugin key-mappings.
imap <C-m>     <Plug>(neocomplcache_snippets_expand)
"" inoremap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-m>     <Plug>(neocomplcache_snippets_expand)
"" snoremap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><C-TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "k"
imap <expr><C-CR> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<C-CR>"
imap <expr><F13> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<F13>"

" For snippet_complete marker.
if has('conceal')
		set conceallevel=2 concealcursor=i
endif
imap <C-m>    <Plug>(neocomplcache_snippets_expand)
smap <C-m>    <Plug>(neocomplcache_snippets_expand)


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

" ステータスラインの表示
"" set number
"" set ruler
"" set cmdheight=2
"" set laststatus=2 "ステータスバーを常に表示
"" set statusline=%<     " 行が長すぎるときに切り詰める位置
"" set statusline+=[%n]  " バッファ番号
"" set statusline+=%m    " %m 修正フラグ
"" set statusline+=%r    " %r 読み込み専用フラグ
"" set statusline+=%h    " %h ヘルプバッファフラグ
"" set statusline+=%w    " %w プレビューウィンドウフラグ
"" set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
"" set statusline+=%y    " バッファ内のファイルのタイプ
"" 
"" ""set statusline+=[%{ibus#is_enabled()?'あ':'aA'}] 
"" set statusline+=\     " 空白スペース
"" if winwidth(0) >= 130
"" 	set statusline+=%F    " バッファ内のファイルのフルパス
"" else
"" set statusline+=%t    " ファイル名のみ
"" endif
"" set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
"" set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
"" set statusline+=\ \   " 空白スペース2個
"" set statusline+=%1l   " 何行目にカーソルがあるか
"" set statusline+=/
"" set statusline+=%L    " バッファ内の総行数
"" set statusline+=,
"" set statusline+=%c    " 何列目にカーソルがあるか
"" set statusline+=%V    " 画面上の何列目にカーソルがあるか
"" set statusline+=\ \   " 空白スペース2個
"" set statusline+=%P    " ファイル内の何％の位置にあるか

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
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
""    syntax match SOLSpace "^\s\+" display containedin=ALL
""    highlight SOLSpace term=underline ctermbg=LightGray
""	set list
""	set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
endf
"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
""    syntax match JISX0208Space "　" display containedin=ALL
""    highlight JISX0208Space term=underline ctermbg=LightCyan
endf

""taglist
set tags=./tags,tags


""srcexpl.vim
let g:SrcExpl_UpdateTags = 1
let g:SrcExpl_RefreshTime = 0
nnoremap <silent> <C-z> :SrcExplToggle<CR>
let g:SrcExpl_RefreshMapKey = "<C-b>r"
let g:SrcExpl_GoBackMapKey = "<C-b>b"

""Powerline
"" let g:Powerline_symbols = 'fancy'

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



""Unite.vim
nnoremap [unite] <Nop>
nmap <Space>f [unite]
nmap <C-n> [unite]
imap <silent> <C-n> [unite]
nmap ,u [unite]
nmap <A-n> [unite]
imap <silent> <A-n> [unite]

imap <C-.> <Plug>(neocomplcache_start_unite_complete)
imap [unite]n <Plug>(neocomplcache_start_unite_complete)

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <C-n>b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file bookmark <CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file bookmark file/new<CR>
nnoremap <silent> <Space>ff :<C-u>UniteWithBufferDir -buffer-name=files file bookmark file/new<CR>
nnoremap <silent> <Space>fn :<C-u>Unite -buffer-name=files file bookmark file/new<CR>
nnoremap <silent> <C-n>ff :<C-u>Unite -buffer-name=files file bookmark file/new<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <C-n>r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]fm :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>fm :<C-u>Unite file_mru<CR>
nnoremap <silent> <C-n>fm :<C-u>Unite file_mru<CR>
" outline
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> <Space>oo :<C-u>Unite -buffer-name=outline outline <CR>
nnoremap <silent> <Space>on :<C-u>Unite -no-quit -vertical -winwidth=30 -buffer-name=outline outline<CR>
nnoremap <silent> <C-n>o :<C-u>Unite outline<CR>
call unite#set_buffer_name_option('outline', 'ignorecase', 1)
call unite#set_buffer_name_option('outline', 'smartcase',  1)
" line検索
nnoremap <silent> [unite]ln :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> ,uln :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> <Space>ln :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> <Space>ll :<C-u>Unite line<CR>
nnoremap <silent> <C-n>ln :<C-u>UniteWithCursorWord line<CR>
" line検索
nnoremap <silent> ,ug :<C-u>Unite grep<CR>
nnoremap <silent> <Space>g :<C-u>Unite grep<CR>
nnoremap <silent> <C-n>g :<C-u>Unite grep<CR>
" tag検索
nnoremap <silent> ,utt :<C-u>Unite tag<CR>
nnoremap <silent> <Space>tt :<C-u>Unite tag<CR>
nnoremap <silent> <C-n>tt :<C-u>Unite tag<CR>
" tag検索
nnoremap <silent> ,utf :<C-u>Unite tag/file<CR>
nnoremap <silent> <Space>tf :<C-u>Unite tag/file<CR>
nnoremap <silent> <C-n>tf :<C-u>Unite tag/file<CR>
" tag検索
nnoremap <silent> ,uti :<C-u>Unite tag/include<CR>
nnoremap <silent> <Space>ti :<C-u>Unite tag/include<CR>
nnoremap <silent> <C-n>ti :<C-u>Unite tag/include<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <Space>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <C-n>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
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

colorscheme solarized  
set background=light

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

""smartchr
""inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ', '=')


""javacomp
""autocmd FileType java :setlocal omnifunc=javacomplete#Complete
""autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

""syntastic
"let g:syntastic_check_on_open = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_enable_signs = 1
"let g:syntastic_enable_balloons = 1
"let g:syntastic_enable_highlighting = 1
"""let g:syntastic_auto_jump = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_loc_list_height = 5
" 
"let g:syntastic_mode_map = { 'mode': 'active',
"                           \ 'active_filetypes': ['php'],
"                           \ 'passive_filetypes': ['java'] }
" 
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

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
