let mapleader = ","
let maplocalleader = ",,"
noremap \ ,
inoremap <leader>u <Esc>bviwUea
nnoremap H 0
nnoremap L $
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" config shortcuts
nnoremap <leader>rc :tabedit $MYVIMRC<CR>
nnoremap <leader>src :source $MYVIMRC<CR>
nnoremap <leader>br :tabedit ~/.bashrc<CR>
nnoremap <leader>ba :tabedit ~/.aliases<CR>
nnoremap <leader>bf :tabedit ~/.functions<CR>

" system clipboard
vnoremap <C-y> :%y+<CR>
nnoremap <leader>ya :%y+<CR>
nnoremap <leader>yp :%y<CR>:tabnew<CR>P 


nnoremap <leader>w :set wrap!<CR>
nnoremap <leader>" viw<Esc>a"<Esc>bi"<Esc>lel
nnoremap <leader>' viw<Esc>a'<Esc>bi'<Esc>lel
" nnoremap <C-j> mz:m .+1<CR>`z
" nnoremap <C-k> mz:m .-2<CR>`z
nnoremap <C-k> mzk"zdd"zp`z
nnoremap <C-j> mz"zjS<Esc>kP2j"_dd`z
vnoremap <leader>" <Esc>`<<Esc>i"<Esc>`>a"<Esc>
vnoremap <leader>' <Esc>`<<Esc>i'<Esc>`>a'<Esc>
onoremap p i(
onoremap " i"
onoremap ' i'

" Markdown 
nnoremap <leader>[ ^i-<Space>[<Space>]<Space>
nnoremap <leader>x 0t]rx0
nnoremap <leader>c 0t]r<Space>0
nnoremap <leader>z 0t]r/0
" Insert markdown code block
nnoremap <leader>` I```<Esc>O```
" Previous markdown header
" :execute "normal! ?^#\r:nohlsearch\rwvg_"

" Move between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

iabbrev adn and
iabbrev tehn then
iabbrev waht what
iabbrev abbrev abbreviation

set number         " Add line numbers on left-hand side
set relativenumber " Make line numbers relative
set cursorline     " Highlight cursor line horizontally

set showcmd  " Show partial command in statusline
set showmode " Show mode in statusline
set title    " Set window title
filetype indent on " Load indent file for the detected file type
set shiftwidth=4   " Set shift width using `<` and `>` to N spaces
set tabstop=4      " Set tab width to N columns
set expandtab      " Replace tabs with spaces
set backspace=indent,eol,start
set autoindent     " Copy indent from current line when starting new line 
syntax on
set display+=lastline " Try to show a last line of paragraph
set encoding=utf-8    " Encode as unicode
set scrolloff=10      " Keep N screen lines above/below cursor while scrolling
""set sidescrolloff=5 " Keep N screen cols to left/right of cursor while scrolling
set matchtime=3       " Show matching parantheses for N tenths of a second
set nowrap
set linebreak         " Prevent wrapping in the middle of a word
set breakindent       " Wrap linebreaks to indent

set ignorecase        " Ignore capital letters during search
set smartcase         " Override ignorecase to search for caps
set showmatch         " Jump to matching words during a search
set hlsearch          " Highlight search matches
set incsearch         " Highlight each matching character incrementally 

set history=1000          " Save N commands in history (default 20)
set wildmenu              " Tab to bring up auto-complete menu
set wildmode=list:longest " Make wildmenu completion behave like bash
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"set shell " Set shell used to execute commands

" Mode change timing
set timeoutlen=1000
set ttimeoutlen=5

" Colors
set background=dark
colorscheme jellybeans
highlight CursorLine ctermbg=236
highlight CursorLineNr ctermbg=236
highlight CursorLineNr ctermfg=DarkGrey
highlight LineNr ctermfg=DarkGrey
highlight Search term=reverse cterm=reverse gui=reverse 
let g:jellybeans_use_term_italics = 1
set noanti

set nocompatible    " Disable vi compatibility which can cause issues 
filetype on         " Try to detect file type
filetype plugin on  " Enable plugins and load for the detected file type
""set backupdir=~/.cache/vim " Store backup files in this path
set nobackup


" Autocommands

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

" Turn off comment autoformatting
augroup noformat_comments
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions -=o
augroup END

" Turn off comment indentation
set nocindent

augroup c_comment 
    autocmd!
    autocmd FileType c nnoremap <buffer> <localleader>c I//<Esc>^
    autocmd FileType c nnoremap <buffer> <localleader>x ^xx
augroup END

" c template file
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.c 0r ~/.vim/templates/main.c
    augroup END
endif 

" Vimscript file settings

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" Custom status line
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\%l\:\%c\ \ %3p%%
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

" Vimwiki markdown syntax
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Add syntax for bash dotfiles
augroup function_ft
    au!
    autocmd BufNewFile,BufRead *.functions set syntax=bash
    autocmd BufNewFile,BufRead *.aliases set syntax=bash
    autocmd BufNewFile,BufRead *.prompt set syntax=bash
    autocmd BufNewFile,BufRead *.env set syntax=bash
augroup END

" File browser settings
let g:netrw_banner=0          " disable banner
""let g:netrw_browse_split=4  " open in prior window
""let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3       " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()

" remove trailing whitespace from Python files
"autocmd BufWritePre *.py *.py :%s/\s\+$//e

" Nice
"highlight cursorline ctermbg=Red
"highlight cursorline ctermfg=Grey
"highlight cursorcolumn ctermbg=Red
"highlight cursorcolumn ctermfg=Grey
