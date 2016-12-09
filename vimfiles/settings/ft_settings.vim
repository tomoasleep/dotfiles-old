
NeoBundle "scrooloose/syntastic"
let g:syntastic_mode_map = { "mode": "passive",
                           \ "active_filetypes": ['ocaml'],
                           \ "passive_filetypes": ["coffee"] }
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

"" ruby
"" NeoBundleLazy "tpope/vim-rvm", {'autoload': {'filetypes': ['ruby']}}
"" NeoBundleLazy "tpope/vim-rails", {'autoload': {'filetypes': ['ruby']}}
"" call add(g:syntastic_mode_map.active_filetypes, 'ruby')
"" let g:syntastic_ruby_checkers = ['rubocop']

""" highlight local variables
"" NeoBundleLazy "todesking/ruby_hl_lvar.vim", {'autoload': {'filetypes': ['ruby']}}

"" rdoc
"" NeoBundleLazy "depuracao/vim-rdoc", {'autoload': {'filetypes': ['rdoc']}}
"" augroup rdoc_detection
""   "" detect rdoc filetype manually
""   "" TODO: remove it when lazy loading without ftdetect implemented to NeoBundle
""   autocmd! rdoc_detection
""   autocmd BufNewFile,BufRead *.{rd,rdoc} set filetype=rdoc
"" augroup END

"" rspec
"" NeoBundleLazy "thoughtbot/vim-rspec", {
""       \ 'depends': 'tpope/vim-dispatch',
""       \ 'autoload': {'filetypes': ['ruby']}
""       \ }

"" let s:bundle = neobundle#get('vim-rspec')
"" function! s:bundle.hooks.on_source(bundle)
""    let g:rspec_command = 'Dispatch rspec {spec}'
""    let g:rspec_runner = 'os_x_iterm'
"" endfunction

augroup cap_detection
  autocmd! cap_detection
  autocmd BufNewFile,BufRead *.cap :set filetype=ruby
augroup END

"" rfc
NeoBundle 'mhinz/vim-rfc'
NeoBundle 'vim-scripts/rfc-syntax'

"" vagrant
NeoBundle "markcornick/vim-vagrant"

"" slim
NeoBundleLazy "slim-template/vim-slim", {'autoload': {'filetypes': ['slim']}}

augroup slim_detection
  "" detect slim filetype manually
  "" TODO: remove it when lazy loading without ftdetect implemented to NeoBundle
  autocmd! slim_detection
  autocmd BufNewFile,BufRead *.slim :set filetype=slim
augroup END

"" haskell
"" if neobundle#is_sourced('neocomplete')
""   NeoBundleLazy "eagletmt/neco-ghc", {'autoload': {'filetypes': ['haskell']}}
"" endif
"" if neobundle#is_sourced('unite.vim')
""   NeoBundleLazy "eagletmt/unite-haddock", {'autoload': {'filetypes': ['haskell']}}
"" endif
"" NeoBundleLazy "dag/vim2hs", {'autoload': {'filetypes': ['haskell']}}
"" NeoBundleLazy "eagletmt/ghcmod-vim", {'autoload': {'filetypes': ['haskell']}}

augroup haskell_settings
  autocmd! haskell_settings
  autocmd BufRead *.lhs :set syntax=haskell
augroup END

augroup purescript_settings
  autocmd! purescript_settings
  autocmd BufRead *.purs :set syntax=haskell
augroup END

"" TypeScript
NeoBundle 'Quramy/tsuquyomi'

let $PATH= $PATH . ":" . $HOME . "/.cabal/bin"

"" alex
NeoBundle 'alex.vim'

augroup alex_settings
  autocmd! alex_settings
  autocmd BufNewFile,BufRead *.x :set syntax=alex
augroup END

"" javascript
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'briancollins/vim-jst', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy "kchmck/vim-coffee-script", {'autoload': {'filetypes': ['coffee']}}
NeoBundle 'mtscout6/vim-cjsx'
NeoBundle 'isRuslan/vim-es6'
call add(g:syntastic_mode_map.active_filetypes, 'javascript')
let g:syntastic_javascript_checkers = ['eslint', 'flow']

augroup js_settings
  autocmd! js_settings
  autocmd BufRead *.coffee :set syntax=coffee
  autocmd BufRead *.js :set syntax=javascript
  au BufNewFile,BufRead *.ect :set filetype=html
augroup END

"" typescript
NeoBundle 'leafgarland/typescript-vim'
"" NeoBundle 'clausreinke/typescript-tools'

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
let g:syntastic_typescript_checkers = ['tsc']

"" less
NeoBundle 'groenewege/vim-less'

"" groovy
augroup groovy_settings
  autocmd! groovy_settings
  au BufRead,BufNewFile *.gradle set filetype=groovy
augroup END

"" go
NeoBundle "fatih/vim-go"

"" other filetypes
NeoBundle "digitaltoad/vim-jade"
NeoBundle "rainux/vim-vala"
NeoBundle 'derekwyatt/vim-scala'
"" NeoBundle "jcf/vim-latex"
NeoBundle "alpicola/vim-egison"
NeoBundle 'ZenCoding.vim'

"" Markdown
NeoBundleLazy "greyblake/vim-preview", {'autoload': {'filetypes': ['rdoc', 'ruby', 'markdown']}}

" md as markdown, instead of modula2
augroup markdown_ft
  autocmd! markdown_ft
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"" jsx
"" NeoBundle "jsx/jsx.vim"

"" React jsx
NeoBundle "mxw/vim-jsx"

"" Terraform
NeoBundle 'hashivim/vim-terraform'

"" coq
NeoBundleLazy "jvoorhis/coq.vim", {'autoload': {'filetypes': ['coq']}}

"" patched to 'vim-scripts/CoqIDE' (for compatibility with v8.4pl3)
NeoBundleLazy "tauli/CoqIDE", "patch-1", { 'gui' : 1, 'autoload': {'filetypes': ['coq']}}

"" slim
NeoBundleLazy 'slim-template/vim-slim', {'autoload': {'filetypes': ['slim']}}
augroup slim_settings
  autocmd! slim_settings
  au BufRead,BufNewFile *.slim set filetype=slim
augroup END

"" gitcommit
augroup gitcommit_dictionary
  autocmd! gitcommit_dictionary
  autocmd FileType gitcommit :set dictionary=~/.vim/dictionary/github_user.dict
augroup END

"" ghq
NeoBundle 'kelan/gyp.vim'

"" autocmd! rooter
augroup rooter
  autocmd! rooter
  autocmd BufEnter *.c,*.hs,*.coffee,*.rb,*.html,*.haml,*.erb,*.rjs,*.css,*.js,*.vhd,*.vim,*.hs,*.ml :Rooter
augroup END
let g:rooter_use_lcd = 1

let g:syntastic_ghdl_workdir = 'lib'

" ocaml
let g:syntastic_ocaml_use_ocamlbuild = 1
"" let g:syntastic_ocaml_checkers = ['merlin'] 
NeoBundle 'def-lkb/vimbufsync'
"" NeoBundleLazy 'the-lambda-church/merlin', {'rtp': 'vim/merlin', 'autoload': {'filetypes': ['ocaml']}}
NeoBundle 'OCamlPro/ocp-indent', {'name': 'tools/ocp-indent.vim', 'script_type': 'plugin'}

" emmet
"" NeoBundle 'mattn/emmet-vim'
"" let g:user_emmet_settings = { 
"" \   'tex' : { 
"" \       'indentation' : '  ',
"" \       'snippets' : { 
"" \           'align'       : "\\begin{align}\n|\n\\end{align}\n",
"" \           'aligns'      : "\\begin{align*}\n|\n\\end{align*}\n",
"" \           'enumerate'   : "\\begin{enumerate}\n\\item |\n\\end{enumerate}\n",
"" \           'itemize'     : "\\begin{itemize}\n\\item |\n\\end{itemize}\n",
"" \           'description' : "\\begin{description}\n\\item |\n\\end{description}\n",
"" \           'array'       : "\\begin{array}{|}\n\\end{array}",
"" \           'table'       : "\\begin{table}[htbp]\n"
"" \               ."\\begin{center}\n"
"" \               ."\\caption{|}\n"
"" \               ."\\label{}\n"
"" \               ."\\begin{tabular}{}\n"
"" \               ."\\end{tabular}\n"
"" \               ."\\end{center}\n"
"" \               ."\\end{table}\n",
"" \           'figure'      : "\\begin{figure}[htbp]\n"
"" \               ."\\begin{center}\n"
"" \               ."\\includegraphics[width=0.7\textwidth]{}\n"
"" \               ."\\caption{|}\n"
"" \               ."\\label{}\n"
"" \               ."\\end{center}\n"
"" \               ."\\end{figure}\n",
"" \           'jsart'       : "\\documentclass{jsarticle}\n"
"" \               ."\\usepackage{amsmath,amssymb}\n"
"" \               ."\\usepackage[dvipdfmx]{graphicx}\n\n"
"" \               ."\\renewcommand{\\theequation}{\\thesection.\\arabic{equation}}\n"
"" \               ."\\makeatletter\n"
"" \               ."\\@addtoreset{equation}{section}\n"
"" \               ."\\makeatother\n\n"
"" \               ."\\title{|}\n"
"" \               ."\\author{}\n"
"" \               ."\\date{}\n\n"
"" \               ."\\begin{document}\n"
"" \               ."\\maketitle\n\n"
"" \               ."\\section{}\n\n\n"
"" \               ."\\begin{thebibliography}{99}\n"
"" \               ."\\bibitem{}\n\n"
"" \               ."\\end{thebibliography}\n\n"
"" \               ."\\end{document}\n",
"" \           'jart'        : "\\documentclass{jarticle}\n"
"" \               ."\\usepackage{amsmath,amssymb}\n"
"" \               ."\\usepackage[dvipdfmx]{graphicx}\n\n"
"" \               ."\\renewcommand{\\theequation}{\\thesection.\\arabic{equation}}\n"
"" \               ."\\makeatletter\n"
"" \               ."\\@addtoreset{equation}{section}\n"
"" \               ."\\makeatother\n\n"
"" \               ."\\title{|}\n"
"" \               ."\\author{}\n"
"" \               ."\\date{}\n\n"
"" \               ."\\begin{document}\n"
"" \               ."\\maketitle\n\n"
"" \               ."\\section{}\n\n\n"
"" \               ."\\begin{thebibliography}{99}\n"
"" \               ."\\bibitem{}\n\n"
"" \               ."\\end{thebibliography}\n\n"
"" \               ."\\end{document}\n",
"" \       }
"" \   },
"" \   'plaintex' : {
"" \       'extends' : 'tex'
"" \   }
"" \}

" latex
"" let g:quickrun_config = {}
"" let g:quickrun_config['tex'] = {
""             \   'command' : 'latexmk',
""             \   'outputter' : 'error',
""             \   'outputter/error/error' : 'quickfix',
""             \   'cmdopt': '-pdfdvi',
""             \   'exec': ['%c %o %s']
""             \ }
"" augroup myLaTeXQuickrun
""     au!
""     au BufEnter *.tex call <SID>SetLaTeXMainSource()
""     au BufEnter *.tex nnoremap <Leader>v :call <SID>TexPdfView() <CR>
"" augroup END
"" function! s:SetLaTeXMainSource()
""     let currentFileDirectory = expand('%:p:h').'/'
""     let latexmain = glob(currentFileDirectory.'*.latexmain')
""     let g:quickrun_config['tex']['srcfile'] = fnamemodify(latexmain, ':r')
""     echo latexmain
""     if latexmain == ''
""         unlet g:quickrun_config['tex']['srcfile']
""     endif
"" endfunction
"" function! s:TexPdfView()
""     let texPdfFilename = expand('%')
""     if exists("g:quickrun_config['tex']['srcfile']")
""         let texPdfFilename = fnamemodify(g:quickrun_config['tex']['srcfile'], ':.:r') . '.pdf'
""     endif
""     if has('win32')
""         let g:TexPdfViewCommand = '!start '.
""                     \             '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance '.
""                     \             texPdfFilename
""     endif
""     if has('mac')
""         let g:TexPdfViewCommand = '! '.
""                     \             'open -a preview '.
""                     \             texPdfFilename
""     elseif has('unix')
""         let g:TexPdfViewCommand = '! '.
""                     \             'evince '.
""                     \             texPdfFilename
""     endif
""     execute g:TexPdfViewCommand
"" endfunction

let g:syntastic_tex_checkers = ['chktex']
let g:tex_conceal=""

"" why3
"" NeoBundle 'https://gforge.inria.fr/git/why3/why3.git', { 'script_type': 'ftplugin', 'rtp': 'share/vim' }

if !empty(glob("$HOME/.vim/ftplugin/why3.vim"))
  augroup why3
    au!
    au BufEnter *.why :set filetype=why3
  augroup END
endif


""
"" Vim-LaTeX
""
"" " filetype plugin on
"" " filetype indent on
"" set shellslash
"" set grepprg=grep\ -nH\ $*
"" let g:tex_flavor='latex'
"" let g:Imap_UsePlaceHolders = 1
"" let g:Imap_DeleteEmptyPlaceHolders = 1
"" let g:Imap_StickyPlaceHolders = 0
"" let g:Tex_DefaultTargetFormat = 'pdf'
"" let g:Tex_FormatDependency_ps = 'dvi,ps'
"" let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"" "let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"" "let g:Tex_FormatDependency_pdf = 'pdf'
"" let g:Tex_CompileRule_dvi = 'platex -synctex=1 -interaction=nonstopmode $*'
"" "let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode $*'
"" let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"" let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"" "let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
"" "let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'
"" "let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode $*'
"" "let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode $*'
"" "let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode $*'
"" let g:Tex_BibtexFlavor = 'pbibtex'
"" "let g:Tex_BibtexFlavor = 'upbibtex'
"" let g:Tex_MakeIndexFlavor = 'mendex $*.idx'
"" let g:Tex_UseEditorSettingInDVIViewer = 1
"" let g:Tex_ViewRule_dvi = 'pxdvi -watchfile 1'
"" "let g:Tex_ViewRule_dvi = 'advi -watch-file 1'
"" "let g:Tex_ViewRule_dvi = 'evince'
"" "let g:Tex_ViewRule_dvi = 'okular --unique'
"" "let g:Tex_ViewRule_dvi = 'wine ~/.wine/drive_c/w32tex/dviout/dviout.exe -1'
"" let g:Tex_ViewRule_ps = 'gv --watch'
"" "let g:Tex_ViewRule_ps = 'evince'
"" "let g:Tex_ViewRule_ps = 'okular --unique'
"" "let g:Tex_ViewRule_ps = 'zathura'
"" "let g:Tex_ViewRule_pdf = 'texworks'
"" let g:Tex_ViewRule_pdf = 'evince'
"" "let g:Tex_ViewRule_pdf = 'okular --unique'
"" "let g:Tex_ViewRule_pdf = 'zathura -s -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"" "let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"" "let g:Tex_ViewRule_pdf = 'pdfviewer'
"" "let g:Tex_ViewRule_pdf = 'gv --watch'
"" "let g:Tex_ViewRule_pdf = 'acroread'
"" "let g:Tex_ViewRule_pdf = 'pdfopen -viewer ar9-tab'

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

"" clojure
augroup cljc
  autocmd! cljc
  autocmd BufNewFile,BufRead *.cljc :set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs :set filetype=clojure
augroup END
