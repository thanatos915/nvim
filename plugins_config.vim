""""""""""""""""""""""""""""""
" => Plugins Autoload
""""""""""""""""""""""""""""""
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

Plug 'mileszs/ack.vim'
"Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kevinhwang91/rnvimr'

" Project Plugin
"Plug 'ahmedkhalf/project.nvim'
Plug 'mhinz/vim-startify'

" Taglist
Plug 'liuchengxu/vista.vim'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/taglist.vim'

" Color
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'theniceboy/nvim-deus'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-xtabline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" HTML,JSON,JS,PHP
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

" PHP Doc
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'

Plug 'junegunn/goyo.vim'

" Auto Code
"Plug 'ludovicchabant/vim-gutentags'

" Include Phpactor
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'phpactor/ncm2-phpactor'
" Git
Plug 'tpope/vim-fugitive'

" comment
Plug 'preservim/nerdcommenter'
" editor config
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-docker',
	\ 'coc-explorer',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-translator',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-pairs',
    \ 'coc-lists',
    \ 'coc-git',
	\ 'coc-yank']

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
call CocActionAsync('highlight')
if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
else
    call CocAction('doHover')
endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>= <Plug>(coc-diagnostictrue)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>m :CocCommand explorer<CR>
" 自动打开项目树
"autocmd User CocNvimInit :CocCommand explorer --no-toggle --no-focus

" coc-translator
nmap <leader>ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'David Chen'



" ===
" === FZF
" ===
set rtp+=/usr/bin/fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

"command! -bang -nargs=* PRg
"  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}), <bang>0)
"

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], 'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! RipgrepFzfE(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--exact', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], 'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction


command! -nargs=* -bang PRG call RipgrepFzf(<q-args>, <bang>0)

command! -nargs=* -bang PRGE call RipgrepFzfE(<q-args>, <bang>0)

nnoremap <leader>ff :Leaderf file<CR>
noremap <leader>1 :ProjectFiles<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <leader>rg :PRG<CR>
noremap <leader>2 :PRG<CR>
noremap <leader>3 :PRGE<CR>
noremap <C-e> :History<CR>
noremap <leader>bt :BTags<CR>
noremap <leader>fl :Lines<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

"let g:fzf_layout = { 'reverse': { 'width': 0.9, 'height': 0.8 } }
"let g:fzf_layout = { '': '60%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'relative': v:true  } }

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'alt-x': 'split',
  \ 'alt-v': 'vsplit' }

" ===
" === Leaderf
" ===
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0
let g:Lf_WorkingDirectoryMode = 'Ac'

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


" ===
" === Vista.vim
" ===
noremap <leader>V :Vista!!<CR>
noremap <c-\> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === fzf-gitignore
" ===
noremap <LEADER>g :FzfGitignore<CR>

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>

" ===
" === airline
" ===
let g:airline_theme = 'oceanicnext'


" ===
" === Goyo
" ===
let g:goyo_width = 120
let g:goyo_height = '100%'
map <LEADER>gy :Goyo<CR>


" ===
" === Gutentags
" ===
" let g:gutentags_enabled = 1
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称
" let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
" if !isdirectory(s:vim_tags)
   " silent! call mkdir(s:vim_tags, 'p')
" endif

" 配置 ctags 的参数 "
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" ===
" === ncm2
" ===
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect


" ===
" === nerdcommenter
" ===
"
" dd spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
noremap <silent> <C-c> :call nerdcommenter#Comment(0, 'toggle')<CR>


" ===
" === EditorCofig
" ===
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_verbose = 1


" ===
" === Php Doc
" ===
inoremap <leader>c <ESC>:call PhpDocSingle()<CR>i
nnoremap <leader>c :call PhpDocSingle()<CR>
vnoremap <leader>c :call PhpDocRange()<CR>
inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-p> :call PhpDocSingle()<CR>
vnoremap <C-p> :call PhpDocRange()<CR>

" 关闭自动添加注释.
autocmd FileType * setl fo-=cro
autocmd FileType php setl fo-=cro

map <F9>    :NERDTreeToggle<CR>
map <F10>   :TlistToggle<CR>


" taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 35
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
