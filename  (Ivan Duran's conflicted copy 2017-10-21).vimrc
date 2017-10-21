" Automatic reloading of .vimrc
"" autocmd! bufwritepost .vimrc source %

" Disable youcompleteme for the Terminal only
""if has ('gui_running')
    ""else
        ""let g:loaded_youcompleteme = 1
""endif
" let g:loaded_youcompleteme = 1

syntax on

"===================== Vim-Plug Settings  ======================= 

call plug#begin('~/.vim/plugged')
""set rtp+=~/.fzf

Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'tacahiroy/ctrlp-funky'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'terryma/vim-multiple-cursors'
Plug 'gerw/vim-latex-suite'
Plug 'lervag/vimtex'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
Plug 'jalvesaq/Nvim-R'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/goyo.vim' "Distraction-free writng in vim 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Command line fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'junegunn/seoul256.vim' "colorscheme
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'yggdroot/indentline'
Plug 'thinca/vim-quickrun'
Plug 'kannokanno/previm'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc' "library for vim-notes
Plug 'benmills/vimux'
Plug 'svermeulen/vim-easyclip'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'michaeljsmith/vim-indent-object'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-ruby/vim-ruby'
Plug 'junegunn/vim-easy-align'
Plug 'joshdick/onedark.vim'

" Html Bundles
Plug 'alvan/vim-closetag' "html
Plug 'Valloric/MatchTagAlways' "html match tags
Plug 'gorodinskiy/vim-coloresque' "html-css highlight with same color code
Plug 'mattn/emmet-vim' "html expanding abbreviations: ctrl-y + , d D n N i m k j ' a A


" For Octave syntax, download the syntax file from:
" http://www.vim.org/scripts/script.php?script_id=3600


call plug#end()

"========================================================================================== 

filetype indent plugin on

"" Enable omni completion
set omnifunc=syntaxcomplete#Complete

"" Toggle spell checking
map <F6> :setlocal spell! spelllang=en_us<CR>
inoremap <F6> <C-o>:setlocal spell! spelllang=en_us<CR>


" Rebind <Leader> key
let mapleader = "\<Space>"


" Mouse
" set mouse=a   "on OSX press ALT and click


" Surround highlighted text in quotes
vnoremap <leader>" <esc>a"<esc>`<i"<esc>f"a
" Surround word in quotes
nnoremap "" viw<esc>a"<esc>hbi"<esc>lel


" type leader+ev to edit the Vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>


" Mapping to source my vimrc
nnoremap <leader>S :source $MYVIMRC<CR>


" Quicksave command
nnoremap <Leader>fs :w<CR>
vnoremap <Leader>fs <C-C>:w<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows
nnoremap ZZ :wq<CR>


" Saves file when tabbing away 
au FocusLost * :wa


" Quicker scaping
inoremap fd <ESC>


" Using . to repeat commands in visual mode as well
vnoremap . :norm.<CR>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
nnoremap <silent><leader>z :nohls<CR>
vnoremap <silent><leader>z :nohls<CR>


" Registers mappings
nnoremap aa "a
vnoremap aa "a


" Mapping for special characters
if has("macunix")
  au Filetype ruby,markdown inoremap <buffer> <Esc>- <space>=><space>
else
  au Filetype ruby,markdown inoremap <buffer> <A--> <space>=><space>
endif


" Swap lines back and forth
nmap <c-s-up> mmkP
nmap <c-s-down> mmp


" Swap words
nmap <c-s-right> mawwP
nmap <c-s-left> mawbP


" Insert blank space before and after cursor
nnoremap <leader>b<space> i<space><esc>l
nnoremap <leader><space> a<space><esc>h


" Create empty lines above and below
nnoremap rr O<esc>Dj0
nnoremap tt o<esc>Dk0


" Go to end and beginning of line in mode
nnoremap W $
nnoremap Q ^


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap L <c-w>l
nnoremap H <c-w>h
nnoremap NH <c-w>s
nnoremap NV <c-w>v
nnoremap CP <c-w>q
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-l> <c-w>l
"nnoremap <c-h> <c-w>h

" Neovim terminal
if has('nvim')
    tnoremap <leader>t <C-\><C-n> " exit to normal mode in terminal emulator
    nnoremap <leader>t <C-w>s<C-w>j:terminal<CR>
endif


" Resize splits
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-right> <c-w>>
nnoremap <c-left> <c-w><

" Move out of tag (e.g. in html)
nnoremap <leader>F f>a


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" easier moving between tabs
"" nnoremap <Leader>n <esc>:tabprevious<CR>
"" nnoremap <Leader>m <esc>:tabnext<CR>


" =========== Using buffers =========================

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nnoremap <leader>T :enew<cr>
" Move to the next buffer
nnoremap <leader>l :bnext<CR>
" Move to the previous buffer
nnoremap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
""nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>q :bd<CR>
nmap <leader>Q :bd!<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" ====================================================



set tabstop=2  " number of space characters inserted when tab key is pressed
set shiftwidth=2  " number of space characters inserted for indentation
set expandtab  " inserts spaces when tab key is pressed
" set softtabstop=2  " makes the spaces feel like real tabs
set smartindent
set autoindent

autocmd FileType c,python setlocal tabstop=4|setlocal shiftwidth=4

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


"" To make File Explorer similar to NerdTree
"let g:netrw_liststyle=3


" Settings for NERDTree
"" nnoremap <leader>nt :NERDTree<CR>
" cd ~/Dropbox
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTree<CR>
" open Nerd Tree in folder of file in active buffer
map <Leader>nt :NERDTree %:p:h<CR>


" Showing line numbers and length
" set number  " show line numbers
set relativenumber
"" set textwidth=88   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
autocmd Filetype c,python,ruby setlocal colorcolumn=81|highlight ColorColumn ctermbg=237


" Always wrap long lines:
set wrap
set linebreak
set nolist
" Move up and down with wrapped lines
nnoremap k gk
nnoremap j gj


" Wrap-unwrap variable for string interpolation in Ruby
nnoremap <leader>in bi#{<Esc>ea}<Esc>
nnoremap <leader>un bhhxx<Esc>elx


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


"" Copies file path to clipboard (/something/src/foo.txt)
nnoremap <leader>cp :let @+=expand("%:p")<CR>

"" Copies filename to clipboard  (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>

"" Copies directory name to clipboard (/something/src)
nnoremap <leader>ch :let @+=expand("%:p:h")<CR>


" Settings to help learn to use hjkl keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>


" Setting for Vimtex
if has("macunix") || has("gui_macvim")
    let g:vimtex_fold_enabled = 0
    let g:vimtex_quickfix_ignore_all_warnings = 1
    let g:tex_flavor = "latex"
    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'
    let g:vimtex_view_general_options_latexmk = '-r 1'
else    
    let g:vimtex_fold_enabled = 0
    let g:vimtex_quickfix_ignore_all_warnings = 1
    let g:tex_flavor = "latex"
    let g:vimtex_view_general_viewer ='zathura'
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'
    ""let g:vimtex_view_general_options_latexmk = '-r 1'
endif


" Settings for Latex-Suite
"" imap <C-space> <Plug>IMAP_JumpForward
"" nmap <C-space> <Plug>IMAP_JumpForward
" imap <C-k> <Plug>IMAP_JumpBack
" nmap <C-k> <Plug>IMAP_JumpBack
if has('gui_running')
    if has("gui_mac") || has("gui_macvim")
        set macmeta
    else
        set winaltkeys=no
    endif
endif


" Octave syntax
augroup filetypedetect
au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END 
" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype octave
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif


" Delimitmate configuration
imap <leader>j <Plug>delimitMateS-Tab
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1


" Setting for Nvim-R-Plugin
imap <LocalLeader><CR> <C-O>:call SendLineToR("stay")<CR><CR>
vmap <LocalLeader><CR> <Plug>RDSendSelection
nmap <LocalLeader><CR> <Plug>RDSendLine


" Settings for fzf.vim
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
nmap <leader>f :FZF<CR>
nmap <leader>b :Buffers<CR>


" " Settings for IndentLine
" " let g:indentLine_conceallevel = 1
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_indentLevel = 5
" let g:indentLine_fileType = ['ruby', 'python']


" Setting for indent-guides
let g:indent_guides_indent_levels = 10
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_auto_colors = 0
augroup Indent_Guides
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
augroup END

" Nowrapping for Html files
" autocmd BufNewFile,BufRead *.html setlocal nowrap


" Autospelling for tex files
augroup filetype_tex
    autocmd!
    autocmd FileType tex setlocal spell! spelllang=en_us
augroup END

" Setting for previm (markdown preview plugin)
if has("mac")
    let g:previm_open_cmd = "open -a 'Google Chrome'"
else
    let g:previm_open_cmd = 'chromium-browser'
endif
nnoremap <F10>c :PrevimOpen<CR>


" " Settings for Youcompleteme
let g:ycm_filetype_blacklist = {}
" let g:ycm_filetype_blacklist = {
"     \ 'tagbar' : 1,
"     \ 'qf' : 1,
"     \ 'notes' : 1,
"     \ 'markdown' : 0,
"     \ 'unite' : 1,
"     \ 'text' : 0,
"     \ 'vimwiki' : 1,
"     \ 'pandoc' : 1,
"     \ 'infolog' : 1,
"     \ 'mail' : 1
"     \}
" let g:ycm_filetype_whitelist = { 'markdown' : 1 }
if !has('macunix')
    let g:ycm_server_python_interpreter = '/usr/bin/python'
endif


" Settings for Vim-notes
let g:notes_directories = ['~/Dropbox/Vim_Notes']
" let g:notes_smart_quotes = 0
let g:notes_tab_indents = 0


" Set current's file path as working directory
nnoremap <leader>wd :cd %:p:h<CR>
" Set Dropbox as working directory
nnoremap <leader>dd :cd ~/Dropbox<CR>
" Set Home as working directory
nnoremap <leader>dh :cd<CR>


" Settings for Vimux
" Run ruby and python files in new tmux pane
augroup AutoVimuxRun
    autocmd!
    autocmd FileType ruby nnoremap <buffer> <leader>vr :w<CR>:cd %:p:h<CR>:VimuxRunCommand("clear; ruby " . bufname("%"))<CR>
    autocmd FileType python nnoremap <buffer> <leader>vr :w<CR>:cd %:p:h<CR>:VimuxRunCommand("clear; python " . bufname("%"))<CR>
augroup END
nnoremap <leader>vq :VimuxCloseRunner<CR>

" Run ruby, bash, and python files in terminal
augroup AutoRun
    autocmd!
    autocmd FileType ruby nnoremap <buffer> <F5> :w<CR>:cd %:p:h<CR>:!clear; ruby %<CR>
    autocmd FileType python nnoremap <buffer> <F5> :w<CR>:cd %:p:h<CR>:!clear; python %<CR>
    autocmd FileType sh nnoremap <buffer> <F5> :w<CR>:cd %:p:h<CR>:!clear; ./%<CR>
augroup END
if has('nvim')
augroup AutoRun
    autocmd!
    autocmd FileType ruby nnoremap <buffer> <F5> :cd %:p:h<CR><C-w>s<C-w>j:terminal! clear; ruby %<CR>
    autocmd FileType python nnoremap <buffer> <F5> :cd %:p:h<CR><C-w>s<C-w>j:terminal! clear; python %<CR>
    autocmd FileType sh nnoremap <buffer> <F5> :cd %:p:h<CR><C-w>s<C-w>j:terminal! clear; ./%<CR>
augroup END
endif


" Settings Vim-easyclip
" Map add mark to gm instead of m
nnoremap gm m
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAutoFormat = 1
nmap <leader>cf <plug>EasyClipToggleFormattedPaste
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
if has('mac')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif
let g:EasyClipUsePasteToggleDefaults = 0
" nmap <c-f> <plug>EasyClipSwapPasteForward
nmap <c-b> <plug>EasyClipSwapPasteBackwards
" let g:EasyClipShareYanks = 1


" Settings for easymotion
map zz <Plug>(easymotion-prefix)
" map zw <Plug>(easymotion-bd-w)
map zW <Plug>(easymotion-w)
" map zW <Plug>(easymotion-bd-W)
map zw <Plug>(easymotion-b)
map zl <Plug>(easymotion-bd-wl)
map zs <Plug>(easymotion-s)
map zj <Plug>(easymotion-j)
map zk <Plug>(easymotion-k)
map zr <Plug>(easymotion-repeat)
map zn <Plug>(easymotion-next)
map zp <Plug>(easymotion-prev)
function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {
    \     "\<CR>": '<Over>(easymotion)'
    \   },
    \   'is_expr': 0
    \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g// incsearch#go(<SID>incsearch_config({'is_stay': 1}))
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
    \   'converters': [incsearch#config#fuzzyword#converter()],
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


" Macro to use % to match start/end of blocks such as do-end.
runtime macros/matchit.vim


" Settings for Ctrlp C Matching
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }


" Settings for Ctrlp Funky
" let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_multi_buffers = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


" Settings for Markdown syntax
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby']


" Settings for Ultisnips
" let g:UltiSnipsSnippetsDir='~/.vim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsListSnippets="<f3>"
let g:UltiSnipsExpandTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-h>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Setting vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" ============================================================================
" IDE Setup
" ============================================================================

" Setting for vim-airline (similar to powerline)
"cd ~/.vim/bundle
"git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
set laststatus=2
" let g:airline#extensions#t  abline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=1
"" let g:airline_left_sep=''
"" let g:airline_right_sep=''


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
endfunction


" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" Press the space bar to send lines and selection to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*
" set runtimepath^=~/.vim/bundle/ctrlp.vim
"" let g:ctrlp_extensions = ['dir']
let g:ctrlp_working_path_mode = 'c' " sets the directory of the current file as the working directory
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'   " integration with Ag to make ctrlp faster
" let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_extensions = ['line']
let g:ctrlp_match_window = 'max:20'
nnoremap <C-l> :CtrlPLine<CR>
nnoremap <C-m> :CtrlPMRU<CR>
nnoremap <C-t> :CtrlPBuffer<CR>


" open ag.vim
nnoremap <leader>a :Ag 


" Settings for Syntastic
" cd ~/.vim/bundle && \
" git clone https://github.com/scrooloose/syntastic.git
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}
nnoremap ]<space> :lnext<CR>
nnoremap [<space> :lprevious<CR>


" ======================== Color Schemes ============================
" syntax on

set cursorline      " Higjlights current line


" Settings for Solarized
" cd ~/.vim/bundle
" git clone git://github.com/altercation/vim-colors-solarized.git
""set background=light
if has("gui_running")
    if has("gui_mac") || has("gui_macvim")
        set lines=33
        set columns=106
        " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h17
        " set guifont=Fira\ Code:h18
        " set guifont=Source\ Code\ Pro\ for\ Powerline:h18
        set linespace=3
        " color seoul256
        " color monokai
        " let base16colorspace=256
        " colorscheme base16-eighties
    else 
        ""set background=dark
        ""set background=light
        """"let g:solarized_termcolors=256
        ""colorscheme solarized
        ""call togglebg#map("<F5>")
        " color seoul256
        " color monokai
        set lines=54
        set columns=95
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
    endif
else
    ""set t_Co=256
    ""color wombat256mod
    " color jellybeans
    " set background=dark
    " let base16colorspace=256
    " colorscheme base16-eighties
    " color seoul256
    color onedark
    " color monokai
    ""set lines=50
endif

set linespace=3

"" colorscheme torte
"" colorscheme desert


" ===================================================================
" Command for autoloading colorscheme
"" colors solarized

" " Open file in browser, e.g. markdown or html files
" if has("mac")
"     nnoremap <F10>c :!open -a 'Google Chrome' %:p & <CR><CR>
" else
"     nnoremap <F10>c :!chromium-browser %:p & <CR><CR>
" endif

