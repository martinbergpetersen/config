call plug#begin('~/.local/share/nvim/plugged')

" deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Async linter
Plug 'w0rp/ale'

" JSON
Plug 'elzr/vim-json'

" Commentings
Plug 'tpope/vim-commentary'

" Template 
Plug 'aperezdc/vim-template'

Plug 'dkprice/vim-easygrep'

" SEARCH
Plug 'google/vim-searchindex'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
" Support bitbucket with Gbrowse
Plug 'tommcdo/vim-fubitive'

" Ctags
Plug 'majutsushi/tagbar' 

" MD instant markdown
Plug 'shime/vim-livedown'


" zenmode
Plug 'junegunn/goyo.vim'

" Buffer explorer
Plug 'jlanzarotta/bufexplorer'


" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'

" Tabular - text alignment
Plug 'godlygeek/tabular'

" Python
Plug 'fisadev/vim-isort'
Plug 'tell-k/vim-autopep8'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
Plug 'plytophogy/vim-virtualenv'
" Plug 'zchee/deoplete-jedi'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go'

"Themes
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'sheerun/vim-wombat-scheme'
Plug 'dracula/vim'
" Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'lifepillar/vim-solarized8'

" NERDTree
Plug 'scrooloose/nerdtree'

" Search
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Indentline
Plug 'Yggdroot/indentLine'

" Easy motiom
Plug 'easymotion/vim-easymotion'

" Multiple cursors 
Plug 'terryma/vim-multiple-cursors'

"Snippets
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'



" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ULTISNIPIS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories= "~/.myconfig/ultisnippets"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
set encoding=utf8
set nocompatible
" Enable filetype plugins
filetype plugin on
filetype indent on

" No preview wndow
set completeopt-=preview
" Set to auto read when a file is changed from the outside
set autoread
set title
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=10

" set relativenumber
set number
set numberwidth=2
set guifont=Hack\ 14
set noundofile
set nocursorcolumn
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.git

" autoread

au FocusGained,BufEnter * checktime

set nospell
" set spell
" set spell spelllang=en
syntax sync minlines=256
set re=1
augroup vimrc_help
	  autocmd!
	    autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
    augroup END

    if (has("termguicolors"))
	      set termguicolors
	      endif


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Close window
map <C>wq :close<CR>
" Close a tab
map <leader>tc :tabclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>
" Close/delete buffer
map <C-q> :bdelete<CR>
" next buffer
map <C-l> :bnext<cr>
" Prev buffer
map <C-h> :bprevious<cr>

autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => STATUS LINE
 """"""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EDITING MAPPINGS
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
   let save_cursor = getpos(".")
   let old_query = getreg('/')
   silent! %s/\s\+$//e
   call setpos('.', save_cursor)
   call setreg('/', old_query)
   endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIMRC CONFIGS
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ge :e! ~/.myconfig/neovim/init.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PARENTHESIS/BRACKET - SHORTCUTS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CUSTOM SHORTCUTS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Peek the view. It splits the screen and shows the called funtion
map <leader>p :split<cr><leader>d

" search
map <space> /
nnoremap <c-space> :call AutoHighlightToggle()<Bar>set hls<CR>
nnoremap <esc> :call DisabledHighlight()<return><esc>

cnoreabbrev ls !ls
cnoreabbrev tree !tree

cnoreabbrev term terminal

cnoreabbrev todo Ack! "\# TODO"
cnoreabbrev fix Ack! "\# FIXME"
cnoreabbrev obs Ack! "\# OBS"

nmap <F8> :TagbarToggle<CR>
nnoremap <f1> :SearchIndex<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GIT-FUGITIVE
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ACK SEARCHING
" "    requires ack.vim - it's much better than vimgrep/grep
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
let g:ag_highlight = 1
let g:ackhighlight = 1
cnoreabbrev Ack Ack!
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" vnoremap <leader>gv y:Ack! <C-r>=fnameescape(@")<CR><CR>

" When you press gv you Ack after the selected text
vnoremap <leader>gv :call VisualSelection('gv', '')<CR>
" Open Ack and put the cursor in the right position
map <leader>s :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!

" When you search with Ack, display your results in cope by doing:
"   <leader>cc

" To go to the next search result do:
"   <leader>n

" To go to the previous search results do:
"   <leader>p

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>l :cn<cr>
map <leader>h :cp<cr>

