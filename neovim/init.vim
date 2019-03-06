call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'farmergreg/vim-lastplace'


" C family
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all', 'for':'ccp'}
Plug 'zchee/deoplete-clang', {'for':'ccp'}

" Async linter
Plug 'w0rp/ale'

" " JSON
" Plug 'elzr/vim-json', {'for': 'json'}

" Commentings
Plug 'tpope/vim-commentary'

Plug 'dkprice/vim-easygrep'


" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" Ctags
Plug 'majutsushi/tagbar' 
Plug 'craigemery/vim-autotag'

" zenmode
Plug 'junegunn/goyo.vim'

" Icons
Plug 'ryanoasis/vim-devicons'
" Buffer
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

" Tabular - text alignment
Plug 'ervandew/supertab'
Plug 'junegunn/limelight.vim'
" Python
Plug 'fisadev/vim-isort', { 'for': 'python' }

Plug 'davidhalter/jedi-vim', {'for': 'python' }

Plug 'zchee/deoplete-jedi', { 'for': 'python' }

Plug 'python-rope/ropevim', { 'for': 'python' }

Plug 'plytophogy/vim-virtualenv'

Plug 'google/yapf', { 'rtp': 'plugins/vim'}

" Indentline
Plug 'Yggdroot/indentLine'


" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'zchee/deoplete-go'

"Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'fxn/vim-monochrome'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'

" SEARCH
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'google/vim-searchindex'


" Easy motiom
Plug 'easymotion/vim-easymotion'

" Multiple cursors 
Plug 'terryma/vim-multiple-cursors'

"Snippets
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Surrond
Plug 'tpope/vim-surround'


" Initialize plugin system
call plug#end()
" Lists

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

" Workspace
set exrc

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

" set relativenumber
set number
set numberwidth=2
set noundofile
set nocursorcolumn

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" let syntax_list = ['python', 'go']
" autocmd BufWrite,BufRead * if index(syntax_list, &ft) > -1 | set syntax=off | else | set syntax=on |
autocmd BufWrite,BufRead * set syntax=off

" Set updatetime - Used with tagbar
set updatetime=2000

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
set laststatus=0
set showtabline=0
" Format the status line
set statusline+=%#CursorColumn#
set statusline+=\ %F%m%r%h\ %w 
set statusline+=%=       
set statusline+=%{strftime('%H:%M')}
set statusline+=\ 


" => Buffer LINE
 """"""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#fnamemod=':t'

" Removes statusline/
au VimEnter * set laststatus=0


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
" => CUSTOM SHORTCUTS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Peek the view. It splits the screen and shows the called funtion
map <leader>p :split<cr><leader>d


nmap <F1> :call AddSyntax()<CR>
nmap <F2> :call RemoveSyntax()<CR>
nmap <F3> :Limelight<CR>
nmap <F4> :Limelight!<CR>
nnoremap <F5> :SearchIndex<CR>
nmap <F8> :TagbarToggle<CR>


map <leader>cc :botright cope<cr>
map <leader>l :cn<cr>
map <leader>h :cp<cr>"

" Save
map <c-w><c-w> :w<cr>
map <c-w><c-a> :wa<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GIT-FUGITIVE
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-g><c-d> :Gvdiff<cr>
map <C-g><c-b> :Gblame<cr>

command! Gstatus call LazyLoadFugitive('Gstatus')
command! Gvdiff call LazyLoadFugitive('Gvdiff')
command! Glog call LazyLoadFugitive('Glog')
command! Gblame call LazyLoadFugitive('Gblame')

function! LazyLoadFugitive(cmd)
  call plug#load('vim-fugitive')
  call fugitive#detect(expand('%:p'))
  exe a:cmd
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Limelight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 242

let g:limelight_default_coefficient = 1

" let whitelist = ['python', 'go']
" autocmd FileType * if index(whitelist, &ft) > -1 | Limelight | else |  Limelight! |



