set nocompatible
filetype off
 
set rtp+=~/.vim/vundle.git/
call vundle#rc()


" vim-scripts リポジトリ (1)
""Bundle 'css_color.vim'
Bundle "unite.vim"
Bundle "fugitive.vim"
Bundle "AutoClose"
Bundle "The-NERD-tree"
Bundle "endwise.vim"
Bundle 'TwitVim'
""Bundle 'ruby.vim'
Bundle 'neco-look'
Bundle 'surround.vim'
Bundle 'Quich-Filter'
Bundle 'trinity.vim'
Bundle 'taglist.vim'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'Align'
Bundle 'ZenCoding.vim'
""Bundle 'proton'
""Bundle 'CSApprox'
Bundle 'pyte'
""Bundle 'twilight256.vim'
""Bundle 'twilight'
Bundle 'altercation/vim-colors-solarized'
""Bundle 'Solarized'
Bundle 'java_getset.vim'
Bundle 'matchit.zip'
Bundle 'ruby-matchit'
""Bundle 'Vim-JDE'


""Bundle 'SuperTab-continued.'

""Bundle 'neco-ghc'

"Bundle "project.vim"
" github の任意のリポジトリ (2)"
Bundle "tpope/vim-rails" 
Bundle "tpope/vim-fugitive"
Bundle "thinca/vim-ref"
Bundle "Shougo/neocomplcache"
Bundle 'othree/eregex.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle "tsaleh/vim-matchit"
Bundle 'thinca/vim-quickrun'
Bundle "ujihisa/neco-rubymf"
Bundle 'm2ym/rsense'
""Bundle "bouzuya/vim-ibus"
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
" キャメルケース補完を有効にする
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
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
" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

""let g:neocomplcache_enable_insert_char_pre = 1
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

" SuperTab like snippets behavior.
imap <expr><C-TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><C-CR> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<C-CR>"

" For snippet_complete marker.
if has('conceal')
		set conceallevel=2 concealcursor=i
endif
imap <C-l>    <Plug>(neocomplcache_snippets_expand)
smap <C-l>    <Plug>(neocomplcache_snippets_expand)


imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)

noremap es :<C-u>NeoComplCacheEditSnippets<CR>




""" ref.vim
nmap ,ra :<C-u>Ref alc<Space>

let g:ref_refe_cmd = "/Users/kamadoinc/Documents/Reference/ruby-refm-1.9.2-dynamic-20110729/refe-1_9_2"
let g:ref_alc_start_linenumber = 39 " 表示する行数
let g:ref_phpmanual_path = "/Users/kamadoinc/Documents/Reference/php-chunked-xhtml"

"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

" ステータスラインの表示
set number
set ruler
set cmdheight=2
set laststatus=2 "ステータスバーを常に表示
set statusline=%<     " 行が長すぎるときに切り詰める位置
set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=[%{ibus#is_enabled()?'あ':'aA'}] 
set statusline+=\     " 空白スペース
if winwidth(0) >= 130
	set statusline+=%F    " バッファ内のファイルのフルパス
else
set statusline+=%t    " ファイル名のみ
endif
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか

set linespace=0
set title
set wildmenu
set showcmd


"set notimeout          " don't timeout on mappings
"set ttimeout           " do timeout on terminal key codes
"set timeoutlen=100     " timeout after 100 msec"


"Quich filter
nnoremap ,f :call FilteringNew().addToParameter('alt', @/).run()<CR>
nnoremap ,F :call FilteringNew().parseQuery(input('>'), '|').run()<CR>
nnoremap ,g :call FilteringGetForSource().return()<CR>
" filtering.vimの機能を利用。カーソル下文字の検索
nmap ,r :call Gather(expand("<cword>"), 0)<CR>:echo<CR>

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
	if has("gui_running")
			inoremap <silent> <Esc> <Esc>:set noimdisable<CR>
	endif
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
""	set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
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

""srcexpl.vim
let g:SrcExpl_UpdateTags = 1
nnoremap <silent> <C-z> :SrcExplToggle<CR>



""Powerline
let g:Powerline_symbols = 'fancy'

set noexpandtab


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

nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap <C-c><C-c> :nohlsearch<CR><Esc>

""Taglist.vim
nnoremap <silent> <C-s> :TlistToggle<CR>

""Trinity.vim
nnoremap <silent> <C-l> :TrinityToggleAll<CR>

""Nerdtree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

""Unite.vim
imap <C-k> <Plug>(neocomplcache_start_unite_complete)

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
endif
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"

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
inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ', '=')


""javacomp
""autocmd FileType java :setlocal omnifunc=javacomplete#Complete
""autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

""syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
""let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
 
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['php'],
                           \ 'passive_filetypes': [] }
 
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

"[JAVA] :Makeでコンパイル
autocmd FileType java :command! Make call s:Make()
function! s:Make()
		:w
		let path = expand("%")
		let syn = "javac ".path
		let dpath = split(path,".java$")
		let ret = system(syn)
		if ret == ""
				:echo "=======\r\nCompile Success"
		else
				:echo "=======\r\nCompile Failure\r\n".ret 
		endif
endfunction

"[JAVA] :Doでコンパイル後のファイルを実行 
autocmd FileType java :command! Do call s:Do()
function! s:Do()
		let path = expand("%")
		let dpath = split(path,".java$")
		let syn = "java ".dpath[0]
		let ret = system(syn)
		:echo "=======\r\n実行結果:\r\n".ret
endfunction

"[JAVA] :Exeでコンパイルしてから実行
autocmd FileType java :command! Exe call s:Javac()
function! s:Javac()
		:w
		let path = expand("%")
		let syn = "javac ".path
		let dpath = split(path,".java$")
		let ret = system(syn)
		if ret == ""
				:echo "=======\r\nCompile Success"
				let syn = "java ".dpath[0]
				let ret = system(syn)
				:echo "=======\r\n実行結果:\r\n".ret
		else
				:echo "=======\r\nCompile Failure\r\n".ret
		endif
endfunction
au FileType java :set makeprg=javac\ %
