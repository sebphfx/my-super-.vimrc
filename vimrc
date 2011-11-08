
"General settings--------------------------------

runtime! debian.vim

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"Colors and Fonts-------------------------------

colorscheme peachpuff

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


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Syntax-indentation-General---------------------------------------

syntax on

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

autocmd BufRead * python setIndentation()

python << EOF
def setIndentation():
   import vim
   maxSearch = 1000     #  max number of lines to search through

   indentSpaces = None
   cb = vim.current.buffer
   indentCount = { ' ' : 0, '\t' : 0 }
   justSawDefOrClassLine = 0

   for i in xrange(0, min(maxSearch, len(cb))):
      line = cb[i]
      if not line: continue
#for i in xrange(0, min(maxSearch, len(cb))):  [CONTINUED]
      #  add to tab versus space count
      if line[0] in ' \t':
         indentCount[line[0]] = indentCount.get(line[0], 0) + 1

   #  more lines started with space
   if indentCount[' '] > indentCount['\t']:
      vim.command('set smarttab tabstop=8 expandtab')
      if indentSpaces:
         vim.command('set ts=%d sw=%d' % ( indentSpaces, indentSpaces ))

   #  more lines started with tab
   else:
      vim.command('set softtabstop=3 ts=3 sw=3')
EOF

"Autocomplete------------------------------------------

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
  :source /usr/share/vim/vim73/ftplugin/closetag.vim 

:au Filetype html,xml,xsl source /usr/share/vim/vim73/ftplugin/closetag.vim


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



"syntax checking-errors-debugging------------------------------------

syn match pythonError "^\s*def\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*class\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*for\s.*[^:]$" display
syn match pythonError "^\s*except\s*$" display
syn match pythonError "^\s*finally\s*$" display
syn match pythonError "^\s*try\s*$" display
syn match pythonError "^\s*else\s*$" display
syn match pythonError "^\s*else\s*[^:].*" display
syn match pythonError "^\s*if\s.*[^\:]$" display
syn match pythonError "^\s*except\s.*[^\:]$" display
syn match pythonError "[;]$" display
syn keyword pythonError         do

" Syntax checking entire file
" Usage: :make (check file)
" :clist (view list of errors)
" :cn, :cp (move around list of errors)
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


