function Toggle_theme()
    if g:theme == "black"
        let g:solarized_termtrans=0
        set background=light
        let g:theme="white"
    else
        let g:solarized_termtrans=1
        set background=dark
        let g:theme="black"
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
