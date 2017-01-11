" Indentation
set sw=2

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv

nnoremap <F8> :LatexTOCToggle<CR>
nnoremap <LocalLeader>q :LatexErrors<CR>

" No need, now on vimtex launch
" let g:LatexBox_latexmk_async=1
let g:LatexBox_quickfix=4

" SynTeX Okular
" let g:LatexBox_viewer='okular --unique >/dev/null'
" SynTeX zathura
let g:LatexBox_viewer='zathura --fork -x "vim --servername TEX --remote +\%{line} \%{input}"'

function! SyncTexForward()
    let s:syncfile = LatexBox_GetOutputFile()
    let execstr = "!zathura --synctex-forward=".line(".").':'.col('.').':% '.s:syncfile
    exec execstr
endfunction
nnoremap <LocalLeader>f :call SyncTexForward()<CR><CR>

" Spell checking
" This may be enough but it's too slow
syntax sync fromstart
" syn sync maxlines=200
" syn sync minlines=50
