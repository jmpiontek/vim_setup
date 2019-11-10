" ---------------------------------------------------

" ---------------------------------------------------

set nocompatible
filetype off
"execute pathogen#infect()

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
" alternatively, pass a path where Vundle should install
" plugins
" call vundle#begin('~/some/path/here')

" Vundle manages vundle plugin
" required!
"Plugin 'gmarik/vundle'


" ---------------------------------------------------
" My Plugins
" ---------------------------------------------------


" buffer bar top emulates tabs
Plug 'bling/vim-airline'

" show/remove trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" shortcuts for commenting code
Plug 'scrooloose/nerdcommenter'

" autopair
Plug 'jiangmiao/auto-pairs'

Plug 'alvan/vim-closetag'

" surround
Plug 'tpope/vim-surround'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Fuzzy finder (CTRL + P)
Plug 'kien/ctrlp.vim'


" ---------------------------------------------------
" Not Currently Installed Plugins
" ---------------------------------------------------


" startup screen with better options
"Plug 'mhinz/vim-startify'
" emmet html shortcuts
" Plug 'mattn/emmet-vim'
"Plug 'elmcast/elm-vim'

"Plug 'romainl/vim-tinyMRU'
" tag list right
"Plugin 'taglist.vim'
" javascript specific
"Plug 'jelera/vim-javascript-syntax'
" rails specific
"Plug 'tpope/vim-rails.git'
" highlight syntax errors
"Plug 'scrooloose/syntastic'
" file navigation
"Plugin 'scrooloose/nerdtree'
" tab completions
"Plug 'ervandew/supertab'
" Dash integration
"Plug 'rizzatti/dash.vim'
" Beautify
"Plug 'maksimr/vim-jsbeautify'
"Plugin 'einars/js-beautify'
"Plug 'Chiel92/vim-autoformat'
"Plug 'tpope/vim-vinegar.git'


" ---------------------------------------------------
" End of Plugins - see commands below for installation
" ---------------------------------------------------


" All of your Plugins must be added before the following line
call plug#end()
"filetype plugin indent on     " required!

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

"syntax on
" ---------------------------------------------------

" Leader Mapped to cd (change directory) used to move
" between buffers and to see buffer list or make new
" buffer - uses airline plugin for buffer management
" ---------------------------------------------------

" set leader to space
let mapleader=' '

" Working with Buffers Instead of Tabs
" See: https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/"

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" Needed for close tag to work
let g:closetag_filenames = "*.html,*.erb,*.rb"

" To open a new empty buffer
" This replaces :tabnew for buffers not tabs
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Close the current buffer without saving and move to
" the previous one
nmap <leader>bQ :bd!

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Close current tab with space tq
nmap <leader>tq <Esc>:tabclose<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <leader><space> :noh<CR>

" Other leaders
" remap control s for saving file
"noremap <silent> <C-s> :update<CR>

"vnoremap <silent> <C-s> <C-C>:update<CR>
"nmap <Silent> <C-s> <Esc>:up<CR>
nnoremap <silent> <C-s> :up<CR>
"inoremap <silent> <C-s> <Esc>:up<CR>
"inoremap <silent> <C-s> <C-o>:up<CR>
" ---------------------------------------------------
"  Explore file listing
"  http://ivanbrennan.nyc/blog/2014/01/16/rigging-vims-netrw/
" ---------------------------------------------------
"noremap <Leader>ls :call VexToggle(getcwd())<CR>
"noremap <Leader>ll :call VexToggle("")<CR>
" set :Explore command to default to tree list style
"let g:netrw_liststyle=3         " thin (change to 3 for tree)
"let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
"nmap <leader>ls <C-w>v<bar><C-w>L<bar>:vertical resize 40<bar>:Explore<CR>
"fun! VexToggle(dir)
  "if exists("t:vex_buf_nr")
    "call VexClose()
  "else
    "call VexOpen(a:dir)
  "endif
