call plug#begin('~/.vim/plugged')
"Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty' " Plug 'ianks/vim-tsx'

Plug 'scrooloose/nerdtree'

Plug 'jiangmiao/auto-pairs'
Plug 'miyakogi/conoline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-visual-star-search'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Allow buffers to be hidden with unsaved changes
set hidden

syntax on
colorscheme dracula

" prevent cursor moving when pressing space(leader)
noremap <Space> <Nop>
let mapleader = " "

" formatting
	" tabs
set sts=2
set ts=2
set sw=2

set foldcolumn=8
" set relativenumber
set number


"turn off annoying beep
" set visualbell 
" set t_vb=

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
set wildignore+=**/node_modules/**
" Now we can:
"  - hit tab to :find by partial match
"  - use * to make it fuzzy
"  - :b lets you autocomplete any open buffer

"  Set Mouse scroll and visual drag/select
set mouse=nicr
set mouse=a

set ignorecase
set smartcase

" allows gf to work
set suffixesadd=.js,.ts,.tsx,.jsx


" For coc completion
" enter selects suggestion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" triggers selection	
inoremap <silent><expr> <c-space> coc#refresh()
" enter selects first option without selecting it
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" enable current line highlighting (plugin)
let g:conoline_auto_enable = 1

" Snippets
" console.log()
" nnoremap <silent><Leader>,s :-1read $HOME/snippets.txt<CR>f)i
nnoremap ,cl :-1read $HOME/snippets.txt<CR>f)i
inoremap ,cl <Esc>:-1read $HOME/snippets.txt<CR>f)i

" temp nnoremap <silent><Leader>l :nohlsearch<CR>

command! -nargs=0 P :CocCommand prettier.formatFile



" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Shortcut for fzf GFiles (opens all files tracked by git)
" command F GFiles
" Format with Prettier
" command P Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open splits to the left and below
set splitbelow
set splitright

" ctrlp honors gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" fix: ensures file contents are cleared when exiting vim / clears terminal
if &term =~ "ansi"
    let &t_ti = "\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l"
endif

nnoremap <Leader>r :CocRestart<CR><CR>
" clear highlighted search
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" nnoremap <C-_> :nohlsearch<CR>
nnoremap <silent><Leader>l :nohlsearch<CR>

" From find and replace video
" Launch fzf with CTRL+P
nnoremap <silent> <C-p> :FZF -m<CR>
" Launch Rg > FZF with CTRL+F
nnoremap <C-s> :Rg 

" Enter command mode with Leader+Enter
nnoremap <Leader><CR> :

" Allow passing optional flags into the Rg command.
" Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)
