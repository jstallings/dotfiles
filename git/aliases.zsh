
if [[ -s $HOME/.rvm/scripts/rvm ]]
then
  if $(which hub &> /dev/null) && [[ -s $HOME/.rvm/rubies/ruby-1.8.7-p352 ]]
  then
    alias git='$HOME/.rvm/rubies/ruby-1.8.7-p352/bin/ruby `which hub`'
  else
  fi
fi


alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gsa="git submodule add"