"endf

"fun! VexOpen(dir)
  "let g:netrw_browse_split=4 "open files in previous window
  "let vex_width = 40

  "execute "Vexplore" . a:dir
  "let t:vex_buf_nr = bufnr("%")
  "wincmd H

  "call VexSize(vex_width)
"endf

"fun! VexClose()
  "let cur_win_nr = winnr()
  "let target_nr = (cur_win_nr == 1 ? winnr("#") : cur_win_nr)

  "1wincmd w
  "close
  "unlet t:vex_buf_nr

  "execute (target_nr -1) . "wincmd w"
  "call NormalizeWidths()
"endf

"fun! VexSize(vex_width)
  "execute "vertical resize" . a:vex_width
  "set winfixwidth
  "call NormalizeWidths()
"endf

"fun! NormalizeWidths()
  "let eadir_pref = &eadirection
  "set eadirection=hor
  "set equalalways! equalalways!
  "let &eadirection = eadir_pref
"endf

"augroup NetrwGroup
  "autocmd! BufEnter * call NormalizeWidths()
"augroup END


" ---------------------------------------------------
"  Nerd Tree F2
" ---------------------------------------------------

"nmap <F2> :NERDTreeToggle<cr>
"vmap <F2> <esc>:NERDTreeToggle<cr>i
"imap <F2> <esc>:NERDTreeToggle<cr>i

" closes NERDTree when no file is open so that :q will just close vim
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" opens NERDTree even if no file has been selected
" autocmd vimenter * if !argc() | NERDTree | endif

" ----------------------------------------------------
" Tags List F3
" ----------------------------------------------------

" Tags list right
"nnoremap <F3> :TlistToggle<CR>
"let Tlist_Use_Right_Window   = 1

" ----------------------------------------------------
" Autoformat F4
" ----------------------------------------------------

" sets :Autoformat command as F4
noremap <F4> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" ----------------------------------------------------
" Emmet Contol y leader
" ----------------------------------------------------

" emmet leader key is control y
"let g:user_emmet_leader_key = '<C-y>'

" ----------------------------------------------------
" Color Theme
" ----------------------------------------------------

colorscheme distinguished

" ----------------------------------------------------
" Control p ignore files and show hidden
" ----------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
" ignored files for ctrlp and MRU
" MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.tif,*.psd
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" invisible files show in ctrlp
let g:ctrlp_show_hidden = 1
" Open first file in current window and multiple files in hidden buffer
let g:ctrlp_open_multiple_files = '1r'
" control p window size
" top or bottom ttb-> top to bottom bbt -> bottom to top min max and resluts
" in number of lines
let g:ctrlp_match_window = 'top, order:ttb,min:120,max:120,results:20'
" uses nearest ancestor that contains .git as working path
let g:ctrlp_working_path_mode = 'ra'
" ----------------------------------------------------
" set escape from insert mode to jj"
inoremap jk <Esc>
" vnoremap vv <Esc> LEGACY

" ----------------------------------------------------
" add line above and below from normal
" ----------------------------------------------------

