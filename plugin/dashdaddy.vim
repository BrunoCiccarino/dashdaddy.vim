" Plugin: Vim Dashdaddy
" Description: A plugin to create customizable hackeable dashboards in Vim.
" Author: Bruno Ciccarino
" Version: 1.0

" ===== Plugin Core =====

function! s:center_text(text)
  let winwidth = winwidth(0)
  let text_len = strlen(a:text)
  return repeat(' ', (winwidth - text_len) / 2) . a:text
endfunction

function! s:render_ascii(art_lines)
  for line in a:art_lines
    call append(line('$'), s:center_text(line))
  endfor
endfunction

function! s:render_shortcuts(shortcuts)
  let index = 1
  for shortcut in a:shortcuts
    let line = s:center_text('[' . index . '] ' . shortcut.label)
    call append(line('$'), line)
    let index += 1
  endfor
endfunction

function! s:render_message(message)
  call append(line('$'), s:center_text(a:message))
endfunction

function! s:enable_interactivity(shortcuts)
  let index = 1
  for shortcut in a:shortcuts
    execute 'nnoremap <buffer>' . index . ' :' . shortcut.command
    let index += 1
  endfor
endfunction

function! RenderDashboard()
  if !exists('g:dashboard_config')
    echoerr "Error: g:dashboard_config is not set. Please configure your dashboard."
    return
  endif

  if !has_key(g:dashboard_config, 'shortcuts')
    echoerr "Error: g:dashboard_config.shortcuts is required."
    return
  endif

  silent! execute '%bdelete'
  silent! execute 'enew'

  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nonumber
  setlocal norelativenumber
  setlocal nocursorline

  if has_key(g:dashboard_config, 'ascii_art')
    call s:render_ascii(g:dashboard_config.ascii_art)
  endif

  if has_key(g:dashboard_config, 'title')
    call s:render_message(g:dashboard_config.title)
    call append(line('$'), '') " Add space after the title
  endif

  call s:render_shortcuts(g:dashboard_config.shortcuts)

  call append(line('$'), '')
  call append(line('$'), s:center_text("Press a number to select an option"))

  execute "normal! gg"

  call s:enable_interactivity(g:dashboard_config.shortcuts)
endfunction

command! Dashboard call RenderDashboard()

autocmd VimEnter * if argc() == 0 | call RenderDashboard() | endif

" ===== Documentation =====
"
" Example Configuration (add this to your vimrc/init.vim):
"
"let g:dashboard_config = {
"      \ 'title': 'Welcome to My Vim Dashboard!',
"      \ 'ascii_art': [
"      \   '______          _    ______          _     _       ',
"     \   '|  _  \        | |   |  _  \        | |   | |      ',
"      \   '| | | |__ _ ___| |__ | | | |__ _  __| | __| |_   _ ',
"      \   '| | | / _` / __| \'_ \| | | / _` |/ _` |/ _` | | | |',
"      \   '| |/ / (_| \__ \ | | | |/ / (_| | (_| | (_| | |_| |',
"      \   '|___/ \__,_|___/_| |_|___/ \__,_|\__,_|\__,_|\__, |',
"      \   '                                             __/ |',
"      \   '                                            |___/ '
"      \ ],
"      \ 'shortcuts': [
"      \     {'label': 'Edit Config', 'command': ':e ~/.vimrc<CR>'},
"      \     {'label': 'Quit Vim', 'command': ':qa!<CR>'}
"      \   ]
"      \ }

" After configuring `g:dashboard_config`, the dashboard will automatically load
" when Vim starts with no arguments.
"
" To open the dashboard manually, use `:Dashboard`.
"

