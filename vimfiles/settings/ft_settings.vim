
"" ruby
NeoBundleLazy "tpope/vim-rvm", {'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy "tpope/vim-rails", {'autoload': {'filetypes': ['ruby']}}

"" haskell
if neobundle#is_sourced('neocomplete')
  NeoBundleLazy "eagletmt/neco-ghc", {'autoload': {'filetypes': ['haskell']}}
endif
if neobundle#is_sourced('unite.vim')
  NeoBundleLazy "eagletmt/unite-haddock", {'autoload': {'filetypes': ['haskell']}}
endif
NeoBundleLazy "dag/vim2hs", {'autoload': {'filetypes': ['haskell']}}
NeoBundleLazy "eagletmt/ghcmod-vim", {'autoload': {'filetypes': ['haskell']}}

augroup haskell_settings
  autocmd! haskell_settings
  autocmd BufRead *.lhs :set syntax=haskell
augroup END

let $PATH= $PATH . ":" . $HOME . "/.cabal/bin"

"" javascript
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'briancollins/vim-jst', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy "kchmck/vim-coffee-script", {'autoload': {'filetypes': ['coffee']}}

"" other filetypes
NeoBundle "digitaltoad/vim-jade"
NeoBundle "rainux/vim-vala"
NeoBundle 'derekwyatt/vim-scala'
NeoBundle "jcf/vim-latex"
NeoBundle "alpicola/vim-egison"
NeoBundle 'ZenCoding.vim'

"" autocmd! rooter
autocmd BufEnter *.hs,*.coffee,*.rb,*.html,*.haml,*.erb,*.rjs,*.css,*.js,*.vhd,*.vim :Rooter
let g:rooter_use_lcd = 1

let g:syntastic_ghdl_workdir = 'lib'

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

"" filetype
" XAML
"" au BufNewFile,BufRead *.xaml	setf xml

" dotnet complete
"" au BufNewFile,BufRead *.cs      setl omnifunc=cs#complet
"" au BufNewFile,BufRead *.cs      setl bexpr=cs#balloon()
"" au BufNewFile,BufRead *.cs      setl ballooneval

"" au BufNewFile,BufRead *.xaml    setf xml
"" au BufNewFile,BufRead *.xaml    setl omnifunc=xaml#complete

"" commit message length is less than 71
augroup commit_length
  autocmd! commit_length
  autocmd FileType gitcommit  setlocal textwidth=69
augroup END

augroup cap_ft
  autocmd! cap_ft
  autocmd BufRead *.cap :set syntax=ruby
augroup END

