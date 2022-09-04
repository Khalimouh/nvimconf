set nocompatible

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jez/vim-superman'
Plug 'godlygeek/tabular'
Plug 'ekalinin/Dockerfile.vim'
Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'derekwyatt/vim-scala' 
call plug#end()


filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set relativenumber
syntax on

set mouse=va
set noswapfile

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" Toggle this to "light" for light colorscheme
set background=dark

set termguicolors 

" Set the colorscheme
colorscheme gruvbox

au FileType python set 
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_java_checkers = []
let g:syntastic_quiet_messages = { "type": "style", "level": "warnings" }


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='gruvbox'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

"---------- NerdTree Project Browser ----------
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-b> :bn<CR>
noremap <C-c> :!mvn package<CR>
noremap <C-e> :!java -jar ./target/*-jar-with-dependencies.jar<CR>
noremap <C-s> :SyntasticCheck<CR>



let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes':  [],
  \ 'passive_filetypes': [] }


augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
  au FileType scala let b:syntastic_mode = "passive"
augroup END

let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

" ---------- YCM Auto Complete ----------
nnoremap <F12> :YcmCompleter GoTo<CR>

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview
let python_highlight_all=1
let g:ycm_auto_trigger=1

let g:UtliSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigge= "<c-b>"
let g:UtliSnipsJumpBackwardTrigger= "<c-z>"

let g:ulit_expand_or_jump_res = 0 "default value, just set once"
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)? "":"\n"<CR>

let g:local = { 'local': 'postgres://postgres:postgres@localhost:5432/local' }