""""""""""""""""""""""""""""""
" => DEOPLETE
" """"""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
autocmd CompleteDone * silent! pclose!

""""""""""""""""""""""""""""""
" => PYTHON
" """"""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako


au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $d on_delete=models.CASCADE 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $t import pdb;pdb.set_trace()
au FileType python inoremap <buffer> $p print(
au FileType python inoremap <buffer> $f #--- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 


au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#


"Autopep8 - visual mode gq
au FileType python setlocal formatprg=autopep8\ -

" highlight python self, when followed by a comma, a period or a parenth
augroup PythonCustomization
  :autocmd FileType python syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@="
augroup END

cnoreabbrev pt !pytest -v
cnoreabbrev pn !python

function! AddCWDToPythonPath()
	execute "python3 import os, sys; sys.path.append(os.getcwd())"
	execute "python import os, sys; sys.path.append(os.getcwd())"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JEDI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 1


""""""""""""""""""""""""""""""
" => GO
" """"""""""""""""""""""""""""""

let g:go_version_warning = 0
nmap <leader>a :GoAlternate<cr>
nnoremap <leader>d :GoDef<CR>
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_structs = 1

""""""""""""""""""""""""""""""
" => bufExplorer plugin
" """"""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='nmber'
nnoremap <leader>o :BufExplorer<cr> 


""""""""""""""""""""""""""""""
" => CTRL-P
" """"""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .coffee
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore node_modules
      \ --ignore .env
      \ --ignore .vscode
      \ -g ""'

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:30'

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTREE
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=30
let g:nerdtree_tabs_open_on_console_startup = 0
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeChDirMode=2

let NERDTreeShowLineNumbers=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-MULTIPLE-CURSORS
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_start_word_key='<C-s>'
let g:multi_cursor_next_key="<C-s>"
let g:multi_cursor_prev_key="<C-a>"


" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
    if exists('*deoplete#disable')
        exe 'call deoplete#toggle()'
    elseif exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction
" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
    if exists('*deoplete#enable')
        exe 'call deoplete#toggle()'
    elseif exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction

""""""""""""""""""""""""""""""
" => GITGUTTER
" """"""""""""""""""""""""""""""
" only shows diffs on save
let g:gitgutter_async = 1
" Update git gutter on save
autocmd BufWritePost * GitGutterEnable

""""""""""""""""""""""""""""""
" => WORP/ALE
" """"""""""""""""""""""""""""""
let g:ale_sign_error='EE'
let g:ale_sign_warning='WW'
let g:ale_lint_on_enter = 1
highlight clear ALEWarningSign
" sets ale to use python3 for flake
" highlight clear ALEWarningSign
" autocmd VimEnter * ALEDisable
nnoremap <leader>ad :ALENext<CR>
nnoremap <leader>as :ALEPrevious<CR>


""""""""""""""""""""""""""""""
" => FLAKE
" """"""""""""""""""""""""""""""
let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show


""""""""""""""""""""""""""""""
" => AIRLINE PLUGIN
" """"""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""
" => Markdown plugin
" """"""""""""""""""""""""""""""
let g:instant_markdown_autostart = 1
" let vim_markdown_preview_toggle=2
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"
""""""""""""""""""""""""""""""
" => LANGUAGETOOL
" """"""""""""""""""""""""""""""
let g:languagetool_jar = '/home/intempus/.languagetools/LanguageTool-4.2/languagetool-commandline.jar'

""""""""""""""""""""""""""""""
" => COLOR/THEMES
" """"""""""""""""""""""""""""""
let g:apprentice_termcolors=256
let g:gruvbox_termcolors=256
let g:solarized_termcolors=256
let g:deus_termcolors=256
let g:onedark_termcolors=256

set background=dark
colorscheme gruvbox


""""""""""""""""""""""""""""""
" => INDENT
" """"""""""""""""""""""""""""""
let g:indentLine_char = '¦'
let g:indentLine_setColors = 0

""""""""""""""""""""""""""""""
" => CUSTOM FUNCTIONS
" """"""""""""""""""""""""""""""
" " Zoom / Restore window.
function! s:ZoomToggle() abort
   if exists('t:zoomed') && t:zoomed
     	    execute t:zoom_winrestcmd
	    let t:zoomed = 0
    else
	let t:zoom_winrestcmd = winrestcmd()
	resize
	vertical resize
	let t:zoomed = 1
    endif
endfunction


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" Removed hightlights on words
function! DisabledHighlight()
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=1
 endif
let @/ = ""
echo ""
endfunction

" enabled hightlights on words
function! AutoHighlightToggle()
    let @/ = ''
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=1
    echo ""
endfunction

command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! v\gvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    echo l:pattern
    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! SetPyhton2Host()
    echo 'Running with Python2.7'
    " sets ale to use flake for python 2.7
    let python2_host='/usr/bin/python2.7'
    let g:jedi#force_py_version = 2
    let g:python_host_prog =python2_host
    let g:vim_isort_python_version ='python2'
    let g:ale_python_flake8_args = '-m flake8'
endfunction

function! SetPython3Host()
     echo 'Running with Python3.5'
     let python3_host='/usr/bin/python3.5'
     let g:jedi#force_py_version = 3
     let g:python3_host_prog = python3_host
     let g:vim_isort_python_version = 'python3'
     let g:ale_python_flake8_options = '-m flake8'
endfunction

 """""""""""""""""""""""""""""
 " => GOYO - ZENMODE
 """"""""""""""""""""""""""""""
 let g:goyo_width = 200
 let g:goyo_height = 100

"""""""""""""""""""""""""""""
" => OMNIFUNC
"""""""""""""""""""""""""""""""
" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <C-J> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")
