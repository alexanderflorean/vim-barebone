" Settings ==================================================================
let mapleader =" "
colorscheme habamax
set hidden			" allows reuse the same window
set encoding=utf-8		" set encoding
set autoindent
set shiftwidth=4		" Number of autoindent spaces
au FileType markdown set shiftwidth=2
au FileType vimwiki set shiftwidth=2
set smartindent
set smarttab
set breakindent			" indent line wraps
set wrap                        " Wrap lines
set scrolloff=5                 " always show at least one line abo/below cursor

set rnu				" set relative line number
set nu
set ruler			" Show row and column info
set autoread			" auto read files changed outside vim	
""set clipboard=unnamedplus	" use the system clipboard paste into vim
set colorcolumn=81		" highlight max column length
au BufRead *.lsp, set colorcolumn=0

set expandtab			" tabs to spaces
set hlsearch			" highlight search query
set incsearch			" highlight when typing
set ignorecase			" case insensitive searching
set smartcase			" only use case sensitive search when uppercase
set linebreak			" break on word boundaries

set noswapfile			" no swap files
set showmatch			" show matching brackets
set history=1000
set undolevels=1000
set noerrorbells		" turns of the beep
set novisualbell
set backspace=indent,eol,start	" allows backspace over autoindent etc
set ttyfast                     " speeds up scrolling

set updatetime=100              " default 4000 ms = 4 s, is noticeable
set cursorline                  " highlights the cursorline
set t_Co=256			" for the colorschemes
set wildmenu
set mouse=a                     " Enable mouse for scrolling and resizing

set confirm                     " Confirm when closing an unsaved file

" Python PEP indentation 
au  FileType python call PythonVimSettings()

" removes white space at boot, for c and python files
au FileType python,c au BufWritePre <buffer> %s/\s\+$//e

" Functions =================================================================
function! PythonVimSettings()
    set tabstop=4
    set shiftwidth=4
"    set textwidth=79
    set colorcolumn=81
    set autoindent
    let python_highlight_all=1
    let g:repl_position = 3 " 0=bottom, 1 =op, 2=left, 3=right
    nnoremap <F9> :w <CR> :! python3 %  <CR>
    nnoremap <F3> :w <CR> :! pytest -vv ./tests/test_%  <CR>
endfunction

function! NetrwMapping()
    nmap <buffer> H u                           
    nmap <buffer> h -^                          
    nmap <buffer> l <CR>                        

    nmap <buffer> . gh                          
    nmap <buffer> P <C-w>z                      

    nmap <buffer> L <CR>:Lexplore<CR>           
    nmap <buffer> <Leader>e :Lexplore<CR>      
endfunction

" FileExplorer Settings (netrw) ================================================
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_keepdir = 0 
let g:netrw_liststyle = 3
let g:netrw_sort_options = 'i'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_browse_split = 4      


augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END


" Keybindings ===============================================================
nmap Y y$      

nmap <Leader>e :Lexplore %:p:h<CR>
nnoremap <Leader>ht :horizontal terminal
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>wq :wq<CR>

" Move lines
nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up> :m .-2<CR>==
vnoremap <M-Down> :m '>+1<CR>gv=gv
vnoremap <M-Up> :m '<-2<CR>gv=gv

set pastetoggle=<F2>		" toggle between 'paste' and 'nopaste'
nnoremap <F5> :w<CR>
au FileType c map <F9> :! ./%<  <CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
