set t_Co=256
set fileencoding=utf-8
set encoding=utf-8
set enc=utf-8
set termencoding=utf-8
set expandtab
"set smarttab
set shiftwidth=4
set softtabstop=4
syntax on
set background=dark
filetype indent plugin on
"colorscheme jellybeans
colorscheme monokai
set modeline
set mouse=a
set incsearch
set colorcolumn=80
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
endif

cmap w!! w !sudo tee > /dev/null %

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
        set number
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>

function! Python2()
    let g:syntastic_python_python_exec = '/usr/bin/python2'
    edit %
endfunc
nnoremap <F12> :call Python2()<CR>

nnoremap <silent> <C-t> <Esc>:tabnew<CR>
map <F4> <Esc>:registers<CR>

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugarit tähän
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
"Plugin 'jaxbot/brolink.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'lepture/vim-jinja'
Plugin 'xsbeats/vim-blade'
Plugin 'burnettk/vim-angular'
Plugin 'scrooloose/syntastic'
"Plugin 'klen/python-mode'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'wting/rust.vim'
Plugin 'bpearson/vim-phpcs'
Plugin 'terryma/vim-multiple-cursors'


call vundle#end()
filetype plugin indent on
" vundle end

" Latex stuff
nnoremap <F6> :w<CR>:!rubber --pdf --warn all %<CR>
nnoremap <F7> :!mupdf %:r.pdf &<CR><CR>

map <F5> :PluginInstall<CR>
map <F2> :NERDTreeTabsToggle<CR>
map <F9> :CtrlPMRU<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set laststatus=2
set pastetoggle=<F3>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd FileType yaml set shiftwidth=2|set softtabstop=2
set fillchars+=vert:┃
set dir=~/.vimswap/_swap//
set backup
set backupdir=~/.vimswap/_backup/,~/tmp,.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_phpcs_args='--standard=PSR2'
let g:syntastic_html_tidy_exec = 'tidy'
