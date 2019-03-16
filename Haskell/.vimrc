set nocompatible              " be iMproved, required
" runtime! ~/.vim/config/vim_folding.vim
filetype off                  " required


""""""""""""""
"  vundle    "
""""""""""""""
"" startup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"" filepath plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

""syntax and coloring
Plugin 'flazz/vim-colorschemes'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'luochen1990/rainbow'
Plugin 'bronson/vim-trailing-whitespace'

"" error checking
Plugin 'scrooloose/syntastic'
"plugin 'neomake/neomake'

" various
" plugin 'garbas/vim-snipmate' " ultasnips ? xptemplates
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'qpkorr/vim-bufkill'

Plugin 'whatyouhide/vim-lengthmatters'
"" language plugins

" lua
Plugin 'tbastos/vim-lua'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'

" haskell
Plugin 'neovimhaskell/haskell-vim'

" other
" plugin 'jplaut/vim-arduino-ino'
Plugin 'stevearc/vim-arduino'
Plugin 'chrisbra/csv.vim'

"" editing
Plugin 'tomtom/tcomment_vim' " gc
Plugin 'tpope/vim-surround'  " v s {char}

"" helpers

Plugin 'scrooloose/nerdcommenter'
Plugin 'shougo/neocomplete.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'itchyny/lightline.vim'

Plugin 'tomtom/tlib_vim'
Plugin 'marcweber/vim-addon-mw-utils'

Plugin 'mhinz/vim-startify'
Plugin 'ktonga/vim-follow-my-lead'

Plugin 'tpope/vim-fugitive'

Plugin 'majutsushi/tagbar'

Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-rooter'

Plugin 'easymotion/vim-easymotion'
Plugin 'elzr/vim-json'

"" tmux
Plugin 'benmills/vimux'

"" snippets

Plugin 'garbas/vim-snipmate'

Plugin 'honza/vim-snippets'

Plugin 'terryma/vim-multiple-cursors'

" plugin 'christoomey/vim-tmux-navigator'

Plugin 'joeytwiddle/sexy_scroller.vim'
"" end
call vundle#end()
filetype plugin indent on

let g:rooter_patterns = ['cabal.sandbox.config', '.git/']

"preview window
"-------------------
"autocmd winenter * if &previewwindow && winnr() > 1 | wincmd k | endif
" set previewheight=25
" au bufenter ?* call previewheightworkaround()
" func previewheightworkaround()
"     if &previewwindow
"         exec 'setlocal winheight='.&previewheight
"     endif
" endfunc
"


""""""""""""""
"  Colors    "
""""""""""""""

syntax on

let g:haskell_classic_highlighting = 0
let g:rainbow_active = 1

let g:ackprg = 'ag --nogroup --nocolor --column'

set background=dark

let g:lightline = { 'colorscheme': 'palenight' }
set laststatus=2

colorscheme palenight

au BufRead,BufNewFile *.hst set filetype=haskell

call lengthmatters#highlight('ctermbg=0 ctermfg=11')

""""""""""""""""
"  Code        "
""""""""""""""""
"" Arduino
"""""""""""""""""

" Default: /Applications/Arduino.app/Contents/Resources/Java
" let g:vim_arduino_library_path = /path/to/arduino/installation
" Default: result of `$(ls /dev/tty.* | grep usb)`

" let g:vim_arduino_serial_port = /my/serial/port

"""""""""""""""""
"" Lua
"""""""""""""""""

let g:lua_complete_omni = 1

""""""""""""""""
"  General     "
""""""""""""""""
set tags=TAGS;/
"" Movement
""""""""""""""""""
set notimeout

nnoremap - $

" inoremap <Left> <noh> " <c-o>:echo "no left for you!"<cr>
" inoremap <Right> <noh>
" inoremap <Down> <noh>
" inoremap <Up> <noh>

" nnoremap <Left> <noh>
" nnoremap <Right> <noh>
" nnoremap <Down> <noh>
" nnoremap <Up> <noh>
"
" vnoremap <Left> <noh>
" vnoremap <Right> <noh>
" vnoremap <Down> <noh>
" vnoremap <Up> <noh>

" nnoremap <CR> :noh<CR><CR>

" Follow the Leader
"
vmap <Leader>y "+y
"---------------------
let mapleader=" "
" nnoremap <Leader>fs :w<CR>
vmap <Leader>py "+y
nmap <Leader>pp "+p<Esc>


imap jk <Esc>
"|autocmd! BufWritePost * Neomake
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
nmap <Leader>tm :Tmux :r<CR>:Tmux main<CR>
nmap <Leader>tw :Tmux
nmap <Leader>tr :Tmux :rtl<CR>:Tmux :rtl<CR>

map <Leader>pr :so $MYVIMRC<CR>

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR> :ccl <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <Leader>j <CR>

" Movement
" nmap <CR> o <Esc>x
" :FixWhitespace<CR>

" nnoremap <CR> :noh<CR>


nmap mj :m +1 <CR>
nmap mk :m -2 <CR>

"" VimuxSettings
"
nnoremap <Leader>jf :w<CR>:VimuxPromptCommand(":r")<CR><CR>:VimuxPromptCommand("main")<CR><CR>
" nnoremap <Leader>d :w<CR>:VimuxInterruptRunner<CR><CR>:VimuxPromptCommand(":r")<CR><CR>:VimuxPromptCommand("test")<CR><CR>
nnoremap <Leader>d :w<CR>:VimuxPromptCommand(":r")<CR><CR>:VimuxPromptCommand("test")<CR><CR>
" nnoremap <Leader>d :w<CR>:VimuxPromptCommand("qrepl")<CR><CR>:VimuxPromptCommand(":runner")<CR><CR>:VimuxPromptCommand(":r")<CR><CR>:VimuxPromptCommand("test")<CR><CR>
" nnoremap <Leader>g :w<CR>:VimuxPromptCommand("qrepl performance_tool")<CR><CR>:VimuxPromptCommand(":r")<CR><CR>:VimuxPromptCommand("test")<CR><CR>
" nnoremap <Leader>g :w<CR>:VimuxPromptCommand("qrepl")<CR><CR>:VimuxPromptCommand(":l dev_stuff\/scripts\/Run.hs")<CR><CR>:VimuxPromptCommand(":r")<CR><CR>:VimuxPromptCommand("test")<CR><CR>
nnoremap <Leader>lf :w<CR>:VimuxPromptCommand("qrepl")<CR><CR>:VimuxPromptCommand(":l dev_stuff\/scripts\/Run.hs")<CR><CR>:VimuxPromptCommand(":r")<CR><CR>:VimuxPromptCommand(":!./copy_latest_timeline.sh audio_test/downloaded_timeline.json")<CR><CR>:VimuxPromptCommand("testLatest")<CR><CR>
nnoremap <Leader>ld :w<CR>:VimuxPromptCommand(":r")<CR><CR>
nnoremap <Leader>ot :VimuxPromptCommand(":r")<CR>
nnoremap <Leader>orj :VimuxRunCommand(":rtl")<CR>
nnoremap <Leader>oi :VimuxInterruptRunner<CR>

" General Run Keys
" nnoremap <Leader>f :w<CR>:VimuxRunLastCommand()<CR>
nnoremap <Leader>of :VimuxPromptCommand()<CR>

" INO
nnoremap <Leader>iv :w<CR>:VimuxPromptCommand("ino build")<CR><CR>
nnoremap <Leader>if :w<CR>:VimuxPromptCommand("ino build && ino upload")<CR><CR>
nnoremap <Leader>is :VimuxRunCommand("ino serial -- -e 's'")<CR><CR>

function! SerialKill()
    call VimuxSendKeys("C-s C-x")
endfunction
nnoremap <Leader>id :call SerialKill())<CR>


"" Windows

nnoremap <Leader>wh <C-W><C-H>
nnoremap <Leader>wj <C-W><C-J>
nnoremap <Leader>wk <C-W><C-K>
nnoremap <Leader>wl <C-W><C-L>

nnoremap <Leader>wcj <C-W><C-J>:q<CR>

nnoremap <Leader>wv+ :vertical resize +
"10<CR>
nnoremap <Leader>wv- :vertical resize -
" 1i<CR>

nnoremap <Leader>wtl :vsplit<CR>:vertical resize -25<CR>
nnoremap <Leader>wtj :split<CR>:horizontal resize -25<CR>

nnoremap <Leader>wo :wincmd p<CR>

"" Leader-P | Writing and Saving
nnoremap <Leader>pw :w<CR>
nnoremap <Leader>pq :q<CR>
nnoremap <Leader>pv :edit ~/.vimrc<CR>

autocmd InsertEnter,InsertLeave * set cul!

" nnoremap <Leader>lm :%!aeson-pretty
" com! FormatJSON %!aeson-pretty

nnoremap <Leader>fj :%!aeson-pretty<CR>
nnoremap <Leader>fw :FixWhitespace<CR>


nnoremap <Leader>0 ?\$<CR>
"nnoremap <silent> <esc> :noh<cr><esc>
nnoremap <esc>^[ <esc>^[

"" Cursor Shape
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"" ACK Searching

nnoremap <Leader>ps :Ack --haskell
nnoremap <Leader>pa :Ack --lua

"" Various
""" Numbers
set number
set relativenumber

""" Wrapping
set nowrap
set tw=0

set showmode

""" 'Sensible Defaults'

set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set mouse=a
set history=1000


""""""""""""""""
"  Plugins     "
""""""""""""""""

"" Rainbow Parens
let g:rainbow_active = 0

"" Scroller
let g:SexyScroller_EasingStyle = 0
let g:SexyScroller_MaxTime = 170

"" INO

"" TComment
"" Syntastic
"""""""""""""""""
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_balloons = 1

" let g:syntastic_quiet_messages = {âregexâ: âRedundant Case\|Redundant Guard\|Evaluate Found\|Redundant bracket\|Eta reduce\|Use record pattern\|Move brackets\|Use replicateM\|Control.Arrow\|Use uncurry\|Use print\|Redundant return\|Use camelâ}
" let g:syntastic_quiet_messages = {'regex': 'Redundant Case\|Redundant Guard\|Evaluate Found\|Redundant bracket\|Use record pattern\|Control.Arrow\|Use print\|Redundant return\|Use camel'}
" Redundant \$\|
autocmd FileType qf wincmd J


"" supertab - Replace with You Complete Me?
"""""""""""""""""""""

let g:SuperTabDefaultCompletionType = "<c-p>"
" '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"" nerdtree
""""""""""""""""""""

map <Leader>n :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeNodeDelimiter = "\u00a0"

