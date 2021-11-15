set clipboard+=unnamedplus
if !exists('g:vscode')
    " __  ____   __  _   ___     _____ __  __ ____   ____
    "|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
    "| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
    "| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
    "|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

    " Author: @thanatos

    " ====================
    " === Editor Setup ===
    " ====================
    " ===
    " === System
    " ===
    let g:clipboard = {
                \   'name': 'win32yank-wsl',
                \   'copy': {
                    \      '+': 'win32yank.exe -i --crlf',
                    \      '*': 'win32yank.exe -i --crlf',
                    \    },
                    \   'paste': {
                        \      '+': 'win32yank.exe -o --lf',
                        \      '*': 'win32yank.exe -o --lf',
                        \   },
                        \   'cache_enabled': 0,
                        \ }
    let &t_ut=''

    " 记住多少行操作历史
    set history=500
    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " 自动加载外部文件更新
    set autoread
    au FocusGained,BufEnter * checktime

    let mapleader = ","

    " 快速保存
    nmap <leader>w :w!<cr>

    syntax on
    set cursorline
    set hidden
    set exrc
    set secure
    " 自动切换当前目录为当前文件所在的目录
    set autochdir
    set autoread

    " 智能缩进
    set autoindent
    " 显示行号
    set number
    " 过长自动折行
    set wrap
    set showmatch
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    " Tab 替换成空格
    set expandtab
    set autowrite
    set showcmd
    set t_Co=256
    " 始终显示当前位置
    set ruler

    " 命令行高度
    set cmdheight=1

    " A buffer becomes hidden when it is abandoned
    set hid

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " 智能搜索 输入一个字符马上自动匹配,而不是输入完再查找
    set incsearch
    " Highlight search results
    set hlsearch
    " 搜索时忽略大小写
    set ignorecase

    " 出错时候没有声音
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500
    " 设置没有备份
    set nobackup
    set nowb
    set noswapfile

    " 忽略编译文件
    set wildignore=*.o,*~,*.pyc
    if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
    else
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    endif


    " =====================
    " === Mapping Setup ===
    " =====================
    " 窗口移动
    :nnoremap q <c-v>
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " 关闭当前 buffer
    map <leader>bd :Bclose<cr>:tabclose<cr>gT

    " Tab切换快捷键
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove
    map <leader>t<leader> :tabnext
    noremap th :-tabnext<CR>
    noremap tl :+tabnext<CR>

    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Bash like keys for the command line
    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

    " Resize splits with arrow keys
    noremap <leader><up> :res +5<CR>
    noremap <leader><down> :res -5<CR>
    noremap <leader><left> :vertical resize-5<CR>
    noremap <leader><right> :vertical resize+5<CR>

    map <C-s> :w<CR>
    imap <C-s> <C-o>:w<CR>

    " =====================
    " === Plugins Setup ===
    " =====================
    source $XDG_CONFIG_HOME/nvim/plugins_config.vim


    " =====================
    " === UI Setup      ===
    " =====================
    colorscheme material
    if (has('termguicolors'))
      set termguicolors
    endif
    "let g:material_theme_style = 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
    let g:material_theme_style = 'default'
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
    xnoremap <C-c> <Cmd>call VSCodeNotify('editor.action.clipboardCopyAction')<CR>
    nnoremap <C-c> <Cmd>call VSCodeNotify('editor.action.clipboardCopyAction')<CR>
    nnoremap <C-v> <Cmd>call VSCodeNotify('editor.action.clipboardPasteAction')<CR>
    noremap <C-v> <Cmd>call VSCodeNotify('editor.action.clipboardPasteAction')<CR>
endif
