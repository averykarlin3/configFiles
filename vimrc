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

function! GTxt()
	%s/            \d\+\./\\4/g
	%s/         \d\+\./\\3/g
	%s/      \d\+\./\\2/g
	%s/   \d\+\./\\1/g
	"%s/\d. \(.*\)\n/\\subsection{\1}\r\\begin{outline\*}\r/g
	%s/\d\+\. \(.*\)\n/\\end{outline*}\r\\subsection{\1}\r\\begin{outline\*}\r/g
	"%s/\(\\subsection{[.\n\r]*\)\(\\subsection\)/\1\\end{outline\*}\r\2/g
	$s/\n/\r\\end{outline*}/g
	1s/\\end{outline\*}\n//g
endfunction

set ignorecase
set smartcase
set spell spelllang=en_us
autocmd BufWritePost,FileWritePost *.tex :silent !pdflatex -interaction=nonstopmode % &> /dev/null

