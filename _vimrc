" --- vundle.vim - プラグインの集中管理
" doc/vundle.md
" ＊filetype を一度offにして、Vundle の処理のあとでftpluginとindent を読み込むように指定。

set nocompatible
"filetype off

if has('vim_starting')
	if has("win32") || has("win64")
		set rtp+=~/vimfiles/bundle/neobundle.vim/ 
		call neobundle#rc('~/vimfiles/bundle/')
	else
		set rtp+=~/.vim/bundle/neobundle.vim/ 
		call neobundle#rc('~/.vim/bundle/')
	endif
endif



" vim-scripts リポジトリ (1)
""Bundle 'css_color.vim'
"Bundle 'ruby.vim'
""Bundle "AutoClose"
""Bundle 'Source-Explorer-srcexpl.vim'
"Bundle 'proton'
""Bundle 'CSApprox'
"Bundle 'twilight256.vim'
"Bundle 'twilight'
""Bundle 'TagHighlight'
"" Bundle "autoproto.vim"
""Bundle 'SuperTab-continued.'

""Bundle 'neco-ghc'

"Bundle "project.vim"
if has("unix")
	NeoBundle 'neco-look'
endif
NeoBundle "fugitive.vim"
NeoBundle "The-NERD-tree"
NeoBundle "endwise.vim"
NeoBundle 'surround.vim'
NeoBundle 'Quich-Filter'
NeoBundle 'trinity.vim'
"" NeoBundle 'taglist.vim'
NeoBundle 'Align'
NeoBundle 'ZenCoding.vim'
NeoBundle 'pyte'
NeoBundle 'ruby-matchit'
NeoBundle "VimCoder.jar"
NeoBundle "cake.vim"
	
" github の任意のリポジトリ (2)"
"Bundle 'vim-ruby/vim-ruby'
""Bundle 'vim-scripts/javacomplete'
""NeoBundle "Shougo/neocomplcache-snippets-complete"
NeoBundle "thinca/vim-unite-history"
NeoBundle "tsukkee/unite-tag"
NeoBundle "h1mesuke/unite-outline"
"NeoBundle "Sixeight/unite-grep"
NeoBundle "tsukkee/unite-help"
NeoBundle "Shougo/unite.vim"
NeoBundle "tpope/vim-rails" 
NeoBundle "tpope/vim-fugitive"
NeoBundle "thinca/vim-ref"
NeoBundle "Shougo/neocomplcache"
NeoBundle 'othree/eregex.vim'
NeoBundle "gregsexton/gitv"
NeoBundle "abudden/TagHighlight.git"
NeoBundle "sgur/clang-binaries.vim"
NeoBundle "nanotech/jellybeans.vim"
NeoBundle "vim-scripts/newspaper.vim"
NeoBundle "Rip-Rip/clang_complete"
NeoBundle "kmnk/vim-unite-giti"
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/SrcExpl'
NeoBundle "tyru/vim-altercmd"
NeoBundle "Shougo/echodoc"
NeoBundle "LeafCage/lcpeek.vim"
NeoBundle "tsaleh/vim-matchit"
NeoBundle 'thinca/vim-quickrun'
NeoBundle "ujihisa/neco-rubymf"
NeoBundle 'm2ym/rsense'
NeoBundle "bouzuya/vim-ibus"
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc'
NeoBundle "scrooloose/syntastic"
NeoBundle "kana/vim-smartchr"
NeoBundle "h1mesuke/unite-outline"
NeoBundle "tsukkee/unite-tag"
NeoBundle 'Shougo/vinarise'
NeoBundle "ujihisa/unite-colorscheme"
NeoBundle "Shougo/neosnippet"
NeoBundle "PProvost/vim-ps1"
NeoBundle "sjl/gundo.vim"
NeoBundle "majutsushi/tagbar"
NeoBundle "Shougo/vimfiler"
NeoBundle "alpicola/vim-egison"
NeoBundle "dag/vim2hs"
NeoBundle "eagletmt/ghcmod-vim"
NeoBundle "ujihisa/neco-ghc"
NeoBundle "pbrisbin/html-template-syntax"
NeoBundle "yuratomo/dotnet-complete"

