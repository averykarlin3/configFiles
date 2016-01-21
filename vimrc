syntax on
set number
set laststatus=2
set ruler
let g:livepreview_previewer = 'open -a Chrome'
command -nargs=1 L !latex <args>.tex | dvipdfm <args>.dvi
command G !git add * | git commit -a -m update | git push
set autoindent
set background=dark
colo solarized
set t_Co=16;
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
"filetype indent on
let g:tex_flavor = 'latex'
let g:Imap_FreezeImap = 1
let g:Tex_DefaultTargetFormat = 'pdf'
