" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv

nnoremap <F8> :LatexTOCToggle<CR>

let g:LatexBox_quickfix=4
