
"General settings--------------------------------

runtime! debian.vim

set nocompatible

"Pathogen--------------------


source ~/.vim/bundle/pathogen/autoload/pathogen.vim

silent! call pathogen#infect()

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"Colors and Fonts-------------------------------

colorscheme solarized

set background=dark

"Vim css-colors----


let g:cssColorVimDoNotMessMyUpdatetime = 1

"Text mappings------------------------------------

 " Yank from the cursor to the end of the line, 
nnoremap Y y$   

"Plugins mappings------------------------------------------

nmap <F2> :NERDTreeToggle<CR>

let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

"Interface mappings------------------------------------------  

map \t :tabnew<cr>
map \n :tabnext<cr>
map \p :tabprevious<cr>
map \c :tabclose<cr>
map \sh :source /usr/share/vim/vim73/vimsh.vim<cr>
nnoremap <leader>w <C-w>v<C-w>l

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

"Syntax-indentation-General---------------------------------------

syntax on

if has("autocmd")
  filetype plugin indent on
endif


"Autocomplete------------------------------------------

if has("autocmd")
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading=1
    autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set wildmode=longest,list,full
set wildmenu


"Autoclosing tags--------------------------------------------------------

:let g:closetag_html_style=1 
  :source ~/.vim/bundle/closetag/closetag.vim 
  
  :source ~/.vim/bundle/BufOnly/BufOnly.vim

:au Filetype html,xml,xsl source ~/.vim/bundle/closetag/closetag.vim


"Various-------------------------------------------------------------



set showcmd		" Show (partial) command in status line.
set nowrap 		
set noignorecase         " Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set nu                   "show line numbers
set history=1000 
set guioptions+=b        "show bottom scrollbar
set nobackup
set backupdir=/usr/share/vim/backup
set noswapfile
set shiftwidth=3





