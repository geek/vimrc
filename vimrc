" Bundle structure powered by Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" -----------------------------------------------------------------------------  
" |                              General                                      |
" -----------------------------------------------------------------------------  

set nocompatible
set ignorecase
set smartcase
set nu
set ruler
set wildmenu
set history=1000    "store lots of :cmdline history
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
" set to auto read when a file is changed from the outside
set autoread

" Indenting -------------------------------------------------------------------
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)

" Scrollbars ------------------------------------------------------------------
set sidescrolloff=2
set numberwidth=4
set scrolloff=3
" set sidescrolloff=7
" set sidescroll=1

" Windows ---------------------------------------------------------------------
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

" Cursor highlights -----------------------------------------------------------
"set cursorline
"set cursorcolumn

" Searching -------------------------------------------------------------------
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

" Colors ----------------------------------------------------------------------
set t_Co=256 " 256 colors
set background=dark 
syntax on " syntax highlighting
colorscheme monokai

" Line Wrapping ---------------------------------------------------------------
set nowrap
set linebreak  " Wrap at word

" Mappings --------------------------------------------------------------------
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @

" bind command-/ to toggle comment
nmap <D-/> ,c<space>
vmap <D-/> ,c<space>
imap <D-/> <C-O>,c<space>

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" window splitting mappings
" split vertically with <leader> v
" split horizontally with <leader> s
nmap ,v :vsplit<CR> <C-w><C-w>
nmap ,s :split<CR> <C-w><C-w>

" Make it way easier to switch windows (,w)
nmap ,w <C-w><C-w>_
" save
map ,s :w<CR>
" exit vim without saving any changes
map ,q :q<CR>

" fullscreen toggle with F11
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

map <F5> <Esc>:se guioptions=m<CR>

" Fast split movement
set wmh=0
map <c-j> <c-w>j
map <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Directories -----------------------------------------------------------------
" Setup backup location and enable
" set backupdir=~/.backup/vim
set nobackup

" Set Swap directory
" set directory=~/.backup/vim/swap

" Sets path to directory buffer was loaded from
autocmd BufEnter * lcd %:p:h

" File Stuff ------------------------------------------------------------------
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml 

" Inser New Line --------------------------------------------------------------
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)

" Misc ------------------------------------------------------------------------
set backspace=indent,eol,start
" set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Sessions --------------------------------------------------------------------
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Invisible characters ---------------------------------------------------------
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars

" Mouse -----------------------------------------------------------------------
set mouse=a " Enable the mouse
set ttymouse=xterm2
"behave xterm
"set selectmode=mouse

" Cursor Movement -------------------------------------------------------------
" Make cursor move by visual lines instead of file lines (when wrapping)
" map <up> gk
" map k gk
" imap <up> <C-o>gk
" map <down> gj
" map j gj
" imap <down> <C-o>gj
" map E ge


" indent settings --------------------------------------------------------------
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings --------------------------------------------------------------
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces

set formatoptions-=o "dont continue comments when pushing o/O

"hide buffers when not displayed
set hidden


" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

let $VIMFILES = '$HOME/.vim'

" Mac -------------------------------------------------------------------------
"if has("mac") 
  "" 
"endif
 
" Windows ---------------------------------------------------------------------
if has("gui_win32")
  let $VIMFILES = '$HOME/vimfiles'
endif


" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

" NERDTree --------------------------------------------------------------------
" Nerd Tree on right
let NERDTreeWinPos = 'right'

" Open nerd tree with ,n
:noremap ,n :NERDTreeToggle<CR>

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1

" Single click for everything
let NERDTreeMouseMode=1

let NERDTreeChDirMode=2 "change working dir as root changed
let NERDTreeSplitVertical=1 "vsplit


" fuzzyfinder_textmate --------------------------------------------------------
map ,f :FuzzyFinderTextMate<CR>
map ,g :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db;.dll'
let g:fuzzy_matching_limit=60 " this seems to help performance
let g:fuzzy_ceiling=20000     " I have some projects with a lot of files...

" markdown stuff --------------------------------------------------------------
"markdown stuff
augroup mkd
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END
map <leader>x :w!<CR>:!perl $VIMFILES/markdown/perl/markdown.pl % > %.html && open %.html<CR><CR> 

" -----------------------------------------------------------------------------  
" |                               Status Line Setup                           |
" -----------------------------------------------------------------------------  

set statusline=%f       "tail of the filename
"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
set statusline+=%{StatuslineTrailingSpaceWarning()}
"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2
"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction


" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
autocmd VimEnter * exe 'NERDTree' | wincmd l 
autocmd VimEnter * exe 'normal ,w'

" -----------------------------------------"
if has("gui")
    source $VIMFILES/gvimrc
endif
