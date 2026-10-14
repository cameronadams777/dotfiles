# Aliases
alias vim="nvim"
alias gpf="git push origin HEAD --force-with-lease"
alias gph="git push origin HEAD"
alias gbr="git branch | grep -v 'master' | xargs git branch -D"
alias air="$(go env GOPATH)/bin/air"
alias redis="redis-cli"
alias mag="makeAndGo"
alias dae="deleteAllExcept"
alias npms="npm run"

# Kill all process on given port
function killport() { fuser -k -TERM $1/tcp }

function removeAllOf() { find . -name $1 -print0 | xargs -0 rm -rf }

function deleteAllExcept() { git branch | grep -v "$1" | xargs git branch -D }

function makeAndGo() { mkdir $1 && cd $1 }

function killProcess() { local pids=$(pgrep -f -- "$1") && sudo kill -9 ${=pids} }

function clearDir() { find . ! -type d -delete }

export EDITOR='nvim'

eval "$(starship init zsh)"

# Start ssh-agent once (shared across terminals) and load key
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-/tmp}/ssh-agent.socket"
ssh-add -l >/dev/null 2>&1
if [ $? -eq 2 ]; then
  rm -f "$SSH_AUTH_SOCK"
  eval "$(ssh-agent -s -a "$SSH_AUTH_SOCK")" >/dev/null
fi
ssh-add -l >/dev/null 2>&1 || ssh-add ~/.ssh/cameron
