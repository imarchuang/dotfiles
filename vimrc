colorscheme onedark
syntax on
set number
set relativenumber
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

set encoding=utf-8
set tw=79
set history=700
set undolevels=700

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Yaml stuffs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Better copy & past
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a " on OSX press ALT and click
" set bs=2    " make backspace behave like normal again
set backspace=indent,eol,start

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'python-rope/ropevim'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-fugitive'

" Class/module browser
Plug 'majutsushi/tagbar'
" Plug 'yegappan/taglist'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'

Plug 'Yggdroot/indentLine'
Plug 'pedrohdz/vim-yaml-folds'

Plug 'hashivim/vim-terraform'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript'

call plug#end()

set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let python_highlight_all=1

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab  |
	\ set autoindent  |
	\ set fileformat=unix 

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ale_linters = {'python': ['flake8']}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_text_changed = 'never'
" let g:ale_fixers['javascript'] = ['eslint']
let b:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

set t_Co=256
autocmd BufEnter *.tf* colorscheme icansee
let g:terraform_fmt_on_save=1
let g:terraform_align=1


" Map Ctrl-P to :Files or :FZF
nnoremap <C-p> :Files<Cr>
" show fzf window in the bottom (default is popup) 
let g:fzf_layout = { 'down': '40%' }
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" make fzf window as popup 
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:airline_powerline_fonts = 1
set laststatus=2

" for indentLine plugin
" let g:indentLine_char = '⦙'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let g:pythonmode_rope_goto_def_newwin = "vnew"
" let g:pythonmode_rope_extended_complete = 1
" let g:pythonmode_rope_breakpoint = 0
" let g:pythonmode_breakpoint = 0
" let g:pythonmode_syntax = 1
" let g:pythonmode_syntax_builtin_objs = 0
" let g:pythonmode_syntax_builtin_funcs = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<CR>

" Better navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action == 'k'
			return "\<C-P>"
		endif
	endif
		return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Map Ctrl-F to nerdtree focus 
nnoremap <C-f> :NERDTreeFocus<CR>
" Map Ctrl-t to nerdtree toggle 
nnoremap <C-t> :NERDTreeToggle<CR>
" Map Ctrl-n to launch nerdtree 
nnoremap <C-n> :NERDTree<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

