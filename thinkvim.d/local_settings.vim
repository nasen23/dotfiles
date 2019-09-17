" __     ___             _                          __  __
" \ \   / (_)_ __ ___   | |    _____   _____  ___  |  \/  | ___
"  \ \ / /| | '_ ` _ \  | |   / _ \ \ / / _ \/ __| | |\/| |/ _ \
"   \ V / | | | | | | | | |__| (_) \ V /  __/\__ \ | |  | |  __/
"    \_/  |_|_| |_| |_| |_____\___/ \_/ \___||___/ |_|  |_|\___|
"
" Local setting file of ThinkVim.
" Author: Na Sen


" I do change this very often
colorscheme ayu
set cursorline

" easy resize
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical res -5<CR>
noremap <right> :vertical res +5<CR>

nnoremap H 5h
nnoremap J 5j
nnoremap K 5k
nnoremap L 5l

vnoremap H 5h
vnoremap J 5j
vnoremap K 5k
vnoremap L 5l

tnoremap <Esc> <C-\><C-n>

" easy align mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" miniyank
" map p <Plug>(miniyank-autoput)
" map P <Plug>(miniyank-autoPut)

" rename current word/variable
nmap <leader>rn <Plug>(coc-rename)

" find the next <++> and start to edit it
nnoremap <localleader><localleader> <Esc>/<++><CR>:nohlsearch<CR>c4l

" keep cursor centered
set scrolloff=5

let g:mkdp_auto_close = 1

function! g:Open_browser_in_new_window(url)
    silent exe 'silent !open' . a:url . '--args --new-window'
endfunction

let g:mkdp_browserfunc='g:Open_browser_in_new_window'

nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" rainbow configuration
let g:rainbow_conf = {
\   'guifgs': ['#F9D800', 'LightMagenta', 'LightBlue'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'separately': {
    \ 'htmldjango': {
    \ 'parentheses': ['start=/{{/ end=/}}/']
  \     }
  \ }
\}

" vista.vim support
let g:vista_default_executive = 'coc'

let g:vista_executive_for = {
    \ 'cpp': 'vim_lsp',
    \ 'php': 'vim_lsp'
  \ }
