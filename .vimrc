" -- Plugins --
" ctrlp.vim
" emmet-vim
" nerdtree
" vim-autoclose
" vim-fugitive
" vim-gitgutter

let mapleader = ","

execute pathogen#infect()

" General
filetype plugin indent on
syntax on

set background=dark

set tabstop=2
set shiftwidth=2
set expandtab

set number

" syntax for ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" vim diff shortcuts
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>

set incsearch
set hlsearch
" Press space to toggle highlighting on/off, and show current value.
noremap <Space> :set hlsearch! hlsearch?<CR>

" Highlight line over length (80 columns layout)
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Tabs shortcuts

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" NERDTree Configs
nnoremap <C-o> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP Configs
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_switch_buffer = 'et'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Monokai colorscheme
colorscheme monokai

" Show hidden chars
set list

