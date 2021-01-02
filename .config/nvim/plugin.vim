call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'luochen1990/rainbow'
Plug 'kshenoy/vim-signature'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/forest-night'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'szw/vim-maximizer'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                COLOR                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
" edge
let g:edge_style='aura' " edge aura default
let g:edge_transparent_background = 0
let g:edge_enable_italic = 0 " italic keywords
let g:edge_disable_italic_comment = 1
" gruvbox
let g:gruvbox_material_background = 'soft' " hard medium soft
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
" forest night
let g:forest_night_transparent_background = 0
let g:forest_night_enable_italic = 0
let g:forest_night_disable_italic_comment = 1

" dark light
set background=dark

colorscheme edge

let g:rainbow_active = 1

let g:indentLine_char = '┃'
let g:indentLine_setConceal = 2
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ['startify', 'help', 'markdown', 'sh', 'vim', 'javascript', 'css', 'coc-explorer', 'c', 'cpp', 'zsh']
let g:indentLine_bufTypeExclude = ['help', 'terminal', '__vista__']
nmap <leader>ig :IndentLinesToggle<CR>

let g:lightline = {
\ 'colorscheme': 'edge',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'filename', 'readonly', 'modified', 'gitbranch' ,'cocstatus' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'gitbranch': 'FugitiveHead'
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 COC                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

let g:coc_global_extensions = [
  \ 'coc-pyright',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-json',
  \ 'coc-highlight',
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-lists',
  \ 'coc-bookmark',
  \ 'coc-actions']

let g:coc_filetype_map = {
  \ 'jst': 'html',
  \ 'h': 'c',
  \ 'hpp': 'cpp'
  \ }

let g:coc_explorer_global_presets = {
\   'wiki': {
\      'root-uri': '~/Wiki',
\      'position': 'floating'
\   },
\   'simplify': {
\     'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]',
\     'width': 30
\   }
\ } 

" coc explorer mapping
nmap <silent> <leader>e :CocCommand explorer --sources file+ --preset simplify --quit-on-open<CR>
" coc general mapping
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>h :call CocAction('doHover')<cr>
" nmap <silent> <leader>x <Plug>(coc-codelens-action)
nnoremap <expr> <C-d> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-d>"
nnoremap <expr> <C-u> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-u>"
" goto coc-lists
nnoremap <silent> gl :CocList --number-select<CR>
" goto buffers
nnoremap <silent> sb :CocList buffers<CR>
" search files in current dir
nnoremap <silent> sf :CocList files<CR>
" search lines in current file
nnoremap <silent> sl :CocList lines<CR>
" search symbols
nnoremap <silent> ss :CocList symbols<CR>
" search words
nnoremap <silent> sw :CocList words<CR>
" search by grep
nnoremap <silent> sg :CocList grep<CR>
" coc snippet mapping
inoremap <silent><expr> <TAB>
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<TAB>"
inoremap <silent><expr> <c-z> coc#refresh()
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
vmap <C-d> <Plug>(coc-snippets-select)
xmap <leader>x <Plug>(coc-convert-snippet)
" coc bookmark mapping
nmap <c-b>b <Plug>(coc-bookmark-toggle)
nmap <c-b>j <Plug>(coc-bookmark-next)
nmap <c-b>k <Plug>(coc-bookmark-prev)
nmap <c-b>a <Plug>(coc-bookmark-annotate)
nmap <c-b>/ :CocList bookmark<CR>
nmap <silent> <c-b>c :CocCommand bookmark.clearForCurrentFile<CR>
nmap <silent> <c-b>C :CocCommand bookmark.clearForAllFiles<CR>
" coc action
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

augroup CocOptions
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OI   :call CocAction('runCommand', 'editor.action.organizeImport')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             VIM-EASY-ALIGN                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             VIM-EASY-MOTION                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
map <c-w> <Plug>(easymotion-bd-w)
map <c-e> <Plug>(easymotion-bd-f)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   ALE                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" when to lint
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'python': ['pylint'],
\   'cpp': ['g++'],
\   'c': ['gcc'],
\   'sh': ['shell'],
\   'javascript': ['standard'],
\   'html': ['tidy'],
\   'css': ['stylelint'],
\   'json': ['jsonlint'],
\}
" fixers used
let g:ale_fixers = {
\   'javascript': ['standard'],
\}
let g:ale_css_stylelint_options = '--config ~/.stylelintrc'
let g:ale_python_pylint_options = '--extension-pkg-whitelist=pygame'
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)
" error sign
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚡'
let g:ale_sign_column_always = 0
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NEOFORMAT                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :Neoformat<cr>
autocmd FileType javascript nmap <leader>f :ALEFix<CR>
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_python = ['autopep8', 'yapf']
let g:neoformat_enabled_javascript = ['standard']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EMMET                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_mode='i'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                VISTA                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_close_on_jump=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                MAXMIZER                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:maximizer_set_default_mapping = 0
nmap <leader>m :MaximizerToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                MAXMIZER                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-enter> <Plug>(wildfire-fuel)