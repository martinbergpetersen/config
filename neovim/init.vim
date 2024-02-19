call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'farmergreg/vim-lastplace'


Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'OmniSharp/omnisharp-vim'

" Async linter
Plug 'w0rp/ale'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'commit': '776b509f80dd49d8205b9b0d94485568236d1192' }
Plug 'jackMort/ChatGPT.nvim'
" " JSON
" Plug 'elzr/vim-json', {'for': 'json'}

" Commentings
Plug 'tpope/vim-commentary'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'


Plug 'dkprice/vim-easygrep'

Plug 'vim-scripts/diffchanges.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'


" NerdTree
Plug 'preservim/nerdtree'


" Ctags
Plug 'majutsushi/tagbar' 

" Python
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'ambv/black', { 'for': 'python' }
"
" Go
Plug 'fatih/vim-go'

" Theme
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'huyvohcmc/atlas.vim'
Plug 'altercation/vim-colors-solarized'

Plug 'plytophogy/vim-virtualenv'


" Indentline
Plug 'Yggdroot/indentLine'

" " SEARCH
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'google/vim-searchindex'

" Easy motiom
Plug 'easymotion/vim-easymotion'

" Limelight
Plug 'junegunn/limelight.vim'

" Multiple cursors 
Plug 'terryma/vim-multiple-cursors'

"Snippets
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Surrond
Plug 'tpope/vim-surround'

Plug 'tpope/vim-dadbod'
"
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }


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

set shortmess=a
" set inccommand=nosplit

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Workspace
set exrc

" Ignore case when searching
set ignorecase

set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*node_modules*,*lock.json

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
" Use of spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab


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

map <C-k><C-k> :move -2<cr>
map <C-j><C-j> :move +1<cr>

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
" autocmd VimEnter,BufRead,BufWrite * set laststatus=0
set showtabline=2
" " Format the status line
" set statusline+=%#CursorColumn#
" set statusline+=\ %F%m%r%h\ %w 
" set statusline+=%=       
" set statusline+=%{strftime('%H:%M')}
" set statusline+=\ 

" => Buffer LINE
 """"""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_theme='raven'
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
map <leader>ev :e! ~/.myconfig/neovim/init.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CUSTOM KEYBINDINGS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" inoremap <esc> <nop>
"
nnoremap <leader>cd :cd %:h<cr>

" Peek the view. It splits the screen and shows the called funtion
" map <leader>p :split<cr><leader>d

inoremap <C-A> <C-U>
" Exit insert mode
inoremap jk <ESC>

nnoremap <F5> :SearchIndex<CR>
nnoremap <F8> :TagbarToggle<CR>


map <leader>cc :botright cope<cr>
map <leader>l :cn<cr>
map <leader>h :cp<cr>"

" Save
map <c-w><c-w> :w<cr>
map <c-w><c-a> :wa<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GIT-FUGITIVE
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-g><c-d> :Gvdiffsplit<cr>
nnoremap <C-g><c-s> :Gvdiffsplit main<cr>
nnoremap <C-g><c-b> :Git blame<cr>
nnoremap <C-g><c-f> :vertical Git log -p %<cr>

