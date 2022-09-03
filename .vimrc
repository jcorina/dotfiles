" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'junegunn/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number

"" Config Stuff Start
set nocompatible " be iMproved
syn on "turn on syntax highlighting
filetype indent on "smart indents based on filetypes
set ai "auto indents
set nu "show line numbers
set ic "case insensitive searches
set autoread " automatically reload file on changes
set smartcase "smart case searches, defaults to ic, if has caps, use it
"set incsearch "incremental search
set nois " turn off damn inc search

"set tabstop=4 "tabs set to 4 spaces
"set shiftwidth=4 "indents also 4 spaces
"set shiftround "indent rount to next shiftwidth
"set noexpandtab "dont change all new tabs to spaces
"
" for nick
set ts=2
set shiftwidth=2
set et
set cursorline

set backspace=indent,eol,start "smart-er backspaces
set ww=b,s,h,l,<,>,[,] "set (b)ackspace, (s)pace, and arrows to jump lines
set wildmenu " visual autocomplete for command menu
set tags=./tags;/
set bg=dark " colorscheme
filetype plugin on
" w!! to save as root
cmap w!! w !sudo tee % >/dev/null
" caps are hard
:command WQ wq
:command Wq wq
:command W w
:command Q q
"" Config Stuff End


" Rainbow Parens
autocmd VimEnter * RainbowParentheses

" coc.nvim
nmap <silent> <C-d> <Plug>(coc-definition)
nmap <silent> <C-r> <Plug>(coc-references)
"nn <silent> hv :call CocLocations('ccls','$ccls/vars')<cr>
nnoremap <silent><Leader><C-d> :call CocAction("jumpDefinition", "tabe")<cr>

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

"" ctags bindings
":nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
" fix syntax highlighting issues
syntax sync fromstart
set nocompatible

"let g:node_client_debug = 1
"let $NODE_CLIENT_LOG_FILE = '/tmp/logfile'


hi Pmenu ctermfg=250 ctermbg=236 guifg=#BBBBBB guibg=#2D2D30
hi PmenuSel ctermfg=250 ctermbg=24 guifg=#BBBBBB guibg=#073655
hi PmenuSbar ctermbg=237 guibg=#3D3D40
hi PmenuThumb ctermbg=250 guibg=#BBBBBB

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
