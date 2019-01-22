call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'farmergreg/vim-lastplace'


" C family
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
Plug 'zchee/deoplete-clang'

" Async linter
Plug 'w0rp/ale'

" JSON
Plug 'elzr/vim-json'

" Commentings
Plug 'tpope/vim-commentary'

Plug 'dkprice/vim-easygrep'


" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
" Support bitbucket with Gbrowse
Plug 'tommcdo/vim-fubitive'

" Ctags
Plug 'majutsushi/tagbar' 
Plug 'craigemery/vim-autotag'

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

Plug 'ervandew/supertab'

" Python
Plug 'fisadev/vim-isort'
Plug 'tell-k/vim-autopep8'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'plytophogy/vim-virtualenv'
Plug 'Chiel92/vim-autoformat'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }


" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go'

"Themes
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'sheerun/vim-wombat-scheme'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'lifepillar/vim-solarized8'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'owickstrom/vim-colors-paramount'
Plug 'fxn/vim-monochrome'

" NERDTree
Plug 'scrooloose/nerdtree'

" SEARCH
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'google/vim-searchindex'

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
set completeopt=longest,menuone
set completeopt+=noselect
" Set to auto read when a file is changed from the outside
set autoread
set title

" With a map leader it's possible to do extra key combinations
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

" split
set splitright
set splitbelow

" set relativenumber
set number
set numberwidth=2
set noundofile
set nocursorcolumn
set undolevels=1000      " use many muchos levels of undo

au FocusGained,BufEnter * checktime
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

" Close a tab
map <leader>tc :tabclose<cr>
map <leader>te :tabedit<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>
" Close/delete buffer
map <C-q> :Bclose<CR>
" next buffer
map <C-l> :bnext<cr>
" Prev buffer
map <C-h> :bprevious<cr>


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => STATUS LINE
 """"""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Format the status line
set statusline+=%#CursorColumn#
set statusline+=\ %F%m%r%h\ %w 
set statusline+=%=       
set statusline+=%{strftime('%H:%M')}
set statusline+=\ 

""""""""""""""""""""""""""""""
" => AIRLINE PLUGIN
" """"""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_a = ''
let g:airline_section_b = '%t'
let g:airline_section_c = '%{strftime("%H:%M")}'
let g:airline_section_x = ''
let g:airline_section_z = ''
let g:airline_section_y = ''
let g:airline_section_gutter = ''
let g:airline_section_warning = ''
let g:airline_section_error = ''
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

cnoreabbrev term terminal
cnoreabbrev git Git

nmap <F8> :TagbarToggle<CR>
nnoremap <f1> :SearchIndex<CR>

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>l :cn<cr>
map <leader>h :cp<cr>"

" Save
map <c-w><c-w> :w<cr>
map <c-w><c-a> :wa<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GIT-FUGITIVE
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-g><c-d> :Gdiff<cr>
map <C-g><c-b> :Gblame<cr>


""""""""""""""""""""""""""""""
" => DEOPLETE
" """"""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20


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

" => JEDI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 1
autocmd FileType python nnoremap <leader>d :call jedi#goto()<CR>
autocmd FileType python nnoremap <C-K> :call jedi#show_documentation()<CR>
autocmd FileType python noremap <F3> :YAPF<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_auto_trigger = 0
let g:ycm_max_num_candidates = 20
" let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
" let g:ycm_filetype_whitelist = {'cpp': 1, 'c': 1}


" => C++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'

""""""""""""""""""""""""""""""
" => GO
" """"""""""""""""""""""""""""""

" let g:go_version_warning = 0
nmap <leader>a :GoAlternate<cr>
autocmd FileType go nnoremap <leader>d :GoDef<CR>
autocmd FileType go nnoremap <C-K> :GoDoc<CR>
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_structs = 1
let g:go_list_height = 0


""""""""""""""""""""""""""""""
" => bufExplorer plugin
" """"""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='nmber'
nnoremap <leader>o :BufExplorer<cr> 

""""""""""""""""""""""""""""""
" => Seach
" """"""""""""""""""""""""""""""
" When you press leader you Rg after the selected text
vnoremap <leader>s :call VisualSelection('s', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" => FuzzyFinder
" """"""""""""""""""""""""""""""


" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-o': 'edit',
  \ 'ctrl-i': 'badd',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }


" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_layout = { 'down': '~20%' }

map <c-a> :Buffers<cr>
map <c-f> :Files<cr>
map <c-i> :Tags<cr>
map <c-r> :Rg 

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


" Hide Status line
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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


function g:Multiple_cursors_before()
 call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
 call deoplete#custom#buffer_option('auto_complete', v:true)
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


" Check Python files with flake8 and pylint.
" Fix Python files with autopep8 and yapf.

let g:ale_fixers = {
      \ 'python': ['yapf']
      \ }

""""""""""""""""""""""""""""""
" => FLAKE
" """"""""""""""""""""""""""""""
let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show


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
let g:onehalf_termcolors=256

colorscheme monochrome
let g:monochrome_italic_comments = 1
set background=dark


""""""""""""""""""""""""""""""
" => INDENT
" """"""""""""""""""""""""""""""
let g:indentLine_char = '¦'
" let g:indentLine_setColors = 1

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
    if a:direction == 's'
        call CmdLine("Rg " . l:pattern . "")
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
    let python2_host='/usr/lib/python2.7'
    let g:python_host_prog =python2_host
    let g:jedi#force_py_version = 2
    let g:vim_isort_python_version ='python2'
    let g:ale_python_flake8_args = '-m flake8'
endfunction

function! SetPython3Host()
     echo 'Running with Python3.7'
     let python3_host='/usr/lib/python3.7'
     let g:python3_host_prog = python3_host
     let g:jedi#force_py_version = 3
     let g:vim_isort_python_version = 'python3.7'
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
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <C-J> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

"""""""""""""""""""""""""""""
" => ULTISNIPPETS
"""""""""""""""""""""""""""""""
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"



" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction





"""""""""""""""""""""""""""""
" => BClose - see it it can come into seperate file.
"""""""""""""""""""""""""""""""
" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>
