alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias migrate="sequelize db:migrate"
alias migrate:undo="sequelize db:migrate:undo"
alias migrate:status="sequelize db:migrate:status"
alias g:migration="sequelize migration:generate --name "
alias seed="sequelize db:seed:all"
alias seed:undo="sequelize db:seed:undo --seed "
alias g:seed="sequelize seed:generate --name "
alias ms="migrate && seed"
alias git:prune="git gc --prune=now"
alias git:undo="git reset HEAD^"
alias git:undo-undo="git reset 'HEAD@{1}'"
alias git:log="git log --graph --pretty=format:'%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %C(green)%cn <%ce>%Creset %s'"

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M' 
zstyle ':vcs_info:*' unstagedstr 'M' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git 
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{1}??%f'
fi
}


precmd () { vcs_info }
PROMPT='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_} %f
%% '

source ~/.nvm/nvm.sh

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit