set nocompatible                  " just in case system-wide vimrc has set this otherwise
set hlsearch                      " highlight search strings
set incsearch                     " incremental search ("find as you type")
set ignorecase                    " ignore case when searching
set scrolloff=3                   " begin scrolling before screen ends
set smartcase                     " except when search string includes a capital letter
set number                        " show line numbers in gutter
set autoread                      " if not changed in Vim, automatically pick up changes after 'git co' etc
set guioptions-=T                 " don't show toolbar
set hidden                        " allows you to hide buffers with unsaved changes without being prompted
set history=1000                  " longer search and command history (default is 20)
set wildmode=longest,list         " bash like autocompletion
set langmenu=en_US                " no Polish menu in UTF-8 on Windows

syntax on
filetype plugin indent on

set ruler

" different vimfiles folder at work
if isdirectory('c:/Users/mm21876/vimfiles')
    set runtimepath=c:/Users/mm21876/vimfiles,$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"set background=light
set background=dark
"colors solarized
"colors noctu
"colors mustang

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp1250

"default is "\"
let mapleader = ","
noremap \ ,

" clear out a search
nnoremap <leader><space> :noh<cr>
"map <F4> :set nohls!<CR>:set nohls?<CR>
nnoremap <silent> <C-l> :<C-u>nohls<CR><C-l>

" repeating in Visual Mode
vnoremap . :norm.<CR>

if has("gui_macvim")
    set transparency=2
    set gfn=Menlo\ Regular\ for\ Powerline:h15

    "Switching tabs
    map <D-S-]> gt
    map <D-S-[> gT
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>

    "TextMate identation shortcuts
    nmap <D-[> <<
    nmap <D-]> >>
    vmap <D-[> <gv
    vmap <D-]> >gv

elseif has("gui")
    "default window size
    set lines=50 columns=120
endif

"windows
if !has("unix")
    set gfn=Envy_Code_R_for_Powerline:h12:cEASTEUROPE
    "set guifont=Consolas\ for\ Powerline\ FixedD:h12:cEASTEUROPE
    "set gfn=Consolas:h12:cEASTEUROPE
    "set guifont=Powerline\ Consolas:h12:cEASTEUROPE

    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set diffexpr=MyDiff()
    function MyDiff()
        let opt = ''
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        silent execute '!"'.$VIMRUNTIME.'\diff" -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
    endfunction

    let Tlist_Ctags_Cmd='"'.$VIMRUNTIME.'\ctags"'

    "maksymalizacja okna pod windows
    "au GUIEnter * simalt ~s

    "TextMate identation shortcuts
"    nmap <C-[> <<
"    nmap <C-]> >>
"    vmap <C-[> <gv
"    vmap <C-]> >gv

    nnoremap <kPlus> <C-a>
    nnoremap <kMinus> <C-x>

    nmap <silent> <F8>                        <Plug>FontsizeBegin
    nmap <silent> <SID>DisableFontsizeInc     <Plug>FontsizeInc
    nmap <silent> <SID>DisableFontsizeDec     <Plug>FontsizeDec
    nmap <silent> <SID>DisableFontsizeDefault <Plug>FontsizeDefault

    "http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
    set backupdir=$TEMP,$TMP,.
    set directory=$TEMP,$TMP,.
    if exists("+undofile")
        set undodir=$TEMP,$TMP,.
    endif
    "set backupdir=$VIMRUNTIME\\temp\\
    "set directory=$VIMRUNTIME\\temp\\

    " no artifacts
    "set nobackup       "no backup files
    set nowritebackup  "only in case you don't want a backup file while editing
    "set noswapfile     "no swap files
    "set noundofile     "no multisession undo file

    if has("gui")
        "au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 240)
        "nmap <F11> :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
    else
        set fillchars+=stl:\ ,stlnc:\ 
        set term=xterm
        set t_Co=256
        let &t_AB="\e[48;5;%dm"
        let &t_AF="\e[38;5;%dm"
    endif
endif

"let g:airline_theme='powerlineish'
let g:airline_theme='gruvbox'
"let g:airline_theme='solarized'

if has("unix") || has("gui")
    let g:airline_powerline_fonts=0

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.whitespace = 'Ξ'
endif

" tabs & indentation
set tabstop=4                     " spaces per tab
set smarttab                      " <tab>
set shiftwidth=4                  " spaces per tab (when shifting)
set expandtab                     " always use spaces instead of tabs
"set sts=4
set autoindent
set cindent
"set backspace=start,indent
"set nosta

nmap <silent> <F5> :set noexpandtab!<CR>:set noexpandtab?<CR>

" This will disable the arrow keys while you're in normal mode to
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
" Arrow keys in visual mode
vnoremap <Left> h
vnoremap <Right> l
vnoremap <Up> k
vnoremap <Down> j
" Movement by screen line
nnoremap j gj
nnoremap k gk
" Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"http://vim.wikia.com/wiki/Moving_lines_up_or_down
if has("unix")
    nnoremap ∆ :m .+1<CR>==
    nnoremap Ż :m .-2<CR>==
    inoremap ∆ <Esc>:m .+1<CR>==gi
    inoremap Ż <Esc>:m .-2<CR>==gi
    vnoremap ∆ :m '>+1<CR>gv=gv
    vnoremap Ż :m '<-2<CR>gv=gv
else
    nnoremap <M-j> :m .+1<CR>==
    nnoremap <M-k> :m .-2<CR>==
    "inoremap <M-j> <Esc>:m .+1<CR>==gi
    "inoremap <M-k> <Esc>:m .-2<CR>==gi
    vnoremap <M-j> :m '>+1<CR>gv=gv
    vnoremap <M-k> :m '<-2<CR>gv=gv
endif

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on

    " disable auto wrap (see :help fo-table)
    au FileType * setlocal formatoptions-=t formatoptions-=c

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType python setlocal expandtab
    autocmd FileType cpp setlocal noexpandtab
    autocmd FileType cs setlocal noexpandtab
    autocmd FileType mxml setlocal noexpandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
    au BufNewFile,BufRead *.mxml set filetype=mxml
    au BufNewFile,BufRead *.as set filetype=actionscript

    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
    " csharp
    au FileType cs set omnifunc=syntaxcomplete#Complete
    "au FileType cs set foldmethod=marker
    "au FileType cs set foldmarker={,}
    "au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
    "au FileType cs set foldlevel=99

    " python
    function! RunPython()
        execute ':!python ' . expand('%:p')
    endfunction
    command! -complete=command RunPython call RunPython()
    autocmd FileType python :map <D-r> :RunPython<CR>
endif

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
"strip out trailing whitespace
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
"indentation
nmap _= :call Preserve("normal gg=G")<CR>

"show whitespace
nmap <leader>l :set list!<CR>
set list                          " show whitespace

if has("unix")
    set lcs=tab:▸\ ,trail:·
else
    set lcs=tab:»\ ,trail:·
endif
"hi SpecialKey guifg=black
"hi SpecialKey guifg=darkgrey
"hi NonText guifg=black

"cursor colors
hi Cursor guibg=darkred
hi iCursor guibg=darkred
hi Cursor guifg=NONE
hi iCursor guifg=NONE

"statusline
set laststatus=2
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c,%o%V%)\ %P

