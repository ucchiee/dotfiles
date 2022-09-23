source $ZDOTDIR/zshrc
# profile
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
