" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv

nnoremap <F8> :LatexTOCToggle<CR>
nnoremap <LocalLeader>q :LatexErrors<CR>

" No need, it is set up when we launch vimtex
" let g:LatexBox_latexmk_async=1
let g:LatexBox_quickfix=4

" SynTeX
" let g:LatexBox_latexmk_options =
"             \ '-pdflatex="pdflatex -synctex=1 -src-specials %O %S"'
let g:LatexBox_viewer='okular --unique >/dev/null'

function! SyncTexForward()
  let s:syncfile = LatexBox_GetOutputFile()
  let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' >/dev/null&'
  exec execstr
endfunction
nnoremap <LocalLeader>f :call SyncTexForward()<CR>
