if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
inoremap <silent> <Plug>NERDCommenterInsert  <BS>:call NERDComment('i', "insert")
inoremap <silent> <expr> <Plug>delimitMateS-BS delimitMate#WithinEmptyPair() ? "\<Del>" : "\<S-BS>"
inoremap <silent> <Plug>delimitMateBS =delimitMate#BS()
snoremap <silent>  c
xnoremap 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippet()
nmap  :tabn 
nmap ,caL <Plug>CalendarH
nmap ,cal <Plug>CalendarV
nmap ,ca <Plug>NERDCommenterAltDelims
xmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
xmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
xmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cA <Plug>NERDCommenterAppend
xmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
xmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
xmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
nmap ,c$ <Plug>NERDCommenterToEOL
xmap ,cn <Plug>NERDCommenterNested
nmap ,cn <Plug>NERDCommenterNested
xmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
xmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
xmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
nmap ,Y "+y
nmap ,P "+p
nmap ,p :set tw=0:set wrap:set spell
nmap ,A :'a,'bs/^\t//g 
nmap ,a :'a,'bs/^/\t/g 
nmap ,b i}O{	 
nmap ,r :%s/\t/  /g
nmap ,u	 :s/\t// :nohlsearch 
nmap ,	 :s/^/\t/ :nohlsearch 
nmap ,T :!ctags --options="$HOME/.ctagsrc" 
nmap ,t :ptag 
nmap ,/ :nohlsearch
nmap ,q :q
nmap ,su :split ~/.vim/bundle/UltiSnips/UltiSnips/
nmap ,s :split ~/.vimrc
nmap ,w :w
nmap K :!firefox https://duckduckgo.com/?q= & 
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
nnoremap <silent> <Plug>CalendarH :cal calendar#show(1)
nnoremap <silent> <Plug>CalendarV :cal calendar#show(0)
snoremap <silent> <Del> c
snoremap <silent> <BS> c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
xnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call NERDComment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("n", "Comment")
inoremap <silent> 	 =UltiSnips#ExpandSnippet()
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set completeopt=menu,preview,longest
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set incsearch
set omnifunc=syntaxcomplete#Complete
set printheader=
set printoptions=top:1in,bottom:1in,left:0.5in,right:0.5in
set ruler
set runtimepath=~/.vim,~/.vim/vundle/Vundle.vim,~/.vim/vundle/AutoComplPop,~/.vim/vundle/nerdtree,~/.vim/vundle/delimitMate,~/.vim/vundle/nerdcommenter,~/.vim/vundle/sparkup,~/.vim/vundle/UltiSnips,~/.vim/vundle/vim-polyglot,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,~/.vim/after,~/.vim/vundle/Vundle.vim,~/.vim/vundle/Vundle.vim/after,~/.vim/vundle/AutoComplPop/after,~/.vim/vundle/nerdtree/after,~/.vim/vundle/delimitMate/after,~/.vim/vundle/nerdcommenter/after,~/.vim/vundle/sparkup/after,~/.vim/vundle/UltiSnips/after,~/.vim/vundle/vim-polyglot/after
set shiftwidth=2
set showcmd
set smartindent
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
set tabstop=2
set tags=./tags,./TAGS,tags,TAGS,/usr/include/tags
set textwidth=80
" vim: set ft=vim :
