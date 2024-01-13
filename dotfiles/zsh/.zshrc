# Fig pre block.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Oh-My-Zsh configuration.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"

# Key bindings.
bindkey -v

# Uncomment lines below to enable specific settings.
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' frequency 13
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"

# Plugins.
plugins=(git z vi-mode)
source $ZSH/oh-my-zsh.sh

# Aliases.
alias czsh="code ~/.zshrc"
alias s="source ~/.zshrc"
alias stmux="tmux source-file ~/.tmux.conf"
alias l='exa -lah'
alias ls=exa
alias sl=exa
alias o="open ."

# NVM configuration.
source ~/.nvm/nvm.sh
nvm use 18

# Starship prompt.
eval "$(starship init zsh)"

# Additional PATH configuration.
export PATH="/usr/local/share/dotnet:$PATH"

# pnpm configuration.
export PNPM_HOME="$HOME/.pnpm/store"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Auto-start tmux if not already in a tmux session.
if [ -z "$TMUX" ]; then
  exec tmux
fi

# NVM bash completion.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Fig post block.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# bun completions.
[ -s "/Users/gmoreli/.bun/_bun" ] && source "/Users/gmoreli/.bun/_bun"

# bun configuration.
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
