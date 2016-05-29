set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
"
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'

Plugin 'scrooloose/nerdtree'

"Plugin 'mattn/emmet-vim'
"colorscheme
Plugin 'google/vim-colorscheme-primary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/tabula.vim'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'hukl/Smyck-Color-Scheme'

"Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'vim-scripts/a.vim'

"Plugin 'kshenoy/vim-signature'

Plugin 'yegappan/grep'
Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'fholgado/minibufexpl.vim'
"Plugin 'wincent/command-t'

"Plugin 'gcmt/wildfire.vim'

Plugin 'powerline/fonts'
Plugin 'bling/vim-airline'
Plugin 'mhinz/vim-startify'
Plugin 'majutsushi/tagbar'
"Plugin 'itchyny/calendar.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'junegunn/vim-easy-align'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'

"markdown
"Plugin 'suan/vim-instant-markdown'
"Plugin 'file:///home/genglei/.vim/bundle/indexer', {'pinned': 1}
"Plugin 'file:///home/genglei/.vim/bundle/dfrank_util',{'pinned': 1}
"Plugin 'file:///home/genglei/.vim/bundle/vimprj',{'pinned': 1}
"Plugin 'file:///home/genglei/.vim/bundle/gundo',{'pinned': 1}
"Plugin 'file:///home/genglei/.vim/bundle/SingleCompiler',{'pinned': 1}
"Plugin 'file:///home/genglei/.vim/bundle/CSApprox',{'pinned': 1}
" All of your Plugins must be added before the following line
call vundle#end()            " required
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
"


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
set t_Co=256
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

let mapleader=";"

filetype on
filetype plugin on

nmap <Leader>lb 0
nmap <Leader>le $
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>

"set guioptions-=l
"set guioptions-=L
"set guioptions-=r
"set guioptions-=R
"set guioptions-=m
"set guioptions-=T

autocmd ColorScheme * so $HOME/vimfiles/plugin/mark.vim

behave mswin
set nobackup
set nowritebackup
set noswapfile
set nowrapscan
set nu
set nobackup
set ignorecase smartcase
syntax enable
if has("gui_running")
    "light or dark
    "set background=light
    colorscheme molokai 
else
    set background=dark
    colorscheme molokai 
endif


"taglist.vim setting
map <silent> <F9> :TlistToggle<CR>
set nocompatible
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0
nmap <silent> <leader>tt :TlistToggle<cr>



filetype plugin indent on
set completeopt=longest,menu

" Control Tab behavior
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" autocmd FileType make setlocal noexpandtab


"autoload_cscope.vim close macros
let g:autocscope_menus = 0

" " mouse mode
set mouse=a
"
" " highlight current line or column
set cursorline
set cursorcolumn

"YouCompleteMe
"let g:ycm_extra_conf_globlist = ['/home/genglei/*']
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
"let g:ycm_complete_in_comments=1
"let g:ycm_confirm_extra_conf=0
"let g:ycm_collect_identifiers_from_tags_files=1
"set tags+=/usr/include/sys.tags
"set tags+=/home/genglei/work/x360/360_project/system/kernel/TAGS
"inoremap <leader>; <C-x><C-o>
"set completeopt-=preview
"let g:ycm_min_num_of_chars_for_completion=1
"let g:ycm_cache_omnifunc=0
"let g:ycm_seed_identifiers_with_syntax=1
"map <silent> <F5> :YcmForceCompileAndDiagnostics<cr>

"NERDTree
let g:NERDTreeWinPos="right"
nmap <silent> <leader>nn :NERDTreeToggle<cr>


"Command-T
"nmap <silent> <leader>cc :CommandT<cr>
"nmap <silent> <leader>cb :CommandTBuffer<cr>
"nmap <silent> <leader>cm :CommandTMRU<cr>

"airline
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_mode_map = {
"            \ '__' : '-',
"            \ 'n'  : 'N',
"            \ 'i'  : 'I',
"            \ 'R'  : 'R',
"            \ 'c'  : 'C',
"            \ 'v'  : 'V',
"            \ 'V'  : 'V',
"            \ '' : 'V',
"            \ 's'  : 'S',
"            \ 'S'  : 'S',
"            \ '' : 'S',
"            \ }
"let g:Powerline_colorscheme='solarized256'
"set t_Co=256
"set laststatus=2
"set ttimeoutlen=50

"TagBar
nmap <silent> <leader>tb :TagbarToggle<cr>
let tagbar_left=1 


"Emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"language
"set fileencodings=utf-8,gb2312,gbk,gb18030 
"set termencoding=utf-8  
"set fileformats=unix  
"set encoding=prc
set fencs=utf-8,GB18030,ucs-bom,default,latin1
set guifont=YaHei_Consolas_Hybrid:h11


let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


"set foldmethod=indent
set foldmethod=syntax
set nofoldenable

"a.vim 
nmap <Leader>ch :A<CR>
nmap <Leader>sch :AS<CR>


"ctrlsf.vim
nnoremap <Leader>sf :CtrlSF<CR>
let g:ackprg = 'ag --nogroup --nocolor --column'

"Grep.vim
 "nnoremap <silent> <F3> :Grep<CR>
 nnoremap <Leader>gr :Grep<CR>
 let Grep_Default_Options = '-rnI --exclude-dir=.svn --exclude=cscope.*' 

 "Ack.vim
nnoremap <Leader>ac :Ack!<CR>

let NERD_c_alt_style=1

map <Leader>bl :MBEToggle<cr>
"map <Leader>j :MBEbn<cr>
"map <Leader>k :MBEbp<cr>
map <silent> <F7> :MBEbn<cr>
map <silent> <F8> :MBEbp<cr>

let g:indexer_ctagsCommandLineOptions="--c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+fkstliaSn --extra=+f --language-force=c"

" ctags 
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>
nmap <Leader>tf :tfirst<CR>
nmap <Leader>tl :tlast<CR>
map <silent> <F9> :tnext<cr>
map <silent> <F10> :tprevious<cr>
nmap <Leader><Leader>n :tags<cr>
"nmap <Leader><Leader>f :tag<cr>
nmap <Leader><Leader>s :stag<cr>
nmap <Leader><Leader>p :ptag<cr>
nmap <Leader><Leader>t :tjump<cr>
nmap <Leader><Leader>d :psearch<cr>

"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"


" This selects the next closest text object.
map <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)

nnoremap <Leader>ud :GundoToggle<CR>

map! <C-v> <C-R>+

"mark.vim
if has("gui_running")
    let g:mwDefaultHighlightingPalette = 'extended'
endif


nmap <C-N> :cnext<cr>
nmap <C-P> :cprevious<cr>

"commandT  enconding issue
"let g:CommandTEncoding = 'UTF-8'
"nnoremap <silent> <leader>mr :CommandTMRU<CR>

"Ctrlp
nnoremap <silent> <leader>ct :CtrlP .<CR>
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:200'
"let g:ctrlp_prompt_mappings = { 'PrtHistory(-1)': ['<c-p>'] }
"let g:ctrlp_prompt_mappings = { 'PrtHistory(1)': ['<c-n>'] }
"let g:ctrlp_max_history = 0
let g:ctrlp_map = '<F12>'

" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif
