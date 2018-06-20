#enable tab completion
autoload -U compinit
compinit

export EDITOR=vim

export HISTSIZE=20000
export HISTFILE="$HOME/.zhistory"
export SAVEHIST=HISTSIZE

setopt append_history
setopt extended_history
setopt hist_ignore_space
setopt inc_append_history
setopt share_history


setopt autocd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt menu_complete
#path
export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
export PATH=".git/safe/../../bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"

eval "$(rbenv init - zsh)"

bindkey -v
bindkey '^R' history-incremental-search-backward

#prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M'
zstyle ':vcs_info:*' unstagedstr 'M'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}(%F{2}%b%F{5}) %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    hook_com[unstaged]+='%F{1}??%f'
  fi
}

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
precmd () { vcs_info }
PROMPT='${vcs_info_msg_0_} %f% $(kube_ps1) %f%# '

function zle-line-init zle-keymap-select {
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select

VIM_PROMPT="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
stty stop undef
stty start undef

alias rake="noglob rake"

#Ruby
alias be='bundle exec'

#Homebrew
alias bu='brew update'
alias bi='brew install'
alias bU='brew upgrade'

#aliases directories/navigation
alias d='cd ~/.dotfiles'
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

##docker
alias dcu='docker-compose up'

##kubernetes
alias k=kubectl
alias kgb=kubectl get pods

##git
alias g=git
alias ga='git add'
alias gA='git add .'
alias gAc='git add . && git commit --verbose'
alias gbc='git checkout -b'
alias gbx='git branch -d'
alias gbX='git branch -D'
alias gc='git commit --verbose'
alias gcm='git commit -m'
alias gco='git checkout'
alias gf='git fetch'
alias glg='git log --topo-order --all --graph --pretty=format:"%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n"'
alias gm='git merge'
alias grH='git reset --hard HEAD'
alias gp='git push'
alias gpA='gp && gpt'
alias gpt='git push --tags'
alias gr='git rebase'
alias grm='git rebase master'
alias gs='git status --short'
alias gt='git tag'
alias gtf='git tag -f'
alias gX='git clean -df'

#kuberenetes
alias k=kubectl
alias kgp='kubectl get pods'

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
##common operations
alias l='ls -lFh'
alias ll='ls -lt'

alias zU='source ~/.zshrc'
##history

alias h='history'

function hs
{
  history | grep $*
}


##vim
alias v=vim



#client aliases (move these to a gitignore local file)
alias smart="cd $HOME/Development/SmartScreen/"
alias tapthere="cd $HOME/Development/TapThere"

#. `brew --prefix`/etc/profile.d/z.sh
source /usr/local/share/zsh/site-functions/_aws


#general aliases
alias me="cd ~/Dropbox/Shared/me"

#powerline setup
powerline-daemon -q
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

_tmuxinator() {
  local commands projects
  commands=(${(f)"$(tmuxinator commands zsh)"})
  projects=(${(f)"$(tmuxinator completions start)"})

  if (( CURRENT == 2 )); then
    _describe -t commands "tmuxinator subcommands" commands
    _describe -t projects "tmuxinator projects" projects
  elif (( CURRENT == 3)); then
    case $words[2] in
      copy|debug|delete|open|start)
        _arguments '*:projects:($projects)'
      ;;
    esac
  fi

  return
}

compdef _tmuxinator tmuxinator mux
alias mux="tmuxinator"