""""""""""""""""""""""""""""""
" => YAML
" """"""""""""""""""""""""""""""
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

""""""""""""""""""""""""""""""
" => JSON
" """"""""""""""""""""""""""""""
let g:indentLine_setConceal = 0


""""""""""""""""""""""""""""""
" => C#
" """"""""""""""""""""""""""""""


" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winblend': 30,
  \ 'winhl': 'Normal:Normal,FloatBorder:ModeMsg',
  \ 'border': 'rounded'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0],
  \ 'border': [1],
  \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
  \ 'borderhighlight': ['ModeMsg']
  \}
endif
" }}}

let g:OmniSharp_server_use_net6 = 1
augroup CSharpCustomization
	:autocmd FileType cs nnoremap <buffer> <leader>f :OmniSharpCodeFormat<CR>
	:autocmd FileType cs nnoremap <buffer> <leader>d :OmniSharpGotoDefinition<CR>
	:autocmd FileType cs nnoremap <buffer> <leader>i :OmniSharpFindImplementations<CR>
	:autocmd FileType cs nnoremap <buffer> <leader>p :OmniSharpPreviewDefinition<CR>
	:autocmd FileType cs nnoremap <buffer> <leader>or :OmniSharpRestartServer<CR>
	:autocmd FileType cs nnoremap <buffer> K :OmniSharpDocumentation<CR>
	:autocmd FileType cs nnoremap <buffer> <leader>a :OmniSharpGetCodeAction<CR>
	:autocmd FileType cs nnoremap <buffer> <leader>as :ALENext<CR>
	:autocmd FileType cs nnoremap <buffer> <leader>ad :ALEPrevious<CR>
augroup END
""""""""""""""""""""""""""""""
" => Go
" """"""""""""""""""""""""""""""
let g:go_doc_keywordprg_enabled = 0 " Disable go_doc
let g:go_fmt_autosave = 0
augroup GoCustomization
	:autocmd FileType go nnoremap <leader>f :GoFmt<CR>
augroup END
""""""""""""""""""""""""""""""
" => Javascript, css, html
" """"""""""""""""""""""""""""""
augroup JavascriptCustomization
	:autocmd FileType javascript,html,css,json nnoremap <buffer> <leader>s :call CocAction('runCommand', 'tsserver.organizeImports')<CR>
augroup END
""""""""""""""""""""""""""""""
" => Java
" """"""""""""""""""""""""""""""
augroup JavaCustomization
	:autocmd FileType java nnoremap <buffer> <leader>s :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
	:autocmd FileType java nnoremap <buffer> <leader>c :CocCommand<CR>
	:autocmd FileType java nmap <leader>a <Plug>(coc-codeaction-cursor)
	:autocmd FileType java nnoremap <buffer> <leader>or :CocRestart<CR>
	:autocmd FileType java :ALEDisable
augroup END
"
""""""""""""""""""""""""""""""
" => Javascript
" """"""""""""""""""""""""""""""
augroup JavascriptCustomization
	:autocmd FileType javascript nnoremap <buffer> <leader>as :ALENext<CR>
	:autocmd FileType javascript nnoremap <buffer> <leader>ad :ALEPrevious<CR>
augroup END
""""""""""""""""""""""""""""""
" => PYTHON
" """"""""""""""""""""""""""""""
let python_highlight_all = 1
augroup PythonCustomization
	:autocmd FileType python set cindent
	:autocmd FileType python set cinkeys-=0#
	:autocmd FileType python set indentkeys-=0#
	:autocmd FileType python nnoremap <leader>s :Isort<CR>
    :autocmd FileType python :ALEDisable
	:autocmd FileType python nnoremap <buffer> <leader>f :Black<CR>
augroup END



let g:virtualenv_directory = '/home/$USER/.pyenv/versions'
let python3_host='~/.pyenv/versions/neovim3/bin/python3'
let g:python3_host_prog = python3_host


""""""""""""""""""""""""""""""
" => Search and Replace
" """"""""""""""""""""""""""""""
map <SPACE> /
nnoremap <C-J> :call DisabledHighlight()<return><ESC>
xnoremap <C-S> :call VisualSelection('s', '')<CR>
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
let g:fzf_preview_window = ''

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_layout = { 'down': '~40%' }

nnoremap <C-B> :Buffers<cr>
nnoremap <C-F> :Files<cr>
nnoremap <C-T> :Tags<cr>
nnoremap <C-S> :Rg<space>

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
nnoremap <c-t><c-t> :split+terminal<CR><c-w>r


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
let g:ale_linters = {'python': ['flake8'], 'cs': ['OmniSharp']}
let g:ale_fixers = {'python': ['black']}
let g:ale_virtualtext_cursor=0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

highlight clear ALEWarningSign
" sets ale to use python3 for flake
" highlight clear ALEWarningSign
" nnoremap <leader>ad :ALENext<CR>
" nnoremap <leader>as :ALEPrevious<CR>

""""""""""""""""""""""""""""""
" => COLOR/THEMES
" """"""""""""""""""""""""""""""
colorscheme atlas
set background=dark

""""""""""""""""""""""""""""""
" => NerdTree
" """"""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
let NERDTreeRespectWildIgnore=1
let NERDTreeWinSize=50
let NERDTreeIgnore = ['obj', 'tags', '__pycache__', 'bin', 'target']

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
        execute "Rg " . l:pattern . ""
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
" inoremap <expr> <C-j> ("\<C-n>")
" inoremap <expr> <C-k> ("\<C-p>")

""""""""""""""""""""""""""""""
"" => ULTISNIPPETS
""""""""""""""""""""""""""""""""
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""
" => BufferClose
"""""""""""""""""""""""""""""""
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



"""""""""""""""""""""""""""""
" => SpellSuggest.
"""""""""""""""""""""""""""""
autocmd FileType gitcommit,markdown setlocal spell

"""""""""""""""""""""""""""""
" => ChatGPT.
lua require('chatgpt').setup()