""Bundle "Shougo/neocomplcache-clang_complete"
" github 以外のリポジトリ (3)
NeoBundle "git://git.wincent.com/command-t.git"
	 
filetype plugin indent on
syntax on
filetype on

set autoindent
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4
set number

set runtimepath+=/path/to/vimdoc-ja
set helplang=ja,en
set updatetime=400
"" set swapsync=""

"" not use left scroll bar to prevent from resizing when spliting varticaly
set guioptions-=L



if has("win32") || has("win64") 
		badd C:/Users/tomoya/dotfiles/_vimrc
endif

"" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': ['c'],
	\ 'passive_filetypes': ['ruby'] }


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

let g:rsenseHome = '~/vimfiles/bundle/rsense'
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
"let g:clang_use_library = 1


nnoremap <C-z> <C-w><C-z>
let g:SrcExpl_winHeight = 4
let g:SrcExpl_jumpKey = ""
let g:SrcExpl_gobackKey = ""

let g:clang_use_library=1
let g:echodoc_enable_at_startup=1

""let g:clang_debug=1





" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

""let g:neocomplcache_enable_insert_char_pre = 1
" Plugin key-mappings.
""imap <C-m>     <Plug>(neocomplcache_snippets_expand)
""smap <C-m>     <Plug>(neocomplcache_snippets_expand)
"" inoremap <expr><C-g>     neocomplcache#undo_completion()
"" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><C-TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><C-TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/vimfiles/snippets/'

" SuperTab like snippets behavior.
"" imap <expr><C-TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"" imap <expr><C-CR> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<C-CR>"



"imap <C-k>  <Plug>(neocomplcache_start_unite_snippet)
"imap <C-q>  <Plug>(neocomplcache_start_unite_quick_match)

"noremap es :<C-u>NeoComplCacheEditSnippets<CR>
""" ref.vim
nmap ,ra :<C-u>Ref alc<Space>

let g:ref_alc_start_linenumber = 39 " 表示する行数

"<C-Space>でomni補完
"imap <C-Space> <C-x><C-o>

" ステータスラインの表示
""set number
""set ruler
""set cmdheight=2
""set laststatus=2 "ステータスバーを常に表示
""set statusline=%<     " 行が長すぎるときに切り詰める位置
""set statusline+=[%n]  " バッファ番号
""set statusline+=%m    " %m 修正フラグ
""set statusline+=%r    " %r 読み込み専用フラグ
""set statusline+=%h    " %h ヘルプバッファフラグ
""set statusline+=%w    " %w プレビューウィンドウフラグ
""set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
""set statusline+=%y    " バッファ内のファイルのタイプ
""set statusline+=[%{ibus#is_enabled()?'あ':'aA'}] 
""set statusline+=\     " 空白スペース
""if winwidth(0) >= 130
""	set statusline+=%F    " バッファ内のファイルのフルパス
""else
""set statusline+=%t    " ファイル名のみ
""endif
""set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
""set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
""set statusline+=\ \   " 空白スペース2個
""set statusline+=%1l   " 何行目にカーソルがあるか
""set statusline+=/
""set statusline+=%L    " バッファ内の総行数
""set statusline+=,
""set statusline+=%c    " 何列目にカーソルがあるか
""set statusline+=%V    " 画面上の何列目にカーソルがあるか
""set statusline+=\ \   " 空白スペース2個
""set statusline+=%P    " ファイル内の何％の位置にあるか

set linespace=0
set title
set wildmenu
set showcmd


"set notimeout          " don't timeout on mappings
"set ttimeout           " do timeout on terminal key codes
"set timeoutlen=100     " timeout after 100 msec"


"Quick filter
nnoremap ,f :call FilteringNew().addToParameter('alt', @/)
nnoremap ,F :call FilteringNew().parseQuery(input('>'), '|')
nnoremap ,g :call FilteringGetForSource()

""vim-ibus
"if has('gui_running')
"else
"inoremap <silent> <Esc> <Esc>:<C-u>call ibus#disable()<CR>
"inoremap <silent> <C-c> <Esc>:<C-u>call ibus#disable()<CR>
"noremap <silent> <Esc> :<C-u>call ibus#disable()<CR>
"noremap <silent> <C-c> :<C-u>call ibus#disable()<CR>

"endif



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
endif



set mouse=a
set ttymouse=xterm2


"if &term =~ "xterm"
"    let &t_SI .= "\e[?2004h"
"	let &t_EI .= "\e[?2004l"
"	let &pastetoggle = "\e[201~"
"			
"	function XTermPasteBegin(ret)
"			set paste
"			return a:ret
"	endfunction
"
"	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"endif
"

""if &term =~ "xterm"
""		let &t_ti .= "\e[?2004h"
""		let &t_te .= "\e[?2004l"
""		let &pastetoggle = "\e[201~"
				
""		function XTermPasteBegin(ret)
""			set paste
""			return a:ret
""	endfunction
													
""	noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
""	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
""	cnoremap <special> <Esc>[200~ <nop>
""	cnoremap <special> <Esc>[201~ <nop>
""endif

"行頭のスペースの連続をハイライトさせる
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
""    syntax match SOLSpace "^\s\+" display containedin=ALL
""    highlight SOLSpace term=underline ctermbg=LightGray
""	set list
""	set listchars=tab:≫-,trail:-,eol:?,extends:≫,precedes:≪,nbsp:%
endf
"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
""    syntax match JISX0208Space "　" display containedin=ALL
""    highlight JISX0208Space term=underline ctermbg=LightCyan
endf
"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
"if has("syntax")
"    syntax on
"        augroup invisible
"        autocmd! invisible
"        autocmd BufNew,BufRead * call SOLSpaceHilight()
"        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
"    augroup END
"endif

""taglist
set tags=tags


""Powerline
"" let g:Powerline_symbols = 'fancy'

set noexpandtab

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

"imap OA <Up>
"imap OB <Down>
"imap OC <Right>
"imap OD <Left>

"noremap [A <Up>
"noremap [C <Right>
"noremap [B <Down>
"noremap [D <Left>

"noremap! [A <Up>
"noremap! [C <Right>
"noremap! [B <Down>
"noremap! [D <Left>


""Taglist.vim
"nnoremap <silent> <F8> :TlistToggle<CR>

""Trinity.vim
"nnoremap <silent> <C-l> :TrinityToggleAll<CR>

""Nerdtree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

""""Unite.vim
"imap <C-k> <Plug>(neocomplcache_start_unite_complete)
" 入力モードで開始する
"let g:unite_enable_start_insert=1
" バッファ一覧
"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
"nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> <Space>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <C-N>f :Unite -buffer-name=files file<CR>
" レジスタ一覧
"nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
"nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
"nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
"nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

