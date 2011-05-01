set nocompatible
set encoding=utf-8
" Pathogen 'unpacks' plugins
filetype off " Needed for pathogen to work, set it back on later
call pathogen#runtime_append_all_bundles()
filetype on

set backspace=eol,start,indent "Allows deletion of anything in insert mode
set modelines=0
set columns=80
set encoding=utf-8
set wrapmargin=8
set ruler
set smartindent
set autoindent
set autowrite
set pastetoggle=<F2>
syntax enable
set showmode
set showcmd
set wildmenu
set relativenumber
set ruler<
runtime ftplugin/man.vim
set nowrap
" Search options
set hlsearch
set incsearch
set showmatch
nnoremap / /\v
vnoremap / /\v
set gdefault
set ignorecase
set smartcase

" Tabs
set tabstop=8
set expandtab
set shiftwidth=4
au filetype make set noexpandtab " Don't expand tabs in Makefiles
autocmd filetype ruby set ts=2|set sw=2|set expandtab|set sts=2
colorscheme molokai
filetype plugin indent on

" Buffers
set hidden

" Backup files are Git's job!
set nobackup
set noswapfile
set nowb

" Save upon losing focus
au FocusLost * :wa

" Save with w!! even if I needed admin privileges and I forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" Moving around
nnoremap j gj
nnoremap k gk
set cursorline

" Folding
set foldmethod=syntax

" Directory
set autochdir

" Go to normal mode by hitting jj
inoremap jj <ESC>

" Make vertical splits and go to them with this shortcut
nnoremap <leader>w <C-w>v<C-w>l

" Auto read files upon change
set autoread

" Reload vimrc upon change
autocmd! bufwritepost vimrc source ~/.vimrc

" Macros redrawn lazily
"set lazyredraw

set guioptions=

" Map leader to ,
let mapleader = ","

" Terminal colors
set t_Co=256

" Autocomplete menu improvements from
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Programming language specific autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" ConqueTerm plugin
" Keep updating buffer even if not in focus
let g:ConqueTerm_ReadUnfocused = 1
" Use C-w to leave the buffer even if in insert mode
let g:ConqueTerm_CWInsert = 0

"AutoComplPopup plugin
let g:acp_behaviorSnipmateLength = 1

" Plugins and function keys
map <F3> :NERDTreeToggle<CR><CR>
map <F4> :TlistToggle<CR><CR>
map <F5> :YRShow<CR>
map <F6> :ConqueTermSplit bash<CR>

" jsim.vim
autocmd FileType jsim let tlist_jsim_settings = 'jsim;s:Subcircuits;p:Plots;x:Instantiations' | TlistOpen | wincmd l

" Python settings
setlocal smarttab
setlocal formatoptions=croql
