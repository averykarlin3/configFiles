syntax on
colo monokai
set number
set laststatus=2
set ruler
let g:livepreview_previewer = 'open -a Chrome'
command -nargs=1 L !latex <args>.tex | dvipdfm <args>.dvi
command G !git add * | git commit -a -m update | git push
set autoindent
