
NeoBundle "Shougo/unite.vim", { 'rev': 'ver.6.0' }
NeoBundle "thinca/vim-unite-history"
NeoBundle "Sixeight/unite-grep"
NeoBundle "tsukkee/unite-help"
NeoBundle "Shougo/unite-outline"
NeoBundle "tsukkee/unite-tag"
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'tacroe/unite-mark'

" File
command! -nargs=* Uf UniteWithBufferDir -buffer-name=files file bookmark file/new
command! -nargs=* UF Uf
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

augroup unite_dw
  autocmd! unite_dw
  autocmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    " 単語単位からパス単位で削除するように変更
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  endfunction
augroup END

" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

