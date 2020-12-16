# homeのbinを追加
PATH=$PATH:~/bin
# pure関連
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
# change the path color
zstyle :prompt:pure:path color white
# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan
# turn on git stash status
zstyle :prompt:pure:git:stash show yes
prompt pure
# テーマ読み込み
# source ~/dotfiles/zsh-my-theme.sh
# Tabで選択できるように
zstyle ':completion:*:default' menu select=2
# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u
# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
setopt auto_param_slash       # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_menu              # 補完キー連打で順に補完候補を自動で補完
setopt interactive_comments   # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst      # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word       # 語の途中でもカーソル位置で補完
setopt print_eight_bit        # 日本語ファイル名等8ビットを通す
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt share_history          # 他のターミナルとヒストリーを共有
setopt histignorealldups      # ヒストリーに重複を表示しない
setopt hist_save_no_dups      # 重複するコマンドが保存されるとき、古い方を削除する。
setopt extended_history       # $HISTFILEに時間も記録
setopt print_eight_bit        # 日本語ファイル名を表示可能にする
setopt hist_ignore_all_dups   # 同じコマンドをヒストリに残さない
setopt auto_cd                # ディレクトリ名だけでcdする
setopt no_beep                # ビープ音を消す
# コマンドを途中まで入力後、historyから絞り込み
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

alias sl='ls'
alias l='ls -ltrG'
alias la='ls -laG'
alias ll='ls -lG'
alias ls='ls -G'
alias grep='grep --color=auto'
alias ...='cd ../../'
alias his='history -E -i 1 | fzf'
alias gi='git init'
alias ga='git add'
alias gc='git commit'
alias gps='git push'
alias gpl='git pull'
alias gck='git checkout'
alias gs='git branch;git status'
alias gb='git branch'
alias gd='git diff'
alias g='git'
alias gt='git tree'
alias gcl='git clone'
alias G='grep'
alias jn='jupyter notebook'
alias jl='jupyter lab'
alias f='cd ~/Documents/nagase/program/git/'
alias j='cd ~/Documents/TokyoTech/jk3/4q'
alias k='cd ~/Documents/TokyoTech/DeepLab/workspace'
alias d='cd ~/Documents/recruit/git'
alias c='clear'
alias ggl='open -a google\ chrome'
alias jk='ssh -ND 1080 titech-computing-room'
alias jkjk='ssh titech-computing-room'
alias syssoft='cd ~/class/os/xv6-riscv&&docker run -it --rm -v $(pwd):/home/xv6/xv6-riscv wtakuo/xv6-env'
alias vvim='vim -u NONE -N'
alias n='nvim'

## tmux gitの情報を載せるためのもの
function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}

# anyenv
eval "$(anyenv init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

