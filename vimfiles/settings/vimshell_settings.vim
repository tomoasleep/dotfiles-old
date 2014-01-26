
NeoBundle 'Shougo/vimshell'
"" overload vimshell mappings
augroup vimshell_cmd
  autocmd! vimshell_cmd
  autocmd FileType vimshell :nnoremap <buffer> <C-c> <C-c>
  autocmd FileType vimshell :inoremap <buffer> <C-c> <C-c>
  autocmd FileType vimshell :nmap <buffer> <C-x> <Plug>(vimshell_hangup)
  autocmd FileType vimshell :imap <buffer> <C-x> <Plug>(vimshell_interrupt)
augroup END

