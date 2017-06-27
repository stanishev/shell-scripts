set nocompatible

scriptencoding utf-8
set encoding=utf-8

set hidden
set history=1000

set list listchars=tab:\ \ ,trail:·

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set textwidth=80

set nowrap

set nohlsearch
set incsearch
set ignorecase
set smartcase

set complete=.,w,b,u,t

syntax on
set number
set ls=2

set splitright
set splitbelow

set colorcolumn=81
highlight ColorColumn ctermbg=7

set ruler

let loaded_matchparen = 1

set nofoldenable

if has("persistent_undo")
  silent !mkdir ~/.vim/tmp/undo > /dev/null 2>&1
  set undodir=~/.vim/tmp/undo
  set undofile
endif

set shellcmdflag=-ic

set nobackup
set noswapfile
set nowb

set wildmenu
set wildmode=longest,list

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.html.erb set ft=eruby
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.go set filetype=go

filetype plugin indent on

runtime ftplugin/man.vim

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

map <Leader>c :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
cmap w!! w !sudo tee > /dev/null %
map <silent> <Leader>w :bp \| :bd#<CR>

command RemoveTrailingSpaces %s/\s\+$//g

let g:netrw_banner = 0
let g:netrw_liststyle = 3

if executable('ag') && executable('tmux')
  fu! VrcbAg()
    let l:val = split(@", "\n")[0]
    let l:val = substitute(l:val, '"', '\\"', "g")
    let l:val = substitute(l:val, "'", '''\\''''', "g")
    silent exec ':!tmux split-window'
    silent exec ':!tmux send-keys "cd ' . getcwd() . '" C-m'
    silent exec ':!tmux send-keys "clear" C-m'
    silent exec ':!tmux send-keys "ag -Q ''' . l:val . '''" C-m'
  endf

  nmap <silent> <Leader>/ :call VrcbAg()<CR>
endif

" Vundle stuff {

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'vadimr/Vundle.vim'

Plugin 'nelstrom/vim-visual-star-search'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'thinca/vim-quickrun'
Plugin 'tyru/open-browser.vim'
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'tabular'
Plugin 'dhruvasagar/vim-table-mode'

call vundle#end()
filetype plugin indent on

" } Vundle stuff.

" ctrlp

let g:ctrlp_custom_ignore = {
\ 'dir':  '\v\/(\.git|build|target|tmp|vendor|public\/assets|public\/uploads)$',
\ 'file': '\v\.(o|so)$',
\ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 'EVH'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_open_multiple_files = '2vjr'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_bufpath_mod = ':.:h'
let g:ctrlp_bufname_mod = ':t'

nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>m :CtrlPMRU<CR>

" Quick run
nmap <Leader>r :QuickRun<CR>

" open-browser
nmap <Leader>s <Plug>(openbrowser-smart-search)
vmap <Leader>s <Plug>(openbrowser-smart-search)

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
