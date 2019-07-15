call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'farmergreg/vim-lastplace'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Async linter
Plug 'w0rp/ale'

" " JSON
" Plug 'elzr/vim-json', {'for': 'json'}

" Commentings
Plug 'tpope/vim-commentary'

Plug 'dkprice/vim-easygrep'

Plug 'vim-scripts/diffchanges.vim'

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
" Tabular - text alignment
Plug 'ervandew/supertab'
"
" Python
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'python-rope/ropevim', { 'for': 'python' }
Plug 'google/yapf', { 'rtp': 'plugins/vim'}

" Theme
Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

Plug 'plytophogy/vim-virtualenv'


" Indentline
Plug 'Yggdroot/indentLine'

" SEARCH
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'google/vim-searchindex'

" Easy motiom
Plug 'easymotion/vim-easymotion'

" Multiple cursors 
Plug 'terryma/vim-multiple-cursors'

"Snippets
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

set number
set numberwidth=2
set noundofile
set nocursorcolumn

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
syntax off
" Use of spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

autocmd BufRead,VimEnter * syntax off


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC settings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You will have bad experience for diagnostic messages when it's default 4000.

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

set cmdheight=2

set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set nowritebackup

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
" never how the status line
autocmd VimEnter,BufRead,BufWrite * set laststatus=0
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
" => CUSTOM KEYBINDINGS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Peek the view. It splits the screen and shows the called funtion
map <leader>p :split<cr><leader>d

inoremap <C-A> <C-U>
" Exit insert mode
inoremap jj <ESC>

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

" command! Gstatus call LazyLoadFugitive('Gstatus')
" command! Gvdiff call LazyLoadFugitive('Gvdiff')
" command! Glog call LazyLoadFugitive('Glog')
" command! Gblame call LazyLoadFugitive('Gblame')

" function! LazyLoadFugitive(cmd)
"   call plug#load('vim-fugitive')
"   call fugitive#detect(expand('%:p'))
"   exe a:cmd
" endfunction

""""""""""""""""""""""""""""""
" => PYTHON
" """"""""""""""""""""""""""""""
let python_highlight_all = 1
augroup PythonCustomization
	:autocmd FileType python set cindent
	:autocmd FileType python set cinkeys-=0#
	:autocmd FileType python set indentkeys-=0#
	:autocmd FileType python nmap <leader>s :Isort<CR>
	:autocmd FileType python nmap <leader>f :YAPF<CR>
	:autocmd FileType python xmap <leader>f :YAPF<CR>
augroup END

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


""""""""""""""""""""""""""""""
" => Search and Replace
" """"""""""""""""""""""""""""""
map <SPACE> /
nnoremap <C-J> :call DisabledHighlight()<return><ESC>
xnoremap <C-S> :call VisualSelection('s', '')<CR>
xnoremap <C-R> :call VisualSelection('r', '')<CR>
nnoremap <silent> <C-Space> :let @/=expand('<cword>') <bar> set hls <cr>: SearchIndex<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" => FuzzyFinder
" """"""""""""""""""""""""""""""
let g:fzf_action = {
  \ 'ctrl-space': 'edit',
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

nmap <C-B> :Buffers<cr>
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
nmap <c-t><c-t> :split+terminal<CR><c-w>r


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-MULTIPLE-CURSORS
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_start_word_key='<C-c>'
let g:multi_cursor_next_key="<C-c>"
let g:multi_cursor_prev_key="<C-v>"


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
let g:ale_lint_on_enter = 1
let g:ale_linters = {'python': ['flake8']}

highlight clear ALEWarningSign
" sets ale to use python3 for flake
" highlight clear ALEWarningSign
nnoremap <leader>ad :ALENext<CR>
nnoremap <leader>as :ALEPrevious<CR>

""""""""""""""""""""""""""""""
" => COLOR/THEMES
" """"""""""""""""""""""""""""""
colorscheme nord
let g:airline_theme='nord'
set background=dark
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

 """""""""""""""""""""""""""""
 " => GOYO - ZENMODE
 """"""""""""""""""""""""""""""
 let g:goyo_width = '100%'
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
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips', 'UltiSnips']






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

autocmd FileType gitcommit,markdown setlocal spell
nnoremap <silent><F7> :cal SpellSuggest()<CR>
function! SpellSuggest()
  let s = substitute(system("echo ".expand("<cword>")." | aspell -a -W2 | grep '^&'"), "^.*:\\s\\(.*\\)\\n", "\\1,", "")
  if s != ""
    let slength = strlen(s)
    let end = 0
    let i = 0
    while end != slength
      let i = i + 1
      let w = matchstr(s, "^\\%(.\\{-}\\zs[^ ,]\\+\\ze,\\)\\{".i."}")
      echon "(".i.")".w." "
      let end = matchend(s, w.",")
    endwhile
    echo ""
    let c = input("Replace with: ")
    if c =~ "^[1-9]\\d*$" && c > 0 && c <= i
      execute "normal! ciw".matchstr(s, "^\\%(.\\{-}\\zs[^ ,]\\+\\ze,\\)\\{".c."}")
    endif
  else
    echo "No suggestions"
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent><leader>d <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
