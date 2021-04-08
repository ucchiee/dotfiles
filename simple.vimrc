" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set ignorecase                          " Ignore case
set smartcase                           " Override ignore case for mixed case searches
"set autochdir                          " Your working directory will always be the same as your working directory
" set spell                               " Enables spell check
" set complete+=k                         " Enables completion by spell dictionary

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
" turn off highlighting
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>
" <C-l> in general mode will move to text buffer
nnoremap <C-l> :bnext<CR>
nnoremap <S-Right> :blast<CR>
" <C-h> go back
nnoremap <C-h> :bprevious<CR>
nnoremap <S-Left> :bfirst<CR>
" Useful bindings
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
noremap <Leader>n nzz
noremap <Leader>N Nzz
" better command line filtering
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
