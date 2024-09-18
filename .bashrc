export EDITOR='vim'
export REPOS='$HOME/repos'
# --- prompt --- #
__ps1() {
  local P='$' dir="${PWD##*/}" B \
    r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$b($B) "

  PS1="$b$dir $B$p$P$x "
}

PROMPT_COMMAND="__ps1"
alias dot='cd $REPOS/dotfiles'
alias repos='cd $REPOS'
alias ls='ls -h --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias da="cd ~/Repositories/DatingApp"
alias .....="cd ../../../.."
alias vim='$EDITOR'
alias pls='sudo '

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
source <(ng completion script)