""Unite.vim
nnoremap [unite] <Nop>
nmap <Space>f [unite]
nmap <C-n> [unite]
nmap ,u [unite]

imap <C-;> <Plug>(neocomplcache_start_unite_complete)

" set original Buffername 
call unite#set_buffer_name_option('outline', 'ignorecase', 1)
call unite#set_buffer_name_option('outline', 'smartcase',  1)

" Unite Commands
" File
command Uf UniteWithBufferDir -buffer-name=files file bookmark file/new 
command UF Uf
" Buffer
command Ub Unite buffer
command UB Ub
" Bookmark
command Ubk Unite -buffer-name=files bookmark file file/new
command UBK Ubk
" Bookmark Add
command Uba UniteBookmarkAdd
command UBA Uba
" Regeister
command Ur Unite -buffer-name=register register
command UR Ur
" outline
command Uo Unite -buffer-name=outline outline 
command UO Uo
command Uov Unite -no-quit -toggle -vertical -winwidth=45 -buffer-name=outline outline
command Uovl Unite -no-quit -toggle -vertical -winwidth=80 -buffer-name=outline outline
command UOV Uov
command UOv Uov
" File mru
command Um Unite file_mru
command UM Um
" source
command Uso Unite source
command USO Uo
" line search
command Ul Unite line
command UL Ul
command Ulc UniteWithCursorWord line
command ULC Ulc
" find 
command Ufi Unite find
command UFi Ufi
" grep
command Ug Unite grep
command UG Ug
" tag search
command Ut Unite tag
command UT Ut
command Utf Unite tag/file
command UTF Utf
command Uti Unite tag/include
command UTI Uti
" history
command Uhc Unite history/command 
command UHC Uhc
command Uhs Unite history/search
command UHS Uhs
command Uhy Unite history/yank
command UHY Uhy
" window
command Uw Unite window
command UW Uw
" snipmate
command Us Unite snippet
command US Us
" all
command Ua UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file


" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <C-n>b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new bookmark <CR>
nnoremap <silent> <Space>ff :<C-u>UniteWithBufferDir -buffer-name=files file file/new bookmark <CR>
nnoremap <silent> <Space>fn :<C-u>Unite -buffer-name=files file file/new bookmark <CR>
nnoremap <silent> <C-n>ff :<C-u>Unite -buffer-name=files file file/new bookmark <CR>
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
" line検索
nnoremap <silent> [unite]ln :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> <Space>ln :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> <Space>ll :<C-u>Unite line<CR>
nnoremap <silent> <C-n>ln :<C-u>UniteWithCursorWord line<CR>
" line検索
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
nnoremap <silent> <Space>g :<C-u>Unite grep<CR>
nnoremap <silent> <C-n>g :<C-u>Unite grep<CR>
" tag検索
nnoremap <silent> [unite]tt :<C-u>Unite tag<CR>
nnoremap <silent> <Space>tt :<C-u>Unite tag<CR>
nnoremap <silent> <C-n>tt :<C-u>Unite tag<CR>
" tag検索
nnoremap <silent> [unite]tf :<C-u>Unite tag/file<CR>
nnoremap <silent> <Space>tf :<C-u>Unite tag/file<CR>
nnoremap <silent> <C-n>tf :<C-u>Unite tag/file<CR>
" tag検索
nnoremap <silent> [unite]ti :<C-u>Unite tag/include<CR>
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
let g:solarized_termcolors=256
colorscheme solarized  
set background=dark  
""light にしたければ下  
""set background=light  




""tabでのcomp設定
function InsertTabWrapper()
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



set backupdir=~/vimfiles/tmp
set directory=~/vimfiles/tmp



if has("win32") || has("win64") 
	""カレントディレクトリの移動、CDを定義
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
endif


set fileformat=unix
set fileformats=unix,dos

function! s:set_fileformat()
    try
        setlocal fileformat=unix
    catch
    endtry
endfunction
autocmd BufRead * :call <SID>set_fileformat()

command W w
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>
nnoremap <C-c><C-c> :<C-u>nohlsearch<CR>

"" au! CursorHoldI *.[ch] nested call PreviewWord()
"" func PreviewWord()
""   if &previewwindow                  " プレビューウィンドウ内では実行しない
""     return
""   endif
""   let w = expand("<cword>")          " カーソル下の単語を得る
""   if w =~ '\a'                       " その単語が文字を含んでいるなら
"" 
""     " 別のタグを表示させる前にすでに存在するハイライトを消去する
""     silent! wincmd P                 " プレビューウィンドウにジャンプ
""     if &previewwindow                        " すでにそこにいるなら
""       match none                     " 存在するハイライトを消去する
""       wincmd p                       " もとのウィンドウに戻る
""     endif
"" 
""     " カーソル下の単語にマッチするタグを表示してみる
""     try
""        exe "ptag " . w
""     catch
""       return
""     endtry
"" 
""     silent! wincmd P                 " プレビューウィンドウにジャンプ
""     if &previewwindow                " すでにそこにいるなら
""       if has("folding")
""         silent! .foldopen            " 閉じた折り畳みを開く
""       endif
""       call search("$", "b")          " 前の行の最後へ
""       let w = substitute(w, '\\', '\\\\', "")
""       call search('\<\V' . w . '\>') " カーソルをマッチしたところへ
""       " ここで単語にハイライトをつける
""       hi previewWord term=bold ctermbg=green guibg=green
""       exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
""       wincmd p                       " もとのウィンドウへ戻る
""     endif
""   endif
"" endfun

"" filetype
" XAML
au BufNewFile,BufRead *.xaml	setf xml

" dotnet complete
au BufNewFile,BufRead *.cs      setl omnifunc=cs#complet
au BufNewFile,BufRead *.cs      setl bexpr=cs#balloon()
au BufNewFile,BufRead *.cs      setl ballooneval

"" au BufNewFile,BufRead *.xaml    setf xml
au BufNewFile,BufRead *.xaml    setl omnifunc=xaml#complete

