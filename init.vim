call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'google/vim-colorscheme-primary'
Plug 'noahfrederick/vim-neovim-defaults'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/ag'
Plug 'gabesoft/vim-ags'
Plug 'scrooloose/nerdtree'
Plug 'ekalinin/dockerfile.vim'
Plug 'matze/vim-move' "Move lines
Plug 'w0rp/ale' "Shellcheck
Plug 'hashivim/vim-terraform'
Plug 'arithran/vim-delete-hidden-buffers'

" Pop Up Menu Completion
Plug 'neoclide/coc-neco'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Pop Up Menu End

call plug#end()

set hidden           "needed for vim COC

" set wildmenu        " why is this not the default?!
set  number          " Show line numbers.
set  mouse=a         " enable mouse
set  laststatus=2    " statusline always on

set autoread         "  autoread the file into buffer on focus

" Indentation
set   tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set   shiftwidth=2    " Number of spaces to use for each step of autoindent.
set   expandtab       " Use the appropriate number of spaces to insert a

" <Tab>.
set   smarttab
set   autoindent
set   backspace=2     " Backspace through whitespace

" Search
set   ignorecase      " Ignore case in search patterns.
set   smartcase       " Case sensitive if pattern contains upper case chars
set   hlsearch        " Highlight all search matches
set   incsearch       " Highlight search matches while typing

" Window Splits
set   splitbelow
set   splitright      " better defaults for opening new splits!

" Copy to osx clipboard
set clipboard+=unnamedplus

" Autocomplete menu like bash when pressing tab
set wildmode=longest,list

" Increase command history
set history=200

noremap <2-LeftMouse> *


" Color Scheme
"colorscheme monokai

" Google light scheme
syntax enable
set t_Co=256
set background=light
colorscheme primary

" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight  CursorLine ctermbg=Green ctermfg=Red

"Key Mappings
let mapleader = ','
nnoremap <leader>src :source $MYVIMRC<CR>
noremap <leader>w :w<cr>

" Copy current file name
nmap <leader>fp :let @*=expand("%")<CR>

" Remove serach highlighting
nnoremap <esc> :noh<return><esc>

" go backward and forward through our command history with filtering
"cnoremap <C-p> <Up> 
"cnoremap <C-n> <Down>

" Tab navigation
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

" Move cursor between windows
noremap <leader>l <C-wl>
noremap <leader>h <C-wr>

" Navigate between buffers
noremap <Leader>b :Buffers<CR>
" Map jj and kk to escape and move in insert mode
inoremap jj <ESC>
inoremap kk <ESC>
inoremap hh <ESC>

" FZF remap
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
nnoremap <C-p> :<C-u>FZF<CR>

" Open Ag search
noremap <Leader>f :Ag<CR>

" Search lines in a files
noremap <Leader>l :Lines<CR>

" Searches the word under the cursor through the project tree using fzf and Ag
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1
" Terraform End

" Exit terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v> <Esc> <Esc>
endif

" NERDtree
let g:NERDTreeMouseMode = 3
let NERDTreeShowHidden=1

" Find current active buffer in file tree
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>


" CoC settings
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" CoC settings

