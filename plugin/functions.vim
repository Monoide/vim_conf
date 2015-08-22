function Toggle_color()
    if g:color == "black"
        let g:solarized_termtrans=0
        set background=light
        let g:color="white"
    else
        let g:solarized_termtrans=1
        set background=dark
        let g:color="black"
    endif
endfunction

function GrepFolder(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! " . shellescape(@@) . " *"
    copen
endfunction
