" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'tpope/vim-sensible'
Plug 'https://github.com/supercollider/scvim.git'
Plug 'https://github.com/gregsexton/Atom.git'
Plug 'rakr/vim-one'
" Surround
Plug 'https://tpope.io/vim/surround.git'
" Commentary
Plug 'https://tpope.io/vim/commentary.git'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Optional:
Plug 'honza/vim-snippets'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number
set relativenumber
set runtimepath+=~/.vim_runtime
colorscheme one-dark
" highlight Normal ctermbg=234
" set background=dark
set cursorline
set ruler
"add line marker
"add max column marker
set tabstop=4
set shiftwidth=4
set expandtab

" File explorer 'netrw'
let g:netrw_browse_split = 1
let g:netrw_winsize = 25

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set filetype=supercollider
au Filetype supercollider packadd scvim

augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
augroup END

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Supercollider
let g:scFlash=1

" Key maps
" Save file
map <C-S> :w<CR>
" Move around buffers
nmap <C-N> :bn<CR>
nmap <C-P> :bN<CR>
autocmd filetype supercollider nmap <C-P> <F5>
autocmd filetype supercollider nmap <C-Space> <F6>
" Move around windows (splits)
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
" Pairinig
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Compile and run C++
autocmd filetype h nnoremap <C-Space> :w <bar> exec 'make Debug && make RunDebug'<CR>
autocmd filetype cpp nnoremap <C-Space> :w <bar> exec 'make Debug && make RunDebug'<CR>
