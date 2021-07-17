"setting
"文字コードをUFT-8に設定
set encoding=utf-8
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-,eol:↲,extends:❯,precedes:❮
" Tab文字を半角スペースにする
"set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Space + Enterで行挿入
noremap <Space><CR> o<ESC>
"
set clipboard+=unnamed
" Deleteが効かなくならない様に
set backspace=indent,eol,start

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" paneの移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l

" tabの移動
nnoremap <C-l> gt
nnoremap <C-h> gT

"
nnoremap cc :set nonu nolist<CR>
nnoremap CC :set nu list<CR>

" colorschemeの設定
packadd! dracula
colorscheme dracula

" カーソルの設定
" 挿入モード時に点滅の縦棒タイプのカーソル
let &t_SI .= "\e[5 q"
" ノーマルモード時に点滅のブロックタイプのカーソル
let &t_EI .= "\e[1 q"
" 置換モード時に点滅の下線タイプのカーソル
let &t_SR .= "\e[3 q"

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/bundles')
  call dein#begin('$HOME/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
	call dein#add('scrooloose/nerdtree')
	call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
	call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
	"vueのシンタックスハイライト
	call dein#add('posva/vim-vue')
	"vim surrounding
	call dein#add('tpope/vim-surround')

	"閉じタグ自動補完
	call dein#add('alvan/vim-closetag')

	call dein#add('tpope/vim-surround')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue'
let html_no_rendering=1

"End dein Scripts-------------------------

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-e> :Files<CR>

