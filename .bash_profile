# Enable tab completion
source ~/git-completion.bash
source ~/.bashrc


# check for NVM version use
checkNVM() {
  if [[ -f .nvmrc ]] ; then
    A=$( cat .nvmrc )
    A="v$A"
    B=$( nvm current 2>&1 )

    # only get B equal to length of A
    B=${B:0:${#A}}

    if [[ $A != $B ]] ; then echo "nvm use $A" && nvm use > /dev/null ; fi ;
  fi ;
}
checkNVM

# changes node version thru `nvm use`
cd() {
  builtin cd "$@" ; checkNVM
}

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
cyan="\[\033[0;36m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory

# old setting
# export PS1="$cyan\u$cyan\$(__git_ps1)$cyan \W$ $reset"
export PS1="$cyan\W$cyan\$(__git_ps1) : $reset"

# alias vi='nvim'
export NODE_PATH="/Users/jason.ullman/ifit-repos/ifit"
export REVIEW_BASE="test"

alias cdpfw="cd ~/ifit-repos/personal-feed-webview"
alias cdufs="cd ~/ifit-repos/user-feed"
alias vimrc="nvim ~/.config/nvim/init.vim"

alias cdap="cd ~/ifit-repos/admin-portal"

alias cdwlw="cd ~/ifit-repos/wolf-library-webview"
alias cdwls="cd ~/ifit-repos/wolf-library-service"

alias cdwws="cd ~/ifit-repos/wolf-workouts-service"
alias cdwww="cd ~/ifit-repos/wolf-workouts-webview"

alias cdheckle="cd ~/ifit-repos/heckle"

alias yas="yarn start"
alias yat="yarn test"
alias yacr="yarn coverage:report"

# find and kill running mongod process
alias killmongo='kill -2 `pgrep mongo`'
alias scratchopen='cd ~/Documents/scratch/ && code . && code ./scratch.js'
alias scratch='node ~/Documents/scratch/scratch.js'
alias killtraps='cd ~/Documents/scripts/ && ./killtraps'

export PHANTOMJS_BIN=/usr/local/bin/phantomjs

export PATH="$HOME/.cargo/bin:$PATH"

# For better searching
# requires https://github.com/junegunn/fzf
# requires https://github.com/BurntSushi/ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!{.git,node_modules}'"
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"


alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
