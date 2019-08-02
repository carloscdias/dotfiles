" Load defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'kien/ctrlp.vim'
" ctrlp.vim
Plugin 'mattn/emmet-vim'
" emmet-vim
Plugin 'scrooloose/nerdtree'
" nerdtree
Plugin 'Townk/vim-autoclose'
" vim-autoclose
Plugin 'tpope/vim-fugitive'
" vim-fugitive
Plugin 'airblade/vim-gitgutter'
" vim-gitgutter
Plugin 'ycm-core/YouCompleteMe'
" YouCompleteMe

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
syntax on
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab

" Show line numbers
set number

" Syntax for ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" vim diff shortcuts
nnoremap <silent> <C-1> :diffget LOCAL<CR>
nnoremap <silent> <C-2> :diffget BASE<CR>
nnoremap <silent> <C-3> :diffget REMOTE<CR>

" Search setup
set incsearch
set hlsearch
" Press space to toggle highlighting on/off, and show current value.
noremap <silent> <Space> :set hlsearch! hlsearch?<CR>

" Monokai colorscheme
colorscheme monokai

" Show hidden chars
set list

" CtrlP Configs
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_switch_buffer = 'et'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NERDTree Configs
nnoremap <silent> <C-o> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Highlight line over length (80 columns layout)
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Tabs shortcuts
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>

let mapleader = ","

" Configure YCM

" Disable on typing suggestions
let g:ycm_min_num_of_chars_for_completion = 99
" Close preview window
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Accept autocomplete suggestion with Enter
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" Shortcut for YcmCompleter FixIt
nnoremap <silent> <C-f> :YcmCompleter FixIt<CR>
" Retab shortcut
nnoremap <silent> <leader><tab> :retab<CR>