"  nable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"" Tabularize
""""""""""""""""""""

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a: :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap ac :Tabularize /--<CR>
vmap aa :Tabularize /as<CR>
vmap a( :Tabularize /(<CR>
vmap at :Tabularize /

"" ctrl-p
"""""""""""""""""""

" :CtrlP()<CR>
" noremap <leader>b<space> :CtrlPBuffer<cr>
" noremap <leader>f<space> :CtrlPMixed

map <Leader>pf :CtrlP<CR>
map <Leader>pb :CtrlPBuffer<CR>
map <leader>pt :CtrlPTag<CR>

let g:ctrlp_custom_ignore = '\v[\/]dist$'
let g:ctrlp_custom_ignore = '\v[\/]docs$'

let g:ctrlp_reuse_window = 1

set wildignore+=*/build
set wildignore+=*/dev_stuff/output/batch_scores
set wildignore+=*/dist
set wildignore+=*/docs
set wildignore+=*/.cabal-sandbox
set wildignore+=*/.git
set wildignore+=*/dev_stuff/input/old
set wildignore+=*/dev_stuff/workspace/old
set wildignore+=*/dev_stuff/output/old

set wildignore+=*/midi
set wildignore+=*/lilypond

"" Tags
"""""""""""""""
map <leader>tq :tabclose<CR>
noremap <silent><Leader>t] <C-w><C-]><C-w>T

noremap <silent><Leader>tp <C-w>}
noremap <silent><Leader>to <C-w>z






"" Old
" """"""""

" hsimport
function! FindCabalSandbox()
   let l:sandbox    = finddir('.cabal-sandbox', './;')
   let l:absSandbox = fnamemodify(l:sandbox, ':p')
   return l:absSandbox
endfunction

"function! HaskellSourceDir()
"   return fnamemodify(FindCabalSandbox(), ':h:h')
"endfunction
function! HaskellSourceDir()
    return fnamemodify(FindCabalSandbox(), ':h:h') . '/src'
endfunction

function! FindCabalSandboxPackageConf()
   return glob(FindCabalSandbox() . '*-packages.conf.d')
endfunction

"let g:hdevtools_options = '-g-isrc -g-Wall'
"let g:hdevtools_options = '-g-package-conf=' . FindCabalSandboxPackageConf() . ' -g-Wall'
let g:syntastic_haskell_hdevtools_args = '-g-package-conf=' . FindCabalSandboxPackageConf() . ' -g-Wall'
let g:hdevtools_src_dir = HaskellSourceDir()
"
" function! FindCabalSandboxRoot()
"
"      return finddir('.cabal-sandbox', './;')
" endfunction
"
" function! FindCabalSandboxRootPackageConf()
"      return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
"  endfunction
"
" function! HaskellSourceDir()
"     return fnamemodify(FindCabalSandBVox(), ':h:h' . '/src')
" endfunction
"
" let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()
"-g-package-db=../../.cabal-sandbox/*-packages.conf.d'
"
" let g:hdevtools_options = '-g-isrc -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()


"" macros
let @r = 'xywi    function pitch.jk$a(octave, durations, startBeat)return _jkpa(makeSeed(), durations, startBeat, octave)endjkojkj'
let @f = 'xywi	Lua.reginster	kbkbkbkbkbsterhsfunction l "_jk$a"jko	(callPitchStyle jkpa rc :: PitchStyleCall)jkj0i    jkj0i        jkojkj'

"" CSV
aug CSV_Editing
		au!
		au BufRead,BufWritePost *.csv :%ArrangeColumn
		au BufWritePre *.csv :%UnArrangeColumn
aug end

""""""""""""""""""""""""
"  Category Funcs      "
""""""""""""""""""""""""
"" Autofolding .vimrc
" see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
""" defines a foldlevel for each line of code
function! VimFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^"" ') >= 0
    return '>2'
  endif
  if match(s:thisline, '^""" ') >= 0
    return '>3'
  endif
  let s:two_following_lines = 0
  if line(a:lnum) + 2 <= line('$')
    let s:line_1_after = getline(a:lnum+1)
    let s:line_2_after = getline(a:lnum+2)
    let s:two_following_lines = 1
  endif
  if !s:two_following_lines
      return '='
    endif
  else
    if (match(s:thisline, '^"""""') >= 0) &&
       \ (match(s:line_1_after, '^"  ') >= 0) &&
       \ (match(s:line_2_after, '^""""') >= 0)
      return '>1'
    else
      return '='
    endif
  endif
endfunction

""" defines a foldtext
function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    let s:line = ' O '.getline(v:foldstart+1)[3:-2]
  elseif v:foldlevel == 2
    let s:line = '   *  '.getline(v:foldstart)[3:]
  elseif v:foldlevel == 3
    let s:line = '     ^ '.getline(v:foldstart)[4:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 3
    return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  else
    return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

""" set foldsettings automatically for vim files
augroup fold_vimrc
  autocmd!
  autocmd FileType vim 
                   \ setlocal foldmethod=expr |
                   \ setlocal foldexpr=VimFolds(v:lnum) |
                   \ setlocal foldtext=VimFoldText() |
     "              \ set foldcolumn=2 foldminlines=2
augroup END

hi Normal guibg=NONE ctermbg=NONE
