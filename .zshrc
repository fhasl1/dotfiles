autoload -U colors && colors
autoload -Uz compinit
compinit

fastfetch

cat ~/.cache/wal/sequences
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-vim-mode/zsh-vim-mode.plugin.zsh
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export TERM=xterm-256color
export EDITOR=nvim
export PATH="${PATH}:${HOME}/.local/bin/"
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

setopt HIST_IGNORE_ALL_DUPS
unsetopt hist_verify
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

export STARSHIP_CONFIG="$HOME/.config/starship.toml"

[[ -f ~/.zsh-aliases ]] && source ~/.zsh-aliases
