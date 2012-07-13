
" --- vundle.vim - プラグインの集中管理
" doc/vundle.md
" ＊filetype を一度offにして、Vundle の処理のあとでftpluginとindent を読み込むように指定。

set nocompatible
filetype off

if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/ 
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/ 
  call vundle#rc()
endif


" vim-scripts リポジトリ (1)
""Bundle 'css_color.vim'
Bundle "fugitive.vim"
""Bundle "AutoClose"
Bundle "The-NERD-tree"
Bundle "endwise.vim"
"Bundle 'ruby.vim'
Bundle 'neco-look'
Bundle 'surround.vim'
Bundle 'Quich-Filter'
Bundle 'trinity.vim'
Bundle 'taglist.vim'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'Align'
Bundle 'ZenCoding.vim'
"Bundle 'proton'
""Bundle 'CSApprox'
Bundle 'pyte'
"Bundle 'twilight256.vim'
"Bundle 'twilight'
Bundle 'ruby-matchit'
Bundle 'altercation/vim-colors-solarized'


""Bundle 'SuperTab-continued.'

""Bundle 'neco-ghc'

"Bundle "project.vim"
" github の任意のリポジトリ (2)"
Bundle "thinca/vim-unite-history"
Bundle "tsukkee/unite-tag"
Bundle "h1mesuke/unite-outline"
Bundle "Sixeight/unite-grep"
Bundle "tsukkee/unite-help"
Bundle "Shougo/unite.vim"
Bundle "tpope/vim-rails" 
Bundle "tpope/vim-fugitive"
Bundle "thinca/vim-ref"
Bundle "Shougo/neocomplcache"
Bundle 'othree/eregex.vim'


"Bundle 'vim-ruby/vim-ruby'
Bundle "tsaleh/vim-matchit"
Bundle 'thinca/vim-quickrun'
Bundle "ujihisa/neco-rubymf"
Bundle 'm2ym/rsense'
Bundle "bouzuya/vim-ibus"
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/vimshell.git'
Bundle 'Shougo/vimproc'
Bundle "Shougo/neocomplcache-snippets-complete"
""Bundle 'vim-scripts/javacomplete'
Bundle "scrooloose/syntastic"
Bundle "kana/vim-smartchr"

" github 以外のリポジトリ (3)
Bundle "git://git.wincent.com/command-t.git"
	 
filetype plugin indent on
syntax on
filetype on

set autoindent
set tabstop=4
set number

set runtimepath+=/path/to/vimdoc-ja
set helplang=ja,en

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

" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

""let g:neocomplcache_enable_insert_char_pre = 1
" Plugin key-mappings.
imap <C-m>     <Plug>(neocomplcache_snippets_expand)
smap <C-m>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><C-TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><C-CR> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<C-CR>"

" For snippet_complete marker.
if has('conceal')
		set conceallevel=2 concealcursor=i
endif
imap <C-m>    <Plug>(neocomplcache_snippets_expand)
smap <C-m>    <Plug>(neocomplcache_snippets_expand)


imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)
imap <C-q>  <Plug>(neocomplcache_start_unite_quick_match)

noremap es :<C-u>NeoComplCacheEditSnippets<CR>
""" ref.vim
nmap ,ra :<C-u>Ref alc<Space>

let g:ref_alc_start_linenumber = 39 " 表示する行数

"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

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
let g:Powerline_symbols = 'fancy'

set noexpandtab

inoremap <C-k> <Up>
inoremap <C-j> <down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

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
nnoremap <silent> <F8> :TlistToggle<CR>

""Trinity.vim
nnoremap <silent> <C-l> :TrinityToggleAll<CR>

""Nerdtree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

""Unite.vim
imap <C-k> <Plug>(neocomplcache_start_unite_complete)
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <C-N>f :Unite -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

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
""set background=dark  
""light にしたければ下  
set background=light  
colorscheme solarized  



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

au FileType ruby set ts=3 sw=3 expandtab

set fileformat=unix
