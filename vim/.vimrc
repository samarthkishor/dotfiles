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
" Colors
syntax on
set termguicolors
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
"
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
