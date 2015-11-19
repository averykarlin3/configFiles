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
let g:solarized_termcolors = 256

