# 🖥️ terminal-setup

One-script macOS terminal environment setup. Run on a fresh Mac, get a fully configured terminal in minutes.

<p align="center">
  <img src="assets/ghostty.png" width="120" alt="Ghostty">
  &nbsp;&nbsp;&nbsp;
  <img src="assets/fish.png" width="120" alt="Fish Shell">
  &nbsp;&nbsp;&nbsp;
  <img src="assets/starship.png" width="120" alt="Starship">
</p>

## Choose Your Shell

| | 🐟 Fish | 🐚 Zsh |
|---|---------|---------|
| **POSIX** | ❌ Own syntax | ✅ Compatible |
| **Autosuggestions** | ✅ Built-in | ✅ via plugin |
| **Syntax Highlighting** | ✅ Built-in | ✅ via plugin |
| **Node Manager** | nvm.fish (Fisher) | nvm (official) |
| **Config** | `~/.config/fish/config.fish` | `~/.zshrc` |
| **Best for** | Clean defaults, no fuss | Scripting, POSIX compat |

## Stack

| Component | What |
|-----------|------|
| **Ghostty** | Terminal emulator |
| **Fish** or **Zsh** | Shell (your choice) |
| **Starship** | Prompt with Catppuccin Mocha theme |
| **MesloLGS NF** | Nerd Font |
| **bat** | Better `cat` with syntax highlighting |
| **eza** | Better `ls` with icons |
| **fd** | Better `find` |
| **ripgrep** | Better `grep` |
| **fzf** | Fuzzy finder (Ctrl+R / Ctrl+T / Alt+C) |
| **btop** | System monitor |
| **zoxide** | Smart `cd` |
| **jq** | JSON processor |
| **tldr** | Simplified man pages |
| **delta** | Better git diffs |
| **lazygit** | Git TUI |
| **nvm** / **nvm.fish** | Node version manager |

## Quick Start

```bash
# Clone and run (interactive shell choice)
git clone https://github.com/lewislulu/terminal-setup.git
cd terminal-setup
chmod +x setup.sh
./setup.sh

# Or pick directly:
./setup.sh --fish    # Fish shell
./setup.sh --zsh     # Zsh + fish-like plugins
```

Or one-liner:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lewislulu/terminal-setup/main/setup.sh)
```

## What It Does

1. Installs **Homebrew** (if needed)
2. Installs **Ghostty** terminal
3. Downloads **MesloLGS NF** nerd fonts
4. Installs your **shell** of choice + plugins
5. Installs all **CLI tools** via brew (including fzf)
6. Installs **Starship** prompt with Catppuccin Mocha config
7. Installs **Node.js** LTS (nvm for Zsh / nvm.fish for Fish)
8. Deploys all config files (with backups of existing ones)

## Aliases / Abbreviations

| Shortcut | Expands To |
|----------|-----------|
| `ls` | `eza --icons --group-directories-first` |
| `ll` | `eza -la --icons --group-directories-first` |
| `lt` | `eza --tree --icons --level=2` |
| `cat` | `bat` |
| `find` | `fd` |
| `grep` | `rg` |
| `top` | `btop` |
| `lg` | `lazygit` |

## fzf Keybindings

| Key | What |
|-----|------|
| `Ctrl+R` | Fuzzy search command history |
| `Ctrl+T` | Fuzzy find files |
| `Alt+C` | Fuzzy cd into directory |

## Zsh Extras

When using the Zsh option, you get fish-like features via plugins:

- **zsh-autosuggestions** — inline suggestions from history (accept with →)
- **zsh-syntax-highlighting** — real-time command highlighting
- **zsh-completions** — additional completion definitions

## License

MIT
