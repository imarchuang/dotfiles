# AUTOCOMPLETION

# initialize autocompletion
autoload -U compinit && compinit

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gaa="git add --all"
alias gco="git checkout"
alias gcd="git checkout"
alias gcom="git checkout master"
alias grs="git checkout master & git pull"
alias gs="git status"
alias gcm="git commit --no-verify -m"
alias gmm="git merge master"
alias gp="git push"
alias gpf="git push --force"
alias gu="git pull"
alias bgsync="source ~/workspace_py/rippling-main/shell-cloud-dev.sh && start-remote-sync-bg"

usesub() {
  CURR="true"
  if [[ "$1" == "true" ]]
  then
    gsed -i 's/USE_SUBMODULES=false/USE_SUBMODULES=true/g' /Users/marc/workspace_py/rippling-main/app/startup_scripts/docker-entrypoint.sh
  else 
    gsed -i 's/USE_SUBMODULES=true/USE_SUBMODULES=false/g' /Users/marc/workspace_py/rippling-main/app/startup_scripts/docker-entrypoint.sh
  fi
}

chgnext() {
    gsed -i 's/def next(self):/def __next__(self):/g' /Users/marc/workspace_py/rippling-main/submodules/mongoengine/mongoengine/queryset/queryset.py
}

export REMOTE_PRIVATE_KEY_FILE="/Users/marc/.ssh/id_ed25519"

export DEVELOPER_NAME=marcrippling

export REMOTE_IP=marcrippling-private.ripplingtest.com

export PANTS_LINT=true

export NVM_DIR="$HOME/.nvm"              
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# poetry
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export SKIP_CHECK_VPN=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=40% --preview="cat {}" --preview-window=right:60%:wrap'
alias ai="gh copilot"
alias gcs="gh copilot suggest"
alias gce="gh copilot explain"
alias vim=/opt/homebrew/bin/vim

assume_role () {
   ROLE_ARN=$1
   echo "Assuming role with ARN $ROLE_ARN"
   CREDENTIALS=$(aws sts assume-role --role-arn $ROLE_ARN --role-session-name $(whoami) | jq -r '.Credentials')
   export AWS_ACCESS_KEY_ID=$(echo $CREDENTIALS | jq -r .AccessKeyId)
   export AWS_SECRET_ACCESS_KEY=$(echo $CREDENTIALS | jq -r .SecretAccessKey)
   export AWS_SESSION_TOKEN=$(echo $CREDENTIALS | jq -r .SessionToken)
   echo "Successfully assumed role!"
}

argo-proxy () {
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath={.data.password} | base64 -d | pbcopy
   echo "argocd password copied to clipboard"
   kubectl port-forward services/argocd-server -n argocd 8080:80
}

alias kc="kubectl"
alias kx="kubectx"
alias kns="kubens"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
alias tf="terraform"
