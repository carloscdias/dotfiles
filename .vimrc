" Load defaults
call has('python3')
"unlet! skip_defaults_vim
"source $VIMRUNTIME/defaults.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" fzf setup
" set rtp+=/usr/local/opt/fzf

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
Plugin 'Townk/vim-autoclose'
" vim-autoclose
Plugin 'tpope/vim-fugitive'
" vim-fugitive
Plugin 'airblade/vim-gitgutter'
" vim-gitgutter
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" snippets
Plugin 'ycm-core/YouCompleteMe'
" YouCompleteMe

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
syntax on
set textwidth=120
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
let mapleader = ","

" make backspaces more powerfull
set backspace=indent,eol,start
" Show line numbers
set number
set showcmd

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
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(expand('<cword>'), <bang>0)

nnoremap <silent> <C-f> :RG<CR>

nnoremap <silent> <C-p> :Files<CR>

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
"let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

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
" let g:ycm_min_num_of_chars_for_completion = 99
" Close preview window
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Accept autocomplete suggestion with Enter
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" read conf files under projects
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/projects/*', '~/.ycm_extra_conf.py']
" Shortcut for YcmCompleter FixIt
nnoremap <silent> <leader><f> :YcmCompleter FixIt<CR>
" Retab shortcut
nnoremap <silent> <leader>r :retab<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-j>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsListSnippets = '<s-h>'

