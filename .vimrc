
"==========================================================================="
"  ProjectLink: https://github.com/bmbstack/dotfiles
" AwesomeLink: https://github.com/yangyangwithgnu/use_vim_as_ide
" PluginList: http://www.vimawesome.com
" Author: bmbstack 
" Email: wangmingjob@icloud.com
" Version: 0.0.1
" WebSite: http://www.bmbstack.com
" Last Mofify: 2016年07月30日
" Desc: a simple vim config for server

"==========================================================================="
"                                     General                               "
"==========================================================================="

"======基础配置======"
syntax on   " 用指定语法高亮配色方案替换默认方案
syntax enable " 开启语法高亮功能
filetype on   " 开启文件类型侦测
filetype plugin on   " 不同文件加载对应的插件
set nocompatible " 关闭兼容∏模式
set nu   " 显示行号
set ruler " 显示光标当前位置
set incsearch  " 开启实时搜索功能
set ignorecase  " 搜索时大小写不敏感
set smartcase "智能大小写
set wildmenu  " 命令行模式智能补全
set wildmode=list:longest,full
set completeopt=longest,menuone
set nobackup " 覆盖文件时不备份
set noswapfile
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages
if has('mouse') "鼠标支持
    set mouse=a
endif

"=======代码折叠======"
set foldmethod=syntax  "set foldmethod=indent 基于缩进或语法进行代码折叠
set nofoldenable " 启动 vim 时关闭折叠代码
set smarttab " 只能添加4个空格和删除4个空格
set autoindent " 自动缩进
set showmatch " 设置匹配模式，类似当输入一个左括号时会匹配相应的右括号   
set showmode " 显示模式
set cursorline " 高亮当前行
"set cursorcolumn
set fileencodings=utf-8,gb18030,cp936,big5 " 显示文件编码格式
set t_Co=256 " 使用256配色
set backspace=2 
set nowrap  "禁止折行
set hls


"=============================================================================="
"                                        Keymap                                "
"=============================================================================="
"====begin(通用 Keymap)===="
let mapleader=','  
let g:mapleader=','

map <leader>m :!open http://man.bmbstack.com/vim
map <leader>w :!open https://wakatime.com/dashboard
"打开man手册
inoremap jj <esc> 
" ESC
inoremap kk <esc> 
" ESC

nnoremap nw <C-W><C-W> 
" 切换window
nmap <C-j> <C-W>j 
" 切到下方window
nmap <C-k> <C-W>k 
" 切到上方window
nmap <C-h> <C-W>h 
" 切到左边window
nmap <C-l> <C-W>l 
" 切到右边window

imap <C-f> <right>
" 光标向右移动一个字符
imap <C-b> <left>
" 光标向左移动一个字符
imap <C-p> <up>
" 光标向上移动一个字符
imap <C-n> <down>
" 光标向下移动一个字符

imap <C-a> <ESC>I
" 移动到行首
imap <C-e> <ESC>A
" 移动到行尾

"=======resize视图======="
nmap h= :resize +5<CR>  
" 水平方向放大window
nmap h- :resize -5<CR>  
" 水平方向缩小window
nmap v= :vertical resize +5<CR> 
" 垂直方向放大window
nmap v- :vertical resize -5<CR> 
" 垂直方向缩小window
"====end(通用 Keymap)===="

