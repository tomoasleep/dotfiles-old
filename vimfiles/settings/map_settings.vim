
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>
noremap ;; :

nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap <C-c><C-c> :nohlsearch<CR><Esc>

"" neocomplete.vim
if neobundle#is_sourced('neocomplete')
  " cancel complete
  inoremap <expr><C-e>  neocomplete#close_popup()

  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  "" imap <C-m>    <Plug>(neocomplete#snippets_expand)
  "" smap <C-m>    <Plug>(neocomplete#snippets_expand)

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


  imap <C-s>  <Plug>(neocomplete#start_unite_snippet)
  imap <C-q>  <Plug>(neocomplete#start_unite_quick_match)

  noremap es :<C-u>neocompleteEditSnippets<CR>
endif

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


nnoremap tt :<C-u>tabnew<CR>
nnoremap tn :<C-u>tabnext<CR>
nnoremap tp :<C-u>tabprevious<CR>

nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>
nnoremap <C-c><C-c> :<C-u>nohlsearch<CR>

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

"Quich filter
nnoremap ,f :call FilteringNew().addToParameter('alt', @/).run()<CR>
if has('gui_running')
  "nnoremap ,F :call FilteringNew().parseQuery(input('>'), '|').run()<CR>
endif
nnoremap ,g :call FilteringGetForSource().return()<CR>
" filtering.vimの機能を利用。カーソル下文字の検索
nmap ,r :call Gather(expand("<cword>"), 0)<CR>:echo<CR>

" eskk.vim
" don't use default mappings
let g:eskk#no_default_mappings = 1

nnoremap <A-j> <Plug>(eskk:enable)
nnoremap <A-e> <Plug>(eskk:disable)

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

nnoremap <C-z> <C-w><C-z>

function! s:fwrap()
  if has("set nowrap?")
    noremap <F5> wrap
  else
    set nowrap
  endif
endfunction

noremap <F5> :call s:fwrap()<CR>

