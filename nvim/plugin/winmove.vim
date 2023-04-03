" https://github.com/beauwilliams/Dotfiles/blob/056cf2ba605115ef2454c69d5d07c06c09287034/Vim/nvim/init.vim#L708
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd " . a:key
    if (t:curwin == winnr())
        if (match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd " . a:key
    endif
endfunction
