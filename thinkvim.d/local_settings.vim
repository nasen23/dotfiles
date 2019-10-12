" __     ___             _                          __  __
" \ \   / (_)_ __ ___   | |    _____   _____  ___  |  \/  | ___
"  \ \ / /| | '_ ` _ \  | |   / _ \ \ / / _ \/ __| | |\/| |/ _ \
"   \ V / | | | | | | | | |__| (_) \ V /  __/\__ \ | |  | |  __/
"    \_/  |_|_| |_| |_| |_____\___/ \_/ \___||___/ |_|  |_|\___|
"
" Local setting file of ThinkVim.
" Author: Na Sen

" I do change this very often
colorscheme neodark
set cursorline
" let g:spaceline_colorscheme = 'solarized_dark'
let g:eleline_powerline_fonts = 1
let g:eleline_slim = 1


let g:vebugger_leader = '<leader>n'

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

" open terminal in vsplit
nmap <leader>vt :vsplit<CR><C-w><C-l>:ter<CR>

" find the next <++> and start to edit it
nnoremap <localleader><localleader> <Esc>/<++><CR>:nohlsearch<CR>c4l

" keep cursor centered
set scrolloff=5

let g:mkdp_auto_close = 1

let g:transparent_background = 1

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

" buffet confs
let g:buffet_use_devicons = 1
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer guifg=#ffffff guibg=#34495e
    hi! BuffetActiveBuffer guifg=#ecf0f1 guibg=#2980b9
    hi! BuffetTrunc guifg=#000000 guibg=#9b59b6
    hi! BuffetTab guifg=#000000 guibg=#9c88ff
endfunction

" indent line confs
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" vimtex settings
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'
let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-pdf -xelatex',
        \ 'pdflatex'         : '-pdf',
        \ 'dvipdfex'         : '-pdfdvi',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}

" vista.vim support
let g:vista_default_executive = 'coc'

let g:vista_executive_for = {
    \ 'cpp': 'vim_lsp',
    \ 'php': 'vim_lsp'
  \ }

" spaceline config
let g:spaceline_seperate_style = 'none'


" make background transparent
if !exists("g:transparent_background")
    let g:transparent_background = 0
endif

if g:transparent_background == 1
    hi Normal guibg=None ctermbg=None
    hi SignColumn guibg=None ctermbg=None
    hi DiffAdd guibg=None ctermbg=None
    hi DiffDelete guibg=None ctermbg=None
    hi DiffChange guibg=None ctermbg=None
    hi SignifyLineDelete guibg=None ctermbg=None
    hi SignifyLineChange guibg=None ctermbg=None
endif

" set system clipboard
set clipboard+=unnamedplus

" fcitx-remote commands
let g:fcitx_state = '1'

function! s:insert_leave()
    let g:fcitx_state = system('fcitx-remote')
    if g:fcitx_state =~ '^1'
        return
    elseif g:fcitx_state =~ '^2'
        silent exec '!fcitx-remote -t'
        let g:fcitx_state = '2'
    endif
endfunction

function! s:insert_enter()
    if g:fcitx_state =~ '^1'
        return
    elseif g:fcitx_state =~ '^2'
        silent exec '!fcitx-remote -t'
    endif
endfunction

if executable('fcitx-remote')
    autocmd InsertLeave * call <SID>insert_leave()
    autocmd InsertEnter * call <SID>insert_enter()
endif

" markdown file easy mappings
source ~/.thinkvim.d/filetype/markdown.vim
source ~/.thinkvim.d/filetype/indent.vim

" autocmd Filetype tex autocmd BufWrite <buffer> silent exec 'AsyncRun xelatex -pdf %'

