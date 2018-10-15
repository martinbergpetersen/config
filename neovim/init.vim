call plug#begin('~/.local/share/nvim/plugged')

" deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
""deoplete.go
Plug 'zchee/deoplete-go'
"deoplete.python
" Plug 'zchee/deoplete-jedi'
" deoplete.javasript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" latex
Plug 'vim-latex/vim-latex'

" Javascript
Plug  'pangloss/vim-javascript'
Plug  'maksimr/vim-jsbeautify'

" HTML
Plug 'mattn/emmet-vim'
Plug 'Glench/Vim-Jinja2-Syntax'

" Async linter
Plug 'w0rp/ale'

" JSON
Plug 'elzr/vim-json'

" Commentings
Plug 'tpope/vim-commentary'

" Template 
Plug 'aperezdc/vim-template'

Plug 'dkprice/vim-easygrep'


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


" C#
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'

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

" Go
Plug 'fatih/vim-go'

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



" Initialize plugin system
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
set encoding=utf8
set nocompatible
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Peek the view. It splits the screen and shows the called funtion
map <leader>p :split<CR><leader>d

" Close/delete buffer
map <leader>qq :bdelete<CR>

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
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" navigate splits
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
" Terminalmode navigation
tnoremap <C-h> <C-\><C-n><C-h>
tnoremap <C-j> <C-\><C-n><C-j>
tnoremap <C-k> <C-\><C-n><C-k>
tnoremap <C-l> <C-\><C-n><C-l>

" Close a tab
map <leader>tc :tabclose<cr>

" Close the current buffer
nnoremap <leader>bd :bn<cr>:bdelete #<cr>

map <leader>f :b
" Close all the buffers
map <leader>ba :bufdo bd<cr>
" next buffer
map <leader>bn :bnext<cr>
" Prev buffer
map <leader>bm :bprevious<cr>

autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
 """"""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
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
" => Fast editing and reloading of vimrc configs
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ge :e! ~/.config/nvim/init.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket - shortcuts
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


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search noteable words
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cnoreabbrev todo Ack! "\# TODO"
cnoreabbrev fix Ack! "\# FIXME"
cnoreabbrev obs Ack! "\# OBS"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git-fugitive
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
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
" => Deoplete
" """"""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
autocmd CompleteDone * silent! pclose!

""""""""""""""""""""""""""""""
" => Python section
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
" => jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 1


""""""""""""""""""""""""""""""
" => GO section
" """"""""""""""""""""""""""""""

nmap <leader>a :GoAlternate<cr>
nnoremap <leader>d :GoDef<CR>
" let g:go_highlight_string_spellcheck = 1
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
" => Nerd Tree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=30
let g:nerdtree_tabs_open_on_console_startup = 1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeChDirMode=2

let NERDTreeShowLineNumbers=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_next_key="<C-s>"
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
" => gitgutter
" """"""""""""""""""""""""""""""
" only shows diffs on save
let g:gitgutter_async = 0
" Update git gutter on save
autocmd BufWritePost * GitGutterEnable

""""""""""""""""""""""""""""""
" => Worp/Ale plugin
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
" => Flake plugin
" """"""""""""""""""""""""""""""
let g:flake8_error_marker='EE'     " set error marker to 'EE' let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show

""""""""""""""""""""""""""""""
" => nvim settings
" """"""""""""""""""""""""""""""

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


" Shortcuts
cnoreabbrev ls !ls
cnoreabbrev tree !tree

"" => Omnifunc plugin
"""""""""""""""""""""""""""""""
"" use <tab> for completion
 function! TabWrap()
     if pumvisible()
         return "\<C-N>"
     elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
         return "\<tab>"
     elseif &omnifunc !~ ''
         return "\<C-X>\<C-O>"
     else
         return "\<C-N>"
     endif
 endfunction

" power tab
imap <silent><expr><tab> TabWrap()

" Show quotes in js
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""
" => airline plugin
" """"""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='onedark'
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
" => LanguageTool
" """"""""""""""""""""""""""""""

let g:languagetool_jar = '/home/intempus/.languagetools/LanguageTool-4.2/languagetool-commandline.jar'


""""""""""""""""""""""""""""""
" => Color scheme
" """"""""""""""""""""""""""""""
" SET-UP FOR SOLARIZED
let g:apprentice_termcolors=256
let g:gruvbox_termcolors=256
let g:solarized_termcolors=256
let g:deus_termcolors=256
let g:onedark_termcolors=256

set background=dark
colorscheme onedark

""""""""""""""""""""""""""""""
" => Togglebar
" """"""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" => Indent plugin
" """"""""""""""""""""""""""""""
let g:indentLine_char = '¦'

" let g:indentLine_color_term = 200
" let g:indentLine_bgcolor_term = 1
" let g:indentLine_bgcolor_gui = '#FFFFFF'
let g:indentLine_setColors = 0

""""""""""""""""""""""""""""""
" => Functions
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

" Close nerd tree if no buffer is open
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END


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
 " => C#
 """"""""""""""""""""""""""""""
 let g:OmniSharp_port = 2000

 let g:ale_cs_mcsc_assembly_path = ['~/.omnisharp/omnisharp-roslyn/omnisharp/']
 let g:ale_cs_mcsc_assemblies = ['~/.omnisharp/omnisharp-roslyn/omnisharp/']
 set previewheight=10


 set updatetime=500

 sign define OmniSharpCodeActions text=💡


 augroup OSCountCodeActions
   autocmd!
   autocmd FileType cs set signcolumn=yes
   autocmd CursorHold *.cs call OSCountCodeActions()
 augroup END

 function! OSCountCodeActions() abort
   if OmniSharp#CountCodeActions({-> execute('sign unplace 97')})
     let l = getpos('.')[1]
     let f = expand('%:p')
     execute ':sign place 97 line='.l.' name=OmniSharpCodeActions file='.f
   endif
 endfunction

 augroup omnisharp_commands
     autocmd!

     " When Syntastic is available but not ALE, automatic syntax check on events
     " (TextChanged requires Vim 7.4)
     " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

     " Show type information automatically when the cursor stops moving
     autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

     " The following commands are contextual, based on the cursor position.
     autocmd FileType cs nnoremap <buffer> <Leader>d :OmniSharpGotoDefinition<CR>
     autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
     autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
     autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

     " Finds members in the current buffer
     autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

     autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
     autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
     autocmd FileType cs nnoremap <buffer> K :OmniSharpDocumentation<CR>
     autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
     autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
     autocmd BufWritePost *.cs  :OmniSharpCodeFormat
     " Start the omnisharp server for the current solution
     autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
     autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>



     " Navigate up and down by method/property/field
     autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
     autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
     " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>

    " Run code actions with text selected in visual mode to extract method
   autocmd FileType cs xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
   " Add syntax highlighting for types and interfaces
   autocmd FileType cs noremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>
 augroup END
