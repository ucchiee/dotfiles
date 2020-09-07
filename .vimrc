set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

"----------------------------------------------------------
" NeoBundle
"----------------------------------------------------------
" jjでESCと同じ
inoremap jj <esc>
" カーソル移動
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^i

"----------------------------------------------------------
" dein
"----------------------------------------------------------
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.cache/dein/repos/github.com/Shougo/dein.vim"))
        echo "install dein..."
        " :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
        :call system("curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh")
        :call system("sh ./installer.sh ~/.cache/dein")
        :call system("rm installer.sh")
    endif
endif


if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " color scheme
    call dein#add('tomasr/molokai')
    call dein#add('joshdick/onedark.vim')
    call dein#add('kuroitu/pyceberg')
    " カラースキームmolokai/onedark
    call dein#add('tomasr/molokai')
    call dein#add('joshdick/onedark.vim')
    call dein#add('kuroitu/pyceberg')
    call dein#add('cocopon/iceberg.vim')
    " ステータスラインの表示内容強化
    call dein#add('itchyny/lightline.vim')
    " インデントの可視化
    call dein#add('Yggdroot/indentLine')
    " 末尾の全角半角空白文字を赤くハイライト
    call dein#add('bronson/vim-trailing-whitespace')
    " 構文エラーチェック
    call dein#add('scrooloose/syntastic')
    " 多機能セレクタ
    call dein#add('ctrlpvim/ctrlp.vim')
    " CtrlPの拡張プラグイン. 関数検索
    call dein#add('tacahiroy/ctrlp-funky')
    " CtrlPの拡張プラグイン. コマンド履歴検索
    call dein#add('suy/vim-ctrlp-commandline')
    " CtrlPの検索にagを使う
    call dein#add('rking/ag.vim')
    " プロジェクトに入ってるESLintを読み込む
    call dein#add('pmsorhaindo/syntastic-local-eslint.vim')
    " かっこなどの自動保管
    call dein#add('mattn/vim-lexiv')
    " コメントアウト
    call dein#add('tyru/caw.vim')
    " syntax hightlight
    call dein#add('sheerun/vim-polyglot')
    " deinも管理
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    " 補完
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    let g:deoplete#enable_at_startup = 1

    " スニペット
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    " git関連
    call dein#add('airblade/vim-gitgutter')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-rhubarb')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
if dein#check_install()
    call dein#install()
endif

"----------------------------------------------------------
" カラースキーム
"----------------------------------------------------------
"molokai
" if neobundle#is_installed('molokai')
"     colorscheme molokai " カラースキームにmolokaiを設定する
" endif
"
" set t_Co=256 " iTerm2など既に256色環境なら無くても良い
" syntax enable " 構文に色を付ける
"
" onedark
syntax on
colorscheme onedark

" pyceberg
" syntax on
" colorscheme pyceberg

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

"----------------------------------------------------------
" ステータスライン
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの位置を表示する

"----------------------------------------------------------
" コマンドモード
"----------------------------------------------------------
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

"----------------------------------------------------------
" 文字列検索
"----------------------------------------------------------
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

"----------------------------------------------------------
" マウスでカーソル移動とスクロール
"----------------------------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"----------------------------------------------------------
" クリップボードからのペースト
"----------------------------------------------------------
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"----------------------------------------------------------
" deoplete・neosnippetの設定
"----------------------------------------------------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"----------------------------------------------------------
" Syntastic
"----------------------------------------------------------
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" Javascript用. 構文エラーチェックにESLintを使用
let g:syntastic_javascript_checkers=['eslint']
" Javascript以外は構文エラーチェックをしない
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': [] }

"----------------------------------------------------------
" CtrlP
"----------------------------------------------------------
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用

" CtrlPCommandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())

" CtrlPFunkyの絞り込み検索設定
let g:ctrlp_funky_matchtype = 'path'

if executable('ag')
  let g:ctrlp_use_caching=0 " CtrlPのキャッシュを使わない
  let g:ctrlp_user_command='ag %s -i --hidden -g ""' " 「ag」の検索設定
endif

"----------------------------------------------------------
" lightline
"----------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