nnoremap <C-g><C-j> :ChatGPT<space><CR>
nnoremap <C-g><C-e> :ChatGPTEditWithInstructions<space><CR>
nnoremap <C-g><C-r> :ChatGPTRun<space>
"""""""""""""""""""""""""""""
" => Coc-settings.
"""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-prettier', 'coc-snippets', 'coc-yaml', 'coc-go', 'coc-java', 'coc-json', 'coc-xml', 'coc-tsserver', 'coc-sh', 'coc-pyright', 'coc-html', 'coc-docker', 'coc-ltex', 'coc-sql']

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-b>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Remap keys for gotos
nmap <silent><leader>d <Plug>(coc-definition)
nmap <silent><leader>w :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Map jump to next error
nmap <silent> <leader>as <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ad <Plug>(coc-diagnostic-next)

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
nmap <leader>f <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


"
""""""""""""""""""""""""""""""
" => COLOR/THEMES
" """"""""""""""""""""""""""""""
colorscheme atlas
set background=dark


if empty(mapcheck('<C-e>', 'i'))
  inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#confirm() : "\<C-e>"
endif
if empty(mapcheck('<C-j>', 'i'))
  inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
endif
if empty(mapcheck('<C-k>', 'i'))
  inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
endif
autocmd! User GoyoLeave source $HOME/.myconfig/neovim/init.vim
"
" hi DiffAdd    cterm=bold ctermfg=10 ctermbg=17 guibg=none guifg=Green
" hi DiffDelete cterm=bold ctermfg=10 ctermbg=17 guibg=none guifg=Red
" hi DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=orange guibg=None
" hi DiffText   cterm=bold ctermfg=223 ctermbg=88 gui=none guifg=white guibg=White

hi DiffAdd      ctermfg=NONE guibg=darkgreen ctermbg=Green guifg=White
hi DiffChange   ctermfg=NONE guibg=darkblue ctermbg=Green guifg=White
hi DiffDelete   ctermfg=NONE guibg=NONE ctermbg=Red guifg=Red
hi DiffText     ctermfg=NONE  guibg=White ctermbg=NONE guifg=darkcyan
hi Comment guifg=lightgreen ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight LineNr guifg=White
hi Pmenu ctermbg=gray guibg=black guifg=white
highlight vertsplit guifg=fg guibg=bg
highlight SignColumn guibg=None
hi Comment guifg=lightgreen ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad cterm=underline ctermfg=red gui=undercurl
highlight CocUnusedHighlight cterm=underline  gui=underline guibg=NONE guifg=red
