if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin

# Starship prompt
source (/opt/homebrew/bin/starship init fish --print-full-init | psub)

# fnm (Node version manager)
fnm env --use-on-cd --shell fish | source

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
