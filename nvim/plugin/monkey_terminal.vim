" See: https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23
let s:monkey_terminal_window=-1
let s:monkey_terminal_buffer=-1
let s:monkey_terminal_job_id=-1

function! MonkeyTerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:monkey_terminal_buffer)
    " Creates a window call monkey_terminal
    noswapfile new monkey_terminal
    " Moves to the window the right the current one
    wincmd H
    let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })

    " Change the name of the buffer to "Terminal"
    silent file Monkey\ Terminal
    " Gets the id of the terminal window
    let s:monkey_terminal_window = win_getid()
    let s:monkey_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
    set nonumber

    autocmd BufEnter <buffer> startinsert
    autocmd BufLeave <buffer> stopinsert
    tnoremap <buffer> <C-L> <C-\><C-N><C-W>l
    startinsert
  else
    if !win_gotoid(s:monkey_terminal_window)
      sp
      " Moves to the window below the current one
      wincmd H
      buffer Monkey\ Terminal
      " Gets the id of the terminal window
      let s:monkey_terminal_window = win_getid()
    endif
  endif
endfunction

function! MonkeyTerminalToggle()
  if win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalClose()
  else
    call MonkeyTerminalOpen()
  endif
endfunction

function! MonkeyTerminalClose()
  if win_gotoid(s:monkey_terminal_window)
    " close the current window
    hide
  endif
endfunction

function! MonkeyTerminalExec(cmd)
  if !win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalOpen()
  endif
  " run cmd
  call jobsend(s:monkey_terminal_job_id, a:cmd . "\n")
  normal! G
  wincmd p
endfunction