"=============================================================================="
"                                   PluginList                                 "
"=============================================================================="
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim' "插件管理器
Plug 'tomasr/molokai' "molokai主题
Plug 'haya14busa/incsearch.vim' "iMproved searching for vim
Plug 'scrooloose/nerdtree' "树形目录
Plug 'Xuyuanp/nerdtree-git-plugin' "nerdtree中显示git状态
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'scrooloose/syntastic' "语法检查
Plug 'kien/rainbow_parentheses.vim' "多彩括号匹配,例如对于lisp语言
Plug 'tpope/vim-surround' "is all about surroundings, parentheses, brackets, quotes, XML tags, and more
Plug 'kien/ctrlp.vim'   "file, buffer, MRU, tag, etc finder
Plug 'vim-airline/vim-airline' "powerline替代者
Plug 'vim-airline/vim-airline-themes' "airline 主题
Plug 'scrooloose/nerdcommenter' "注释助手
Plug 'xolox/vim-misc' "easytags依赖项
Plug 'xolox/vim-easytags' "tags生成器,避免使用ctags
Plug 'majutsushi/tagbar' "显示tagbar目录
Plug 'pangloss/vim-javascript' "js缩进语法支持
Plug 'mxw/vim-jsx' " jsx 语法高亮
Plug 'posva/vim-vue' " vue 语法高亮
Plug 'isRuslan/vim-es6' " ECMAScript 6语法高亮
Plug 'mtscout6/vim-tagbar-css' "css tagbar
Plug 'ervandew/supertab' "插入模式下Tab补全
Plug 'tpope/vim-repeat' "repeating
Plug 'godlygeek/tabular' "文本Tab补齐
Plug 'easymotion/vim-easymotion' "跳转提示
Plug 'haya14busa/incsearch-easymotion.vim' "incsearch-easymotion
Plug 'mattn/emmet-vim' "emmet.io; html:5 ==> <c-y>,
Plug 'SirVer/ultisnips' "Track the engine
Plug 'honza/vim-snippets' "代码片段
Plug 'Shougo/unite.vim' "find files, buffers, MRU
Plug 'mkitt/tabline.vim' "Tab line
Plug 'klen/python-mode' "Python mode
Plug 'nvie/vim-flake8' "Python代码规范利器
Plug 'davidhalter/jedi-vim' "Python代码补全
Plug 'othree/html5.vim' "html5代码补全
Plug 'plasticboy/vim-markdown' "markdown syntax
Plug 'groenewege/vim-less' "less syntax
Plug 'elzr/vim-json' "json syntax
Plug 'jlanzarotta/bufexplorer' "buffer浏览器
Plug 'neocomplcache-snippets_complete'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'fatih/vim-go' "golang开发套件
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-xmark'
Plug 'shawncplus/phpcomplete.vim'
Plug 'stanangeloff/php.vim'
Plug 'taglist.vim'
Plug 'rking/ag.vim' "超级ag搜索
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'"
Plug 'ashisha/image.vim'
Plug 'Konfekt/FastFold'
Plug 'mhinz/vim-startify'
Plug 'hoaproject/Contributions-Vim-Pp'
Plug 'jiangmiao/auto-pairs'
Plug 'artur-shaik/vim-javacomplete2' " Java 自动完成
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } "FZF文件搜索
Plug 'wakatime/vim-wakatime'

call plug#end()

"=======主题配置======"

set background=dark
colorscheme molokai
let g:molokai_original=1

"=============================================================================="
"                            Plugin configuration                              "
"=============================================================================="

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------
"====begin(NERDTree Keymap)===="
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif
nmap <leader>e :NERDTreeToggle<CR> 
"打开或关闭左侧目录树
let g:NERDTreeDirArrows=1
let g:NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
"====end(NERDTree Keymap)===="

"------------------------------------------------------------------------------
" NERDTree-git-plugin
"------------------------------------------------------------------------------
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "☭",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }


"------------------------------------------------------------------------------
" incsearch
"------------------------------------------------------------------------------
"====begin(incsearch Keymap)===="
map /  <Plug>(incsearch-forward)
" 开始向后查找
map ?  <Plug>(incsearch-backward)
" 开始向后查找
map g/ <Plug>(incsearch-stay)
" 未知

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
" 下一个匹配项
map N  <Plug>(incsearch-nohl-N)
" 上一个匹配项
map *  <Plug>(incsearch-nohl-*)
" 未知
map #  <Plug>(incsearch-nohl-#)
" 未知
map g* <Plug>(incsearch-nohl-g*)
" 未知
map g# <Plug>(incsearch-nohl-g#)
" 未知
"====end(incsearch Keymap)===="

"------------------------------------------------------------------------------
" easymotion
"------------------------------------------------------------------------------
"====begin(easymotion Keymap)===="
" You can use other keymappings like <C-l> instead of <CR> if you want to
" " use these mappings as default search and somtimes want to move cursor with
" " EasyMotion.
function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {
                \     "\<CR>": '<Over>(easymotion)'
                \ },
                \   'is_expr': 0
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
" 未知
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
" 未知
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
" 未知

map  / <Plug>(easymotion-sn)
" 向后查找
omap / <Plug>(easymotion-tn)
" 向后查找
map  n <Plug>(easymotion-next)
" 查找下一个匹配项
map  N <Plug>(easymotion-prev)
" 查找上一个匹配项

map <Leader>l <Plug>(easymotion-lineforward)
" 列出右侧待跳转字符
map <Leader>j <Plug>(easymotion-j)
" 列出下侧待跳转字符
map <Leader>k <Plug>(easymotion-k)
" 列出上侧待跳转字符
map <Leader>h <Plug>(easymotion-linebackward)
" 列出左侧待跳转字符

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"

let g:EasyMotion_smartcase = 1
"====end(easymotion Keymap)===="


"------------------------------------------------------------------------------
" Syntastic
"------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

