colorscheme mustang
"colorscheme darkknight256
set fileencoding=utf-8
set encoding=utf-8
set enc=utf-8
set termencoding=utf-8
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
syntax on
filetype indent plugin on
set modeline

if &term =~ "xterm"
  "256 color --
  let &t_Co=256
  " restore screen after quitting
  set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif

"plugarikamaa:
execute pathogen#infect()
map <F2> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set laststatus=2
set pastetoggle=<F3>