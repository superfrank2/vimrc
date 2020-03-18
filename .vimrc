"====================================================================
" Start vundle 
"====================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'Yggdroot/indentLine'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'chazy/cscope_maps'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'wesleyche/SrcExpl'
Plugin 'wesleyche/Trinity'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/molokai'
Plugin 'marijnh/tern_for_vim', { 'for': 'javascript' }
Plugin 'benmills/vimux'
"
"===============================================================
" Write your plugins here
"===============================================================
"====================================================================
" Run vundle
"====================================================================
" All of your Plugins must be added before the following line
call vundle#end()            " required
"
"===================================================================
"Trinity Settings
"==================================================================
" Open and close all the three plugins on the same time
nmap <F8>  :TrinityToggleAll<CR>

" Open and close the Source Explorer separately
nmap <F9>  :TrinityToggleSourceExplorer<CR>

" Open and close the Taglist separately
nmap <F10> :TrinityToggleTagList<CR>

" Open and close the NERD Tree separately
nmap <F11> :TrinityToggleNERDTree<CR>

"===============
"
"YCM
"默認配置文件路徑"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"打開vim時不再詢問是否加載ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解釋器路徑"
let g:ycm_path_to_python_interpreter='/usr/bin/python3'




filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


execute pathogen#infect()
syntax on 
filetype plugin indent on 
map <C-n> :NERDTree<CR>
let g:miniBufExplMaxSize = 2
set number
filetype indent on 

"Code Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

"PEP8
au BufNewFile,BufRead *.py
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
"show space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\ $/

"Syntax Checking 
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
"let g:syntastic_auto_loc_list = 1  "強制顯示錯誤於下方
let g:syntastic_always_populate_loc_list = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"clipboard
"
set clipboard=unnamedplus

"color scheme
if has('gui_running')
  colorscheme molokai
else
  colorscheme molokai
endif
" Solarized dark light switch
call togglebg#map("<F5>")
set cursorline
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE


"autocomplete some shit 
"
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
		        return "\<Right>"
	else
			    return a:char
	endif
endfunction

"enhance YCM JS completetion with tern smart
"
autocmd FileType javascript setlocal omnifunc=tern#Complete
set completeopt-=preview

