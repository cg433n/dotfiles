filetype plugin indent on
syntax enable

set autoindent
set smartindent
set backspace=indent,eol,start
set completeopt=menu,menuone,preview,noselect
set omnifunc=syntaxcomplete#Complete
set infercase
set nowrap
set linebreak
set incsearch
set hidden
set guioptions=mc
set clipboard^=unnamed,unnamedplus
set formatoptions=tcroqjn
set showmatch
set expandtab
set tabstop=4
set shiftwidth=0
set diffopt=vertical
set autowrite
set autowriteall
set shortmess+=I
set noswapfile
set showcmd
set hlsearch
set wildmenu
set wildignore+=*.git,*venv/*,*node_modules/*,*vendor/*,*__pycache__/*,*.aux,*.cls,*dist/*,*output/*
set wildignorecase
set autoread
set spelllang=en_us
set sidescrolloff=5
set scrolloff=5
set tags^=./.git/tags
set laststatus=2
set statusline=%<[%{fnamemodify(getcwd(),':t')}]\ %f\ %h%m%r%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%l,%c%V\ %L%)\ %P\ [%{wordcount().words}]
set foldlevel=5
set virtualedit=all
set linespace=1
set thesaurus=~/.vim/thesaurus/mthesaur.txt
set isfname+=32
set belloff+=ctrlg

colorscheme default

" Mappings
map <Space> <Leader>
map gf :e <cfile><CR>
noremap <silent> k gk
noremap <silent> j gj
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>o <C-O>
nnoremap <leader>i <C-I>
nnoremap <leader>e :edit **/*
nnoremap <leader>h gqip$
nnoremap <leader>a :tag *
nnoremap - :Ex<cr>
nnoremap <leader>u :CtrlPBuffer<cr>
nnoremap <leader>g :CtrlPTag<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>s :Gstatus<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

" Commands
command! Bd :bn | :bd#
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! HardWrap if &fo =~ 'a' | setlocal fo-=a | else | setlocal fo+=a | endif
command! Find :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

" Abbreviations
iabbrev <expr> :date: strftime("%Y-%m-%d")
iabbrev <expr> [[]] strftime("[[%Y%m%d%H%M%S]]")

" Packages
packadd! matchit
let g:netrw_banner = 0
let g:markdown_folding = 1
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }
let g:ctrlp_use_caching = 0
let g:polyglot_disabled = ['markdown']
let g:ale_completion_enabled=1
let g:ale_completion_tsserver_autoimport=1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
set omnifunc=ale#completion#OmniFunc
let g:mucomplete#enable_auto_at_startup=1
let g:pandoc#folding#fdc=0
let NERDTreeMinimalUI=1
let g:jedi#popup_on_dot=0

" Autocommands
augroup Writing
    autocmd!
    autocmd FileType text,rst,markdown setlocal spell
    autocmd FileType text,rst,markdown setlocal nosmartindent
    autocmd FileType text setlocal foldmethod=indent
    autocmd FileType text,rst,markdown nnoremap <CR> :e <cfile><CR>
    autocmd FileType text,rst,markdown nnoremap <BS> :bp<CR>
    " autocmd Syntax markdown syn match markdownUnderscoreNoop /_/
    autocmd FileType text,rmd,rst,markdown setlocal foldcolumn=0
augroup END   

augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

augroup FrontEnd
    autocmd!
    autocmd FileType javascript set filetype=javascript.jsx
augroup END

