"   This is the personal .vimrc file of Qing Tao.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand,
"   as I have done from other notable vim purists
"   Updated 21/09/2018 - on macOS High Sierra
"

set nocompatible                "Use Vim settings, rather than Vi settings
"Be IMproved
syntax on
filetype off                    "required!

" I use neovim(a refactor, and sometimes redactor, in the tradition of Vim). And
" I use vim-plug https://github.com/junegunn/vim-plug as my
" preferred plugin manager....
"

" Python
let g:python3_host_prog = '/Users/LeonTao/anaconda3/bin/python'
let g:python_host_prog = '/Users/LeonTao/anaconda2/bin/python'
let g:python2_host_prog = '/Users/LeonTao/anaconda2/bin/python'

filetype plugin on

call plug#begin('~/.vim/plugged')

" Plugs go here
Plug 'junegunn/vim-plug'

" Utilitys
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'rizzatti/dash.vim'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-buftabline'
Plug 'lfv89/vim-interestingwords'



" Code

Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'aperezdc/vim-template'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tell-k/vim-autopep8'
Plug 'Yggdroot/LeaderF'



" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" color schema, theme
Plug 'dracula/vim', { 'as': 'dracula' }


call plug#end()

set backspace=indent,eol,start  "allow backspacing over everything in insert 

set history=1000                  "keep 100 lines of command line history

set ruler                       "show the cursor position all the time

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching
set hlsearch                    "highlight search terms

set nu                          "show line numbers

set expandtab                   "use spaces instead of tabs

set tabstop=4                   "insert 4 spaces whenever the tab key is pressed

set shiftwidth=4                "set indentation to 4 spaces

set ic                          "Ignore Case during searches

set autoindent                  "start new line at the same indentation level

set smartindent

syntax enable                   "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,
"    who did ever restore from swap files
"    anyway?
"    https://github.com/nvie/vimrc/blob/master/vimrc#L141

set ttimeoutlen=50              "Solves: there is a pause when leaving insert mode

set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

set wildmode=longest,list       " Pressing <Tab> shows command suggestions similar to pressing <Tab>
" in bash

set laststatus=2                " Solves lightline not showing

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
" set mouse-=a
set mouse=n
set nowritebackup
set noeb

" ---------------- leader ------------
" map leader key
let mapleader=","
noremap \ ,

"vnoremap <Leader>y "+y
"nmap <Leader>p "+p
"nmap <Leader><space> :nohlsearch<cr>


" Mappings to traverse buffer list
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>

nnoremap <silent> ]B :blast<CR>

"Easy expansion of the active file directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"Shortcut to Mute Highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"Root permission on a file inside VIM
cmap w!! w !sudo tee >/dev/null %

" -------------- encoding -----------

set encoding=utf-8

set fileencoding=utf-8

set fileencodings=ucs-bom,utf-8,latin1

set termencoding=utf-8

" --------------- fold ----------------
set foldenable              " 开始折叠

" set foldmethod=syntax       " 设置语法折叠
" set foldmethod=indent
set foldmethod=manual

set foldcolumn=0            " 设置折叠区域的宽度

setlocal foldlevel=1        " 设置折叠层数为

set foldlevelstart=99       " 打开文件是默认不折叠代码


"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 用空格键来开关折叠

" --------------------- jump --------------
" Format jump
nnoremap <silent> g; g;zz
nnoremap <silent> g, g,zz

" Split fast
" nnoremap <leader>\ :vs<CR>
" nnoremap <leader>- :sp<CR>


" ----------------- tagbar ------------------
" nmap <F12> :TagbarToggle<CR>
nnoremap <silent> <Leader>t :TagbarOpenAutoClose<CR>

let g:tagbar_width = 25
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0



" ----------------- NERDTreeToggle -----------

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <F11> :NERDTreeToggle<CR>
map f<C-f> :NERDTreeFocus<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeWinSize=23



" -------------lightline settings---------------
set laststatus=2

let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'component': {
            \   'readonly': '%{&readonly?"🔐":""}',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }


" -------------fzf and ag-settings---------------------
" set the line below to your fish config
" set -g -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

nmap <c-p> :Files<CR>

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>l :Buffers<CR>

command! -bang -nargs=* GGrep
            \ call fzf#vim#grep('git grep --line-number --ignore-case '.shellescape(<q-args>), 0, {'options': '-i'}, <bang>0)

"command! -bang -nargs=* Ag
"  \ call fzf#vim#ag(<q-args>,
"  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \                 <bang>0)

" nnoremap <silent> <Leader>A :Ag<CR>




