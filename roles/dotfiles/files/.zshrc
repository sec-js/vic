export ZSH=$HOME/.oh-my-zsh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

ZSH_THEME="avit"
plugins=(git)


export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=~/.local/bin:$PATH


#
# Other
#

source $HOME/.zsh/aliases
source $HOME/.zsh/colors
source $HOME/.zsh/exports
source $HOME/.zsh/functions
source $HOME/.zsh/path
source $HOME/.zsh/vars
source $HOME/.zsh/plugins

#
# Hooks
#

autoload -U add-zsh-hook

function auto-ls-after-cd() {
  emulate -L zsh
  # Only in response to a user-initiated `cd`, not indirectly (eg. via another
  # function).
  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
    ls -a
  fi
}

add-zsh-hook chpwd auto-ls-after-cd

#
# Correction
#

# exceptions to auto-correction
alias bundle='nocorrect bundle'
alias cabal='nocorrect cabal'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias stack='nocorrect stack'
alias sudo='nocorrect sudo'
alias itau-forms='cd /Users/vmartins/Documents/work/itau-forms/'
alias cartoes='cd /Users/vmartins/Documents/work/cartoes.itau.com.br'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
