" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv

nnoremap <F8> :LatexTOCToggle<CR>

let g:LatexBox_quickfix=4
let g:LatexBox_latexmk_options =
  \ '-pdflatex="pdflatex -synctex=1 %O %S"'
" let g:LatexBox_viewer = 'evince -reuse-instance -inverse-search '
"   \ . '"vim --servername ' . v:servername
"   \ . ' --remote-send \"^<C-\^>^<C-n^>'
"   \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
  " \ . ':call remote_foreground('''.v:servername.''')^<CR^>\""'
" nnoremap <expr><buffer> <C-F11> ':LatexView ' . '-forward-search '
"     \ . shellescape(expand('%:p')) . ' ' . line(".") . '\<CR>'