"------------------------------------------------------------------------------
" Tagbar
"------------------------------------------------------------------------------
"====begin(Tagbar Keymap)===="
map <leader>t :TagbarToggle<CR>  
"打开或关闭右侧Tagbar
"===========Better Rainbow Parentheses======="
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"====end(Tagbar Keymap)===="

"------------------------------------------------------------------------------
" ultisnips
"------------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"------------------------------------------------------------------------------
" airline
"------------------------------------------------------------------------------
let g:airline_theme="dark" 
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"------------------------------------------------------------------------------
" rainbow_parentheses
"------------------------------------------------------------------------------
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['red',         'firebrick3'],
            \ ]


"------------------------------------------------------------------------------
" BufExplorer
"------------------------------------------------------------------------------
"====begin(BufExplorer Keymap)===="
" Shortcuts, type <leader>l to quickly navigate to necessary buffer
map <leader>bl :BufExplorer<cr>
" 打开buffer list
imap <leader>bl <esc>:BufExplorer<cr>
" 开打buffer list
vmap <leader>bl <esc>:BufExplorer<cr>
" 开打buffer list
"====end(BufExplorer Keymap)===="

"------------------------------------------------------------------------------
" Fugitive
"------------------------------------------------------------------------------
"====begin(Fugitive Keymap)===="
map ]] ]c
" 未知
map [[ [c
" 未
nmap <leader>gdi :Gdiff<cr>
" git diff
nmap <leader>gst :Gstatus<cr>
" git status
nmap <leader>gct :Gcommit<cr>
" git commit
nmap <leader>gph :Gpush
" git push
nmap <leader>gpl :Gpull
" git pull
nmap <leader>dup :diffupdate<cr>
" 未知
"====end(Fugitive Keymap)===="


"------------------------------------------------------------------------------
" NeoComplete
"------------------------------------------------------------------------------
"====begin(NeoComplete Keymap)===="

" Disable AutoComplPop.
let g:acp_enableAtStartup = 1

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
" 未知
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" 未知

function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 未知
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" 未知
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" 未知
inoremap <expr><C-y>  neocomplete#close_popup()
" 未知
inoremap <expr><C-c>  neocomplete#cancel_popup()
" 关闭提示框
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"====end(NeoComplete Keymap)===="

"------------------------------------------------------------------------------
" Vim-go
"------------------------------------------------------------------------------
"====begin(Vim-go Keymap)===="
let g:go_fmt_fail_silently = 1

au FileType go nmap <Leader>s <Plug>(go-implements)
" Show a list of interfaces which is implemented by the type under your cursor

au FileType go nmap <Leader>i <Plug>(go-info)
" Show type info for the word under your cursor

au FileType go nmap <Leader>gd <Plug>(go-doc)
" Open the relevant Godoc for the word under the cursor

au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" 未知

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" Open the Godoc in browser

au FileType go nmap <leader>r <Plug>(go-run)  
"go run
au FileType go nmap <leader>b <Plug>(go-build) 
"go build
"au FileType go nmap <leader>t <Plug>(go-test)
"go test
au FileType go nmap <leader>c <Plug>(go-coverage)
"====end(Vim-go Keymap)===="

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"------------------------------------------------------------------------------
" Markdown
"------------------------------------------------------------------------------
let g:mkdp_path_to_chrome = "google-chrome"
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

highlight clear SignColumn


"------------------------------------------------------------------------------
" Phpcomplete
"------------------------------------------------------------------------------
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 1
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1
let g:phpcomplete_mappings = {
            \  'jump_to_def': '<C-]>',
            \  'jump_to_def_split': '<C-W><C-]>',
            \  'jump_to_def_vsplit': '<C-W><C-\>',
            \}


let g:phpcomplete_add_class_extensions = ['mongo']
let g:phpcomplete_add_function_extensions = ['mongo']

"------------------------------------------------------------------------------
" Tabline
"------------------------------------------------------------------------------
"====begin(Tabline Keymap)===="
hi TabLine      term=reverse cterm=NONE  ctermfg=144  ctermbg=236  guibg=#232526     
hi TabLineFill  term=reverse cterm=NONE  ctermfg=144  ctermbg=236  guibg=#232526    
hi TabLineSel   term=reverse cterm=bold  ctermfg=238  ctermbg=208  gui=bold guifg=#455354 guibg=#DC6F23
nmap <Leader>1 1gt
" 跳转到第一个tab
nmap <Leader>2 2gt
" 跳转到第二个tab
nmap <Leader>3 3gt
" 跳转到第三个tab
nmap <Leader>4 4gt
" 跳转到第四个tab
nmap <Leader>5 5gt
" 跳转到第五个tab
nmap <Leader>6 6gt
" 跳转到第六个tab
nmap <Leader>7 7gt
" 跳转到第七个tab
nmap <Leader>8 8gt
" 跳转到第八个tab
nmap <Leader>9 9gt
" 跳转到第九个tab
"====end(Tabline Keymap)===="

"------------------------------------------------------------------------------
" vim-css-color
"------------------------------------------------------------------------------
let g:cssColorVimDoNotMessMyUpdatetime = 1

"------------------------------------------------------------------------------
"vim-jsx 
"------------------------------------------------------------------------------
let g:jsx_ext_required = 0
" gfn<tab> function* name(arg) { yield arg; }
" =><tab> (arg) => { ...  },
" class<tab> class name { constructor() { ... } }
" forof<tab> for (let value of arr) { ... }
" im<tab> import lib from 'Library'
" ex<tab> export default foo

"------------------------------------------------------------------------------
" Java complete2
"------------------------------------------------------------------------------
autocmd FileType java setlocal omnifunc=javacomplete#Complete " 严重影响java文件打开速度

" 设置classpath, javacomplete插件需要
let g:syntastic_java_javac_classpath='./bin/:/usr/local/java/lib/tools.jar:/usr/local/java/lib/dt.jar:/usr/local/java/lib/'
let g:JavaComplete_LibsPath='./bin/'
let g:JavaComplete_ImportOrder = ['java.', 'javax.', 'com.', 'org.', 'net.']
let g:JavaComplete_RegularClasses = ['java.lang.String', 'java.lang.Object', 'java.util.ArrayList']

"====begin(Java Keymap)===="

nmap <leader>xI <Plug>(JavaComplete-Imports-AddMissing)
" 添加缺少的包
nmap <leader>xR <Plug>(JavaComplete-Imports-RemoveUnused)
" 移除未用到的包
nmap <leader>xi <Plug>(JavaComplete-Imports-AddSmart)
" 未知
nmap <leader>xai <Plug>(JavaComplete-Imports-Add)
" 未知
imap <C-x>I <Plug>(JavaComplete-Imports-AddMissing)
" 添加缺少的包
imap <C-x>R <Plug>(JavaComplete-Imports-RemoveUnused)
" 移除未用到的包
imap <C-x>i <Plug>(JavaComplete-Imports-AddSmart)
" 未知
imap <C-x>ai <Plug>(JavaComplete-Imports-Add)
" 未知
nmap <leader>xM <Plug>(JavaComplete-Generate-AbstractMethods)
" 实现基类的抽象方法
imap <C-x>xM <Plug>(JavaComplete-Generate-AbstractMethods)
" 实现基类的抽象方法
nmap <leader>xA <Plug>(JavaComplete-Generate-Accessors)
" 生成访问器代码
nmap <leader>xs <Plug>(JavaComplete-Generate-AccessorSetter)
" 生成写访问器代码
nmap <leader>xg <Plug>(JavaComplete-Generate-AccessorGetter)
" 生成读访问器代码
nmap <leader>xa <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" 生成读写访问器代码
nmap <leader>xts <Plug>(JavaComplete-Generate-ToString)
" 生成toString()方法代码
nmap <leader>xeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
" 生成Equals()和HashCode()方法代码
nmap <leader>xc <Plug>(JavaComplete-Generate-Constructor)
" 生成构造函数代码
nmap <leader>xcc <Plug>(JavaComplete-Generate-DefaultConstructor)
" 生成默认构造函数代码
imap <C-x>s <Plug>(JavaComplete-Generate-AccessorSetter)
" 生成写访问器代码
imap <C-x>g <Plug>(JavaComplete-Generate-AccessorGetter)
" 生成读访问器代码
imap <C-x>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" 生成读写访问器代码
vmap <leader>xs <Plug>(JavaComplete-Generate-AccessorSetter)
" 生成写访问器代码
vmap <leader>xg <Plug>(JavaComplete-Generate-AccessorGetter)
" 生成读访问器代码
vmap <leader>xa <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" 生成读写访问器代码
"====end(Java Keymap)===="

"======代码缩进======="
filetype indent on " 自适应不同语言的智能缩进
set expandtab " 将制表符扩展为空格
set tabstop=4 " 设置编辑时制表符占用空格数
set shiftwidth=4 " 设置格式化时制表符占用空格数
set softtabstop=4 " 让 vim 把连续数量的空格视为一个制表符

"======配置重载======="
autocmd FileType html set shiftwidth=4|set expandtab
"autoload _vimrc(自动加载vimrc配置)
autocmd! bufwritepost [_.]vimrc source %

if exists('$TMUX')
    set term=screen-256color
endif