""""""""""""""""""""""""""""""
" => DEOPLETE
" """"""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20

""""""""""""""""""""""""""""""
" => PYTHON
" """"""""""""""""""""""""""""""
let python_highlight_all = 1
augroup PythonCustomization
	:autocmd FileType python syn match pythonStatement "\(\W\|^\)\@<=self\([\.,)]\)\@="
	:autocmd FileType python syn keyword pythonDecorator True None False self
	:autocmd FileType python map <buffer> <leader>1 /class 
	:autocmd FileType python map <buffer> <leader>2 /def 
	:autocmd FileType python map <buffer> <leader>C ?class 
	:autocmd FileType python map <buffer> <leader>D ?def 
	:autocmd FileType python set cindent
	:autocmd FileType python set cinkeys-=0#
	:autocmd FileType python set indentkeys-=0#
	:autocmd FileType python vmap <leader>f :YAPF<CR>
	:autocmd FileType python nmap <leader>f :YAPF<CR>
augroup END

let g:ale_python_flake8_args = '-m flake8'
" highlight python self, when followed by a comma, a period or a parenth

function! SetPython2Host()
    echo 'Running with Python2.7'
    let python2_host='/usr/bin/python2.7'
    let g:python_host_prog =python2_host
    let g:jedi#force_py_version = 2
    let g:vim_isort_python_version ='python2'
endfunction

function! SetPython3Host()
     echo 'Running with Python3.7'
     let python3_host='/usr/bin/python3.7'
     let g:python3_host_prog = python3_host
     let g:jedi#force_py_version = 3
     let g:vim_isort_python_version = 'python3'
endfunction

let g:virtualenv_directory = '/home/$USER/.pyenv/versions'

" => JEDI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 1
augroup JediCustomization
	:autocmd FileType python nnoremap <leader>d :call jedi#goto()<CR>
	:autocmd FileType python nmap <S-K> :call jedi#show_documentation()<CR>
augroup END


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
augroup GoCustomization
	:autocmd FileType go nnoremap <leader>d :GoDef<CR>
	:autocmd FileType go nmap <S-K> :GoDoc<CR>
augroup END
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_structs = 1
let g:go_list_height = 0
let g:go_fmt_fail_silently = 1


""""""""""""""""""""""""""""""
" => Search and Replace
" """"""""""""""""""""""""""""""
map <SPACE> /
nnoremap <ESC> :call DisabledHighlight()<return><ESC>
xnoremap <C-S> :call VisualSelection('s', '')<CR>
xnoremap <C-R> :call VisualSelection('r', '')<CR>
nnoremap <silent> <C-Space> :let @/=expand('<cword>') <bar> set hls <cr>: SearchIndex<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" nnoremap <C-R> viw"hy:%s/<C-R>h//gc<left><left><left>

" => FuzzyFinder
" """"""""""""""""""""""""""""""
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

nmap <C-A> :Buffers<cr>
nmap <C-F> :Files<cr>
nmap <C-T> :Tags<cr>
nmap <C-S> :Rg 

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Terminal mode:
tnoremap <c-w><c-h> <c-\><c-n><c-w>h
tnoremap <c-w><c-j> <c-\><c-n><c-w>j
tnoremap <c-w><c-k> <c-\><c-n><c-w>k
tnoremap <c-w><c-l> <c-\><c-n><c-w>l

tnoremap <c-w><c-w> <c-\><c-n>
tnoremap <c-Space> <c-\><c-n>
nmap <c-t><c-t> :vsplit+terminal<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-MULTIPLE-CURSORS
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_start_word_key='<C-b>'
let g:multi_cursor_next_key="<C-b>"
let g:multi_cursor_prev_key="<C-n>"


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
" let g:zenesque_colors=2
colorscheme nord
let g:airline_theme='nord'
set background=dark


function! AddSyntax()
	set syntax=on
endfunction
function! RemoveSyntax()
	set syntax=off
endfunction

""""""""""""""""""""""""""""""
" => INDENT
" """"""""""""""""""""""""""""""
let g:indentLine_char = '¦'
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
    endif
    if a:direction == 'r'
        call CmdLine("%s/" . l:pattern . "//gc<LEFT><LEFT><LEFT>")
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
