" To move
" URL: https://vim.wikia.com/wiki/Example_vimrc
" Authors: https://vim.wikia.com/wiki/Vim_on_Libera_Chat
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Autoindent is good, but smartindent is EVEN BETTER
set smartindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
" set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.

" set t_vb=
set noeb vb t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
"later set cmdheight=2

" Display line numbers on the left
"set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
" set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
" My own options

" Windows
" set shell=powershell
" set shellcmdflag=-command
" set shellquote=\"
" set shellxquote=

" Macros
"
" Join svg tags
let @h = 'v/<\/svg>J'

" Look for previous media block beginning
let @m = '?@media:sleep 600mzz'
let @x = 'A<svg class="">	<use xlink:href="img/sprite.svg#"></kb</'
let @o = 'ooutline: 1px solid red;'
let @b = 'obackground-color: 1kbred;'
let @p = '../../../dist/'
let @n = 'xi&nbsp;'

" Abbreviations
" Linux 
ca vrc ~/.config/nvim/init.vim
ca gvrc ~/.config/nvim/ginit.vim

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Windows
" ca vrc $HOME/vimfiles/vimrc

"Set colorscheme Windows
" colorscheme industry

"Set font
" set guifont=Consolas:h11
" set guifont=Inconsolata:h13
" set guifont=Inconsolata\ NFM:h11
" set guifont=DejaVu\ Sans\ Mono:h10
" set guifont=FiraMono\ Nerd\ Font\ Mono:h11
set guifont=Hack\ Nerd\ Font\ Mono:h10
" set guifont=DejaVuSansM\ Nerd\ Font\ Mono:h10

" Set slash for filenames for windows
" Doesn't work with VimPlug
" :set shellslash

" Script to run macro on lines that match visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" set copy and paste from clipboard map

" Windows
" vmap ,y "*y
" nmap ,p "*p

" Linux 
vmap ,y "+y
nmap ,p "+p

"Windows
" sets the language of the menu (gvim)
" set langmenu=en_US.UTF-8    
" sets the language of the messages / ui (vim)
" language en                 

" JavaScript autocompletion
set omnifunc=javascriptcomplete#CompleteJS

" Set omnicompletion on tab
autocmd FileType xml,html inoremap </ </<C-x><C-o>

" Wrap text without word break
set linebreak

" Configure autocompletion
set wildmode=longest,list,full

" Make vim use system clipboard
"set clipboard+=unnamedplus

" Commands for opening terminal in new window
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" Disable line numbering for terminal
" Linux
au TermOpen * setlocal nonumber
" Windows
" au TerminalOpen * setlocal nonumber

" Make netrw change current working directory
"let g:netrw_keepdir=0

" Make file directory current working directory 
set autochdir
set browsedir=current

" Enable switching to russian keyboard via CTRL-^
set keymap=russian-jcukenwin

" Enable some commands for russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Make default keymap english
set iminsert=0 

" Change wildmode in command mode 
" (Doesn't work well with :! bash commands
"nnoremap : :set wildmode=longest,list<CR>:
"cnoremap <silent> <CR> <CR>:set wildmode=longest,list,full<CR>
"cnoremap <silent> <Esc> <Esc>:set wildmode=longest,list,full <CR>
"cnoremap <silent> <C-c> <C-c>:set wildmode=longest,list,full <CR>

" Code folding
" set foldmethod=indent
" autocmd!
" autocmd FileType jsx setlocal foldmethod=indent

" " set foldmethod=syntax
" set foldmethod=indent
" set foldlevelstart=99
" set foldnestmax=10
" " set nofoldenable
" set foldlevel=2

set foldmethod=syntax "syntax highlighting items specify folds  
set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let g:javaScript_fold=1 "activate folding by JS syntax  
" set foldlevelstart=99 "start file with all folds opened
set foldlevelstart=2
set foldlevel=3
set foldnestmax=3

highlight Folded guibg=black guifg=white

" Make line wrapping look normal
set display+=lastline

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
"augroup filetype_vim
"    autocmd!
"    autocmd FileType vim setlocal foldmethod=marker
"augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

"------------------------------------------------------------
" Vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"------------------------------------------------------------

" Plug 'eslint/eslint'

Plug 'mattn/emmet-vim'
" Make emmet activate on ,
" let g:user_emmet_leader_key=','
let g:user_emmet_leader_key='<C-T>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" CoC.vim
" Git doesn't work for this one
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-explorer',
      \ 'coc-calc', 
      \ 'coc-phpls',
      \ 'coc-emmet',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-diagnostic',
      \ '@yaegassy/coc-phpstan',
      \]