" add line above
nmap [<space> O<Esc>j

" add line below
nmap <CR> o<Esc>k

" split line opposite of shift j
nmap <leader>s i<CR><Esc>

" Elm single line comment leader cc from nerdcommenter
" Elm multiple line comment use leader cm from visual mode

" ----------------------------------------------------
" Formatting
" ----------------------------------------------------

" fixes problem with escape key delay when exiting visual
set timeoutlen=1000 ttimeoutlen=0

" indent automatically based upon that of the last line
set autoindent

" smarter indenting for brackets, etc
set smartindent

" linebreak
set wrap linebreak nolist

" add a vertical column guide at column 90
"set colorcolumn=90

" always show this number of lines above/below 
set scrolloff=5

" set line numbers to on
set number

" set indent spacing
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" html does not work in syntastic so you can run it with :SyntasticCheck
let syntastic_mode_map = { 'passive_filetypes': ['html']  }

" ----------------------------------------------------
" Cursor Formatting
" ----------------------------------------------------

" change line hightlight and column highlight
:hi CursorLine cterm=NONE ctermbg=236 

" cursor line highlight is only applied to current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Show syntax highlighting groups for word under cursor
" nmap <C-S-P> :call <SID>SynStack()<CR>

" ----------------------------------------------------
" Javadoc style comments
" ----------------------------------------------------

" add javadoc style comment
" if /* typed next line will act like another comment line
iab <buffer> /// /**^M *^M*/^[0A

" line breaks within comment are auto commented
set formatoptions=c,q,r,t

" ----------------------------------------------------
" Format based on file extensions
" ----------------------------------------------------

" automatic formatting based on extensions
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.jsx :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
au BufRead,BufNewFile *.php set ft=php.html

" ----------------------------------------------------
" Mouse support
" ----------------------------------------------------

" mouse support for resizing panes
" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" change cursor for differnt modes - block cursor when not in insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
" ---------------------------------------------------
" Silver Searcher (brew install the_silver_searcher)
" ---------------------------------------------------
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
"command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" ---------------------------------------------------
"  MRU Config (Using control p MRU instead)
" ---------------------------------------------------
" default directory
"let MRU_File = 'd:\myhome\_vim_mru_files'
" Number of files
"let MRU_Max_Entries = 50
" File types to exclude
"let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
" Match only these patterns
"let MRU_Include_Files = '\.c$\|\.h$'
" MRU window height
"let MRU_Window_Height = 15
" MRU uses current window instead of its own
"let MRU_Use_Current_Window = 1
" Turn off auto close when file is selected
"let MRU_Auto_Close = 0
" Max files in MRU list
"let MRU_Max_Menu_Entries = 20
" Max submenus
"let MRU_Max_Submenu_Entries = 15

" ---------------------------------------------------
" Elm commands
" ---------------------------------------------------
"nnoremap <leader>el :ElmEvalLine<CR>
"vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
"nnoremap <leader>em :ElmMakeCurrentFile<CR>

" ---------------------------------------------------
"  Surround
" ---------------------------------------------------
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"

" compiles current file on write
":au BufWritePost *.elm ElmMakeCurrentFile

" ---------------------------------------------------
" Dash shortcut
" ---------------------------------------------------
":nmap <silent> <leader>d <Plug>DashSearch

" ---------------------------------------------------
" keep syntastic in passive mode - use control-w Shift E for error checking
" ---------------------------------------------------
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" ---------------------------------------------------
" CSS autocomplete
" ---------------------------------------------------
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" ---------------------------------------------------
" Incremental search match as letters are typed after /
" highlight all matches - use space space to remove highlight
" ---------------------------------------------------
:set incsearch
:set hlsearch

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<cr>
    normal 'z
    retab
  endif
endfunction

nmap <leader>tW :cal StripTrailingWhitespace()<cr>

" ---------------------------------------------------
" Beautify commands specific to file types control f
" ---------------------------------------------------
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>gg
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>gg
"autocmd FileType scss noremap <buffer> <c-f> :call CSSBeautify()<cr>gg

" ---------------------------------------------------
" toggle paste and no paste with F5 including status display
" ---------------------------------------------------
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

" ----------------------------------------------------
"  Keep cwd as directory where vim was opened
" ----------------------------------------------------
set noautochdir

if has("gui_running")
  if has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
endif

"remove menu bar, toolbar, right hand scroll, left hand scroll gvim PC
:set guioptions-=m
:set guioptions-=T
:set guioptions-=r
:set guioptions-=L


" ----------------------------------------------------
" Source vimrc on write
" ----------------------------------------------------
"set noro
" source vimrc on save
autocmd bufwritepost .vimrc source $MYVIMRC
