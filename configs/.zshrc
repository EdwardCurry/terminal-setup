#!/bin/zsh
# ─── terminal-setup: Zsh config ─────────────────────────────────────
# Powered by: Starship + zsh-autosuggestions + zsh-syntax-highlighting + fzf + fnm

# ─── Homebrew ────────────────────────────────────────────────────────
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# ─── Starship prompt ────────────────────────────────────────────────
eval "$(starship init zsh)"

# ─── Zsh plugins (via Homebrew) ──────────────────────────────────────
# Syntax highlighting (must be before autosuggestions for best results)
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestions (fish-like suggestions)
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# Completions
if [[ -f /opt/homebrew/share/zsh-completions ]]; then
    fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi
autoload -Uz compinit && compinit

# ─── History ─────────────────────────────────────────────────────────
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# ─── fzf ─────────────────────────────────────────────────────────────
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
elif command -v fzf &>/dev/null; then
    eval "$(fzf --zsh 2>/dev/null)"
fi
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# Use fd for fzf if available
if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# ─── Zoxide (smart cd) ──────────────────────────────────────────────
eval "$(zoxide init zsh)"

# ─── fnm (Node version manager) ─────────────────────────────────────
eval "$(fnm env --use-on-cd --shell zsh)"

# ─── Aliases ─────────────────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias lt='eza --tree --icons --level=2'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias top='btop'
alias lg='lazygit'

# ─── pnpm ────────────────────────────────────────────────────────────
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
