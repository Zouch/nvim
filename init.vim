call plug#begin('~/.config/nvim/plugged')

" Plugins {
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" }
call plug#end()

let mapleader="\<SPACE>"

set showcmd             " Show (partial) command in the status line
set showmatch           " Show matching brackets
set showmode            " Show current mode
set ruler               " Show the line and colunm numbers of the cursor
set rnu                 " Shot the line numbers on the left side
set formatoptions+=o    " Continue comment marker in new lines
set textwidth=0         " Hard-wrap long lines as you type them
set expandtab           " Insert spaces when you press tab
set tabstop=4
set shiftwidth=4

set mouse-=a            " Fix mouse behaviour

set noerrorbells
set modeline            " Enable modeline
"set esckeys             " Cursor keys in insert mode
set linespace=0         " Set linespacing to minimum
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (j)

set splitbelow          " Horizontal split below current
set splitright          " Vertical split to right of the current

if !&scrolloff
    set scrolloff=3     " Show next 3 lines while scrolling
endif

if !&sidescrolloff
    set sidescrolloff=5 " Show next 5 columns while side scrolling
endif

set display+=lastline
set nostartofline

" Tell vim which character to use for expanded tabs,
" trailing whitespace and EOLs.
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters

" Also highlight all tabs and trailing whitespace characters
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results
set ignorecase          " Make search case insensitive
set smartcase           " Unless the query has one capital letter
set incsearch           " Incremental search
set gdefault            " Use 'g' flag by default with :%s/foo/bar/
set magic               " Use 'magic' patterns (extended regex)

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and replace
nmap <Leader>s :%s//g<Left><Left>

" Relative numbering
autocmd InsertEnter * :set number nornu
autocmd InsertLeave * :set rnu

" Clear whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * :retab

" Save a key press when typing commands
nnoremap ; :

set background=dark
colorscheme desert
set guifont=Source\ Code\ Pro\ Medium\ 11

" CtrlP stuff
nnoremap <Leader>o :CtrlP<CR>           " Open file
nnoremap <Leader>b :CtrlPBuffer<CR>     " Open buffer
nnoremap <Leader>f :CtrlPMRUFiles<CR>   " Most recently used files

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz'
set wildignore+=*.exe,*.dll,*.lib,*.a,*\\tmp\\*,*.swp
" TODO: Configuration
let g:ctrlp_custom_ignore = {
    \ 'dir':    '\v[\/](\.(git|hg|svn))|(build|lib|build-dbg|build-rel|bin)$',
    \ 'file':   '\v\.(exe|so|dll|a|lib|tmp|o)$',
    \}

let g:ctrlp_user_command=[
            \'.git/',
            \'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline
set timeoutlen=50
let g:airline#extensions#tabline#enabled=2
let g:airline#extensions#tabline#fnamemode=':t'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_set=' '
let g:airline#extensions#tabline#right_alt_setp='|'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_left_sep=' '
let g:airline_left_alt_sep='|'
let g:airline_right_sep=' '
let g:airline_right_alt_sep='|'
let g:airline_theme='powerlineish'

" NerdTree
nnoremap <C-H>      :NERDTreeToggle<CR>
nnoremap <Leader>h  :NERDTreeToggle<CR>

" Terminal stuff
tnoremap <A-c> <C-\><C-n>
tnoremap <A-w> <C-\><C-n><C-w>
tnoremap <A-h> <A-w>h
tnoremap <A-j> <A-w>j
tnoremap <A-k> <A-w>k
tnoremap <A-l> <A-w>l
nnoremap <A-w> <C-w>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>h
nnoremap <A-l> <C-w>l

inoremap <A-w> <ESC><C-w>
inoremap <A-h> <ESC><C-w>h
inoremap <A-j> <ESC><C-w>j
inoremap <A-k> <ESC><C-w>k
inoremap <A-l> <ESC><C-w>l

nnoremap [ {
nnoremap ] }
