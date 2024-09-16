source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

zstyle :omz:plugins:ssh-agent identities $HOME/.ssh/github/id_rsa $HOME/.ssh/id_rsa $HOME/.ssh/github/id_rsa_0xD1E03DD0EB77D1BD0C0F

source_me () {
    if test -r "$1"; then
        source "$1"
    fi
}

plugins=(
    git
    ssh-agent
    zsh-autosuggestions
)

source ~/.zshenv
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/aliases.zsh ]] || source ~/aliases.zsh
# [[ ! -f ~/.dotfiles/aliases.zsh]] || source ~/aliases.zsh || true

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '\t' autosuggest-accept
# setopt APPEND_HISTORY
# setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt NO_BEEP

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

source ~/.nvm/nvm.sh

# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
source ~/powerlevel10k/powerlevel10k.zsh-theme
