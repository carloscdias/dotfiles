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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" fuzzy search
Plugin 'jremmen/vim-ripgrep'
" ripgrep
Plugin 'mattn/emmet-vim'
" emmet-vim
Plugin 'Townk/vim-autoclose'
" vim-autoclose
Plugin 'tpope/vim-fugitive'
" vim-fugitive
Plugin 'airblade/vim-gitgutter'
" vim-gitgutter
Plugin 'ycm-core/YouCompleteMe'
" YouCompleteMe
Plugin 'dart-lang/dart-vim-plugin'
" Dart syntax highlights and tools

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
syntax on
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
let mapleader = ","

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

" Fzf configs
nnoremap <silent> <C-p> :GFiles<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Highlight line over length (80 columns layout)
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Tabs shortcuts
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>

" Configure YCM

" Disable on typing suggestions
let g:ycm_min_num_of_chars_for_completion = 99
" Close preview window
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Accept autocomplete suggestion with Enter
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" read conf files under projects
let g:ycm_extra_conf_globlist = ['~/projects/*', '~/.ycm_extra_conf.py']
" Shortcut for YcmCompleter FixIt
nnoremap <silent> <C-f> :YcmCompleter FixIt<CR>
" Retab shortcut
nnoremap <silent> <leader>r :retab<CR>