if executable('ag')
    let g:ackprg = 'ag --vimgrep --ignore node_modules --ignore dist'
endif

" search lines in files
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" --------------snippets--------------------------
let g:UltiSnipsExpandTrigger="<Right>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" -------------nerd-commenter--------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" ------------- multiple-cursors-----------------
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'



" -------------- git---------------------------
set signcolumn=yes
set updatetime=50
" let g:gitgutter_sign_added = '😏'
" let g:gitgutter_sign_modified = '😵'
" let g:gitgutter_sign_removed = '😡'
" let g:gitgutter_sign_removed_first_line = '✋'
" let g:gitgutter_sign_modified_removed = '😳'
" let g:airline#extensions#hunks#enabled=0


" ---------------- ale settings ----------------------
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare

hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta



" ---------------- clipboard -------------------------

set clipboard+=unnamedplus

" let g:clipboard = {
"    \ 'name': 'myClipboard',
"    \  'copy': {
"    \      '+': 'tmux load-buffer -',
"    \      '*': 'tmux load-buffer -',
"    \  },
"    \ 'paste': {
"    \     '+': 'tmux save-buffer -',
"    \     '*': 'tmux save-buffer -',
"    \ },
"    \ 'cache_enabled': 1,
"  \}

function! ClipboardYank()
    "  call system('xclip -i -selection clipboard', @@)
    call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
    "  let @@ = system('xclip -o -selection clipboard')
    let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" ------------------ vim-easy-align -------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" ------------------ asyncrun setting ------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" 编译单个文件
nnoremap <silent> <F5> :AsyncRun clang++ -g -std=c++11 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" 编译，产生可以调试的文件
"" nnoremap <silent> <leader>F5 :AsyncRun g++ -g -std=c++11 -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" 运行单个文件
nnoremap <silent> <F6> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" 编译整个项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

" 运行项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" 使用 cmake 生成 Makefile
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml', '.idea']
"


" ---------------------- last edited position -------------
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" ---------------------- ctags ----------------------
set tags=./.tags;,.tags

" ---------------------- gutentags ------------------

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', '.idea']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif


" --------------------- Autoformat ---------------
noremap <leader>f :Autoformat<cr>


" --------------------- save file ----------------
" 使用 leader+w 在插入和normal模式下保存文件，我经常在 insert 模式下代替 Esc
inoremap <leader>w <Esc>:wa<cr>
noremap <leader>w :wa<cr>


" --------------------- deoplete ----------------
let g:deoplete#enable_at_startup = 1


" --------------------- python mode -------------

"开启警告
let g:pymode_warnings = 0
"保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
"显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
"设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
"使用python3
let g:pymode_python = 'python3'
"使用PEP8风格的缩进
let g:pymode_indent = 1
"取消代码折叠
let g:pymode_folding = 0
"开启python-mode定义的移动方式
let g:pymode_motion = 1

"<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'

"重命名光标下的函数，方法，变量及类名
let g:pymode_rope_rename_bind = '<C-c>rr'

"发现错误时不自动打开QuickFix窗口
" let g:pymode_lint_cwindow = 0
let g:pymode_lint_cwindow = 1

let g:pymode_rope_completion = 1
let g:pymode_rope_completion_bind = '<C-K>'
let g:pymode_rope_complete_on_dot = 1


" --------------------- auto save ---------------
au BufLeave * silent! wall
set autowrite
:au FocusLost * silent! wa


" -------------------- replace ------------------
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


" ------------------- vim-buftabline ------------
set hidden
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [B :nfirst<CR>

nnoremap <silent> ]b :bnex<CR>
nnoremap <silent> ]B :blast<CR>



" ------------------- spell ------------------
set spell spelllang=en_us

set spellfile=~/.vim/spell/en.utf-8.add

" ------------------- LeaderF -----------------
" noremap <F2> :LeaderfFunction!<cr>
nnoremap <silent> <leader>m :LeaderfFunction!<cr>

let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }


" -------------------- interestingwords ---------------
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']


" ---------------------- noh ------------------------
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


" -------------------- youcompleteme ------------
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_server_log_level = 'info'
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-space>'
"set completeopt=menu,menuone

" Fix Python Path (for YCM)
"let g:ycm_path_to_python_interpreter="/Users/LeonTao/anaconda3/bin/python"

"noremap <c-z> <NOP>

"let g:ycm_semantic_triggers =  {
            "\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            "\ 'cs,lua,javascript': ['re!\w{2}'],
            "\ }


" -------------------- theme --------------------
" colorscheme onedark
color dracula
