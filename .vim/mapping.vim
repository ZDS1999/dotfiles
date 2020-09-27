iabbrev rt return
iabbrev ,a &&
iabbrev ,o \|\|
iabbrev ,e ==
iabbrev ,n !=
iabbrev ,g >=
iabbrev ,l <=
autocmd FileType javascript iabbrev ,e ===
autocmd FileType javascript iabbrev ,n !==
autocmd FileType python iabbrev ,a and
autocmd FileType python iabbrev ,o or

noremap <c-h> 0
noremap <c-l> $
onoremap <c-h> 0
onoremap <c-l> $

noremap <silent> H 5h
noremap <silent> K 7k
noremap <silent> J 7j
noremap <silent> L 5l
noremap <silent> W 20j
noremap <silent> E 20k
nnoremap \j J
noremap <LEADER><CR> :nohlsearch<CR>

nmap s <nop>
nmap R :source $MYVIMRC<CR>
nmap S :w<CR>
nmap Q :q<CR>	
nmap <LEADER>q :q!<CR>
nmap <leader><leader>q :bdelete %<CR>

inoremap jj <Esc>
inoremap <C-l> <Right>
inoremap <C-b> <Left>
inoremap <A-h> <Delete>

" split winodws vertically or horizontally
nnoremap s; :set splitright<CR>:vsplit<CR>
nnoremap s' :set splitbelow<CR>:split<CR>

" move cursor between windows
nnoremap <LEADER>; <C-w>l
nnoremap <LEADER>j <C-w>h
nnoremap <LEADER>l <C-w>k
nnoremap <LEADER>k <C-w>j

" resize
nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>

" tab
nnoremap tc :tabclose<CR>
" switch between tabs
nnoremap t; :tabnext<CR>
nnoremap tj :tabprevious<CR>
" switch between buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" change the way windows are displayed
nnoremap sv <C-w>t<C-w>H
nnoremap sh <C-w>t<C-w>K
nnoremap se <C-w>r

" terminal
nnoremap <LEADER>t :set splitright<CR>:vsplit<CR>:term zsh<CR>:vertical resize-15<CR>:set nonumber<CR>:setlocal statusline=terminal<CR>
tnoremap jj <C-\><C-N>

inoremap <C-w> <Tab>
