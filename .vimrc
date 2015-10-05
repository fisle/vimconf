set t_Co=256
set fileencoding=utf-8
set encoding=utf-8
set enc=utf-8
set termencoding=utf-8


set expandtab
set shiftwidth=4
set softtabstop=4
colorscheme monokai

syntax on
set mouse=a
set modeline
set incsearch
set backspace=indent,eol,start
filetype indent plugin on


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
"Plugin 'jistr/vim-nerdtree-tabs'
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
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'digitaltoad/vim-jade'
Plugin 'mxw/vim-jsx'
Plugin 'junegunn/goyo.vim'


call vundle#end()
filetype plugin indent on
" vundle end

" Custom functions
cmap w!! w !sudo tee > /dev/null %

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
        set number
    endif
endfunc

let @f = 'f,a�kD'

function! Python2()
    let g:syntastic_python_python_exec = '/usr/bin/python2'
    edit %
endfunc

" Latex stuff
nnoremap <F6> :w<CR>:!rubber --pdf --warn all %<CR>
nnoremap <F7> :!mupdf %:r.pdf &<CR><CR>
nnoremap <F8> :!md2pdf % & <CR>

" Keybinds
map <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>
map <F4> <Esc>:registers<CR>
map <F5> :PluginInstall<CR>
map <F9> :CtrlPMRU<CR>
nnoremap <F12> :call Python2()<CR>
nnoremap <silent> <C-t> <Esc>:tabnew<CR>
nnoremap <C-n> :call NumberToggle()<CR>

set laststatus=2

autocmd FileType yaml set shiftwidth=2|set softtabstop=2
autocmd FileType * if &filetype == 'python' | set colorcolumn=80 | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
let g:syntastic_python_flake8_args='--max-line-length=99'

let NERDTreeIgnore = ['\.pyc$']