" Not added

" coc-eslint
nnoremap <F9> :CocCommand eslint.executeAutofix<CR>

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"
" coc-calc
let mapleader = ","
"" append result on current expression
"nmap <Leader>ca <Plug>(coc-calc-result-append)
"" " replace result on current expression
"nmap <Leader>cr <Plug>(coc-calc-result-replace)
""
"" coc-explorer
:nnoremap <space>e :CocCommand explorer<CR>
""
"" coc-prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
"
"
" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<Tab>" :
"  \ coc#refresh()

" Format files
" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', {
"       \ 'do': 'npm install',
"       \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Ale autocompletion
" let g:ale_completion_enabled = 1
" ALE Linter
" Plug 'dense-analysis/ale'

Plug 'Yggdroot/indentLine'
" Configure indentline
let g:indentLine_enabled    = 1
"let g:indentLine_char       = '¦'
let g:indentLine_char_list = ['|', '¦', '|', '¦']
let g:indentLine_color_term = 239
let g:indentLine_color_gui  = '#A4E57E'
nmap <M-l><M-i> :IndentLinesToggle<CR>

Plug 'tpope/vim-commentary'

" Better formatting
Plug 'sheerun/vim-polyglot'

" Surround pluging
Plug 'tpope/vim-surround'
" Custom surrounds
let g:surround_99 = "{/* \r */}"

" Paste with proper indentation
Plug 'sickill/vim-pasta'

" Increment in visual-block
Plug 'JikkuJose/vim-visincr'

"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
"Plug 'dense-analysis/ale'

Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <F7> :NERDTreeToggle<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

nnoremap <C-p> :Files<CR>

" Ignore node_modules in fzf
let $FZF_DEFAULT_COMMAND = 'ag --ignore node_modules --ignore vendor --ignore .git --ignore dist -g ""'

Plug 'preservim/tagbar'
" Windows Path
" let g:tagbar_ctags_bin = "C:/Users/KcK/Downloads/User_folders/windows/ctags-p6.0.20230122.0-x64/ctags.exe"
nmap <F8> :TagbarToggle<CR>

Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.project_directory', '.git', 'node_modules', 'package.json']

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

Plug 'stephpy/vim-php-cs-fixer'
let g:php_cs_fixer_path = "/home/kck/utils/php-cs-fixer"
let g:php_cs_fixer_rules = "@PSR12" 
let g:php_cs_fixer_enable_default_mapping = 0     " Enable the mapping by default (<leader>pcd)
au BufWritePost *.php silent! call PhpCsFixerFixDirectory()

" Plugin for xdebug
Plug 'vim-vdebug/vdebug'
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9003
let g:vdebug_options["watch_window_style"] = 'compact'
let g:vdebug_options["marker_default"] = '*'
let g:vdebug_options["simplified_status"] =0 
let g:vdebug_keymap = {
\    "run" : "<C-F5>",
\    "run_to_cursor" : "<F9>",
\    "step_over" : "<F2>",
\    "step_into" : "<F3>",
\    "step_out" : "<F4>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}
let g:vdebug_keymap['run'] = '<C-F5>'
let g:vdebug_keymap['close'] = '<C-F6>'
let g:vdebug_keymap['run_to_cursor'] = '<C-F9>'
let g:vdebug_keymap['set_breakpoint'] = '<C-F10>'

" PHP code formatter
Plug 'hlidotbe/vim-phpcbf'
nnoremap <F5> :call PhpCsFixerFixDirectory() \| Phpcbf --standard=PSR12<CR>
Plug 'bpearson/vim-phpcs'
let Vimphpcs_Standard='PSR12'
Plug 'neomake/neomake'
let g:neomake_php_phpcs_args_standard = 'PSR12'


"------------------------------------------------------------
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

" For tags expand
function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"

    else
      return "\<CR>"

    endif

  else
    return "\<CR>"

  endif

endfunction

inoremap <expr> <CR> Expander()

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

nnoremap <F6> :normal migg=G`izz<CR>


" augroup autoindent
"   au!
"   " autocmd BufWritePre * :normal migg=G`izz
"   autocmd BufWritePre *.css :normal migg=G`izz
"   autocmd BufWritePre *.html :normal migg=G`izz
"   autocmd BufWritePre *.ts :normal migg=G`izz
"   autocmd BufWritePre *.js :normal migg=G`izz
" augroup End

set expandtab

" Neomake
call neomake#configure#automake('nrwi', 500)
