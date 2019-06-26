" Plugins using vim-plug {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-lion'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'
" Plug 'iCyMind/NeoSolarized'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
Plug 'terryma/vim-multiple-cursors'
" Plug 'w0rp/ale'
Plug 'neomake/neomake'
Plug 'Yggdroot/indentLine'
Plug 'kassio/neoterm'
Plug 'tpope/vim-abolish'
Plug 'ervandew/supertab'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'reedes/vim-wordy'
Plug 'dbmrq/vim-ditto'
Plug 'junegunn/goyo.vim'
Plug 'rizzatti/dash.vim'

call plug#end()
" }}}

" General Settings {{{
let mapleader = '\'
set clipboard=unnamedplus " Use system clipboard
set hidden                " Buffers persist in the background
" Set shell to bash
set shell=/bin/bash
" Enable mouse support
set mouse=a
" Keep 5 line padding on curson
set scrolloff=5
" Numbering
set number
set cursorline
" Wildmenu
set wildmenu
set wildmode=list:longest,full " enable completion via tab
" Panes
set splitright
set splitbelow
" Indentation and Folding
set autoindent
set copyindent
set shiftround
set foldmethod=indent
set nofoldenable
" Search
set smartcase
set incsearch
" Tabs
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
" Text
setlocal textwidth=80
setlocal conceallevel=0
"Swap Files
set noswapfile
" History and Undo Levels
set undolevels=99999
set history=1000
set undofile
set undodir=~/.local/share/nvim/undodir
" Colors
syntax on
set termguicolors
" colorscheme NeoSolarized
colorscheme nord
set background=dark
" Filetype Recognition
filetype on
filetype plugin on
filetype indent on
" Finding files
set path+=**
" Strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" Keybindings {{{
noremap <leader>sv :source ~/.config/nvim/init.vim<cr>
noremap <leader>ev :edit ~/Documents/Programming/Dotfiles/init.vim<cr>
" move by visual lines
nnoremap j gj
nnoremap k gk
nnoremap <space><space> <esc>/<++><enter>"_c4l
nnoremap <leader>nt :NERDTreeFind<cr>
map <F6> :setlocal spell! spelllang=en_us<cr>
" }}}

" Python {{{
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.6/bin/python3'
let g:loaded_python_provider = 1 " disable Python 2 support
nnoremap <buffer> <F5> :exec '!python3' shellescape(@%, 1)<cr>
" set colorcolumn to 80 lines for Python files
autocmd Filetype python setlocal colorcolumn=80
"autoformat using yapf
autocmd BufWritePre *.py Neoformat
" }}}

" Java {{{
autocmd BufWritePre *.java Neoformat
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
nnoremap <F9> :make<Return>:copen<Return>
nnoremap <buffer> <F10> :exec '!java -cp %:p:h %:t:r'<cr>
" }}}

" JavaScript {{{
" set indent level to 2 spaces instead of 4
autocmd filetype javascript setlocal shiftwidth=2 tabstop=2
" format code on save
autocmd BufWritePre *.js Neoformat
autocmd FileType javascript setlocal formatprg=prettier\ --single-quote
" Use formatprg when available
let g:neoformat_try_formatprg = 1
" allow JSX in normal JS files
" let g:jsx_ext_required = 0
" }}}

" LaTeX {{{
autocmd FileType tex inoremap ;new \documentclass[11pt]{article}<Enter>\usepackage[margin=1in]{geometry}<Enter><Enter><Enter>\title{<++>}<Enter>\author{Samarth Kishor}<Enter><Enter><++>
autocmd Filetype tex inoremap ;em \emph{}<++><Esc>T{i
autocmd Filetype tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ses \section*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sses \subsection*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssses \subsubsection*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i

" Change the textwidth for LaTeX files
autocmd FileType tex setlocal textwidth=100
" Disable indent for LaTeX files
let g:vimtex_indent_enabled = 0
autocmd FileType tex setlocal noautoindent
autocmd FileType tex setlocal nocindent
autocmd FileType tex setlocal nosmartindent
autocmd FileType tex setlocal indentexpr=
" Automatic filetype detection
let g:tex_flavor = 'latex'
" }}}

" BibTeX {{{
autocmd FileType bib inoremap ;a @article{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>journal<Space>=<Space>"<++>",<Enter>volume<Space>=<Space>"<++>",<Enter>pages<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;oa @article{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>journal<Space>=<Space>"<++>",<Enter>volume<Space>=<Space>"<++>",<Enter>number<Space>=<Space>"<++>",<Enter>pages<Space>=<Space>"<++>",<Enter>url<Space>=<Space>"<++>",<Enter>urldate<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>11kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter><Tab>author<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>booktitle<Space>=<Space>"<++>",<Enter>editor<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;o @online{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>url<Space>=<Space>"<++>",<Enter>urldate<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i
" }}}

" Statusline {{{
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
set laststatus=2 " Always on statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %.30F            " Truncated file path
set statusline+=%m\                " Modified flag
set statusline+=%=                 " Align the following to the right:
set statusline+=%#CursorColumn#
set statusline+=\ %y               " Filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\] " File format
set statusline+=\ %p%%             " Percentage through file
set statusline+=\ %l:%c            " Line number:column number
set statusline+=\                  " Add a space at the end
" }}}

" Lion {{{
let b:lion_squeeze_spaces = 1
" }}}

" Neomake {{{
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_pandoc_enabled_makers = ['proselint']
" }}}

" Neoformat {{{
let g:neoformat_enabled_python = ['yapf']
" }}}

" ALE {{{
" let g:ale_linters = {
"     \ 'markdown': ['proselint'],
"     \ 'python': ['flake8'],
"     \ 'tex': ['proselint'],
"     \ }
" " make the linters less annoying, to list use the command :ALELint to run AleLint manually
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 0
" " get ALE to work with airline
" let g:airline#extensions#ale#enabled = 1
" }}}

" IndentLine {{{
let g:indentLine_char = '│'
" }}}

" Pandoc {{{
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#command#latex_engine = "xelatex"
autocmd FileType md setlocal formatoptions+=t
autocmd FileType pandoc setlocal formatoptions+=t
" }}}

" Wordy {{{
autocmd FileType markdown,text,tex DittoOn
" }}}

" vim:foldmethod=marker:foldlevel=0