"integracja z xcode
if has("gui_macvim")
    " update the :make command to tell Xcode to build
    set makeprg=osascript\ -e\ \"tell\ application\ \\\"Xcode\\\"\"\ -e\ \"build\"\ -e\ \"end\ tell\"

    function! XcodeClean()
        silent execute ':!osascript -e "tell application \"Xcode\"" -e "Clean" -e "end tell"'
    endfunction
    command! -complete=command XcodeClean call XcodeClean()

    function! XcodeDebug()
        silent execute '!osascript -e "tell application \"Xcode\"" -e "Debug" -e "end tell"'
    endfunction
    command! -complete=command XcodeDebug call XcodeDebug()

    " Command-K cleans the project
    :noremap <D-k> :XcodeClean<CR>
    " Command-Return Starts the program in the debugger
    :noremap <D-CR> :XcodeDebug<CR>

    " ctags
    let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

    " ,e -- edit file, starting in same directory as current file
    map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
endif

if has("unix")
    " http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
    command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
    function! s:RunShellCommand(cmdline)
        echo a:cmdline
        let expanded_cmdline = a:cmdline
        for part in split(a:cmdline, ' ')
         if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
         endif
        endfor
        botright new
        setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
        call setline(1, 'You entered:    ' . a:cmdline)
        call setline(2, 'Expanded Form:  ' .expanded_cmdline)
        call setline(3,substitute(getline(2),'.','=','g'))
        execute '$read !'. expanded_cmdline
        setlocal nomodifiable
        1
    endfunction

    " Swift support from http://marcelgruenauer.com/2014/06/06/swift_tips_and_tricks/
    au BufRead,BufNewFile *.swift setfiletype swift
    au FileType swift call FileType_Swift()

    function! FileType_Swift()
        if exists("b:did_ftswift") | return | endif
        let b:did_ftswift = 1

        nnoremap <buffer> <Leader>sw :Shell xcrun swift -i %
    endfunction
endif

"Buffer next,previous (ctrl-{n,p})
:noremap <C-N> :bn<CR>
:noremap <C-P> :bp<CR>
"Buffer delete (ctrl-d)
:noremap <C-D> :bd<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" bufexplorer
"map <F4> :BufExplorer<CR>

" Easy Expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"FuzzyFinder
map <leader>F :FufFile<CR>
map <leader>f :FufFileWithCurrentBufferDir<CR>
map <leader>d :FufDir<CR>
map <leader>b :FufBuffer<CR>

let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 1000
let g:fuf_mrucmd_maxItem = 400
let g:fuf_mrufile_exclude = '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/)'

"NERD_tree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"taglist
map <leader>t :TlistToggle<CR>
"ctags
map <C-F12> :silent !ctags -R --sort=yes --exclude="bin" --extra=+fq --fields=+ianmzS --c\#-kinds=cimnp

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

set ww=h,l,<,>,[,]                " allow h/l/left/right to cross line boundaries

let g:NumberToggleTrigger="<F4>"

if exists("&colorcolumn")
    "set colorcolumn=85
    let &colorcolumn=join(range(85,999),",")
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    let &colorcolumn="80,".join(range(120,999),",")
endif

call pathogen#infect()

let g:gruvbox_bold=0
colors gruvbox
