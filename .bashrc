source ~/.git-prompt.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/jason.ullman/ifit/personal-feed-service/node_modules/tabtab/.completions/serverless.bash ] && . /Users/jason.ullman/ifit/personal-feed-service/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/jason.ullman/ifit/personal-feed-service/node_modules/tabtab/.completions/sls.bash ] && . /Users/jason.ullman/ifit/personal-feed-service/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/jason.ullman/ifit-repos/wolf-workouts-service/node_modules/tabtab/.completions/slss.bash ] && . /Users/jason.ullman/ifit-repos/wolf-workouts-service/node_modules/tabtab/.completions/slss.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
