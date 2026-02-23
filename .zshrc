fastfetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color
export EDITOR=nvim
export PATH="${PATH}:${HOME}/.local/bin/"


ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fast-syntax-highlighting zsh-autosuggestions zsh-eza)

alias ls="eza -al --color=auto --icons=always"
alias ec="sudo emerge -c"
alias cat="bat -pP"
alias cd="z"
alias vim="nvim"
alias svim="sudoedit"
alias p="sudo pacman -S --needed --noconfirm"
alias pss="pacman -Ss"
alias y="yay -S --needed --noconfirm"
alias yss="yay -Ss"
alias pr="sudo pacman -Rsnc"
# alias e="sudo emerge"
# alias ei="eix"
# alias eavudn="sudo emaint sync --auto ; sudo emerge -avuDN @world"
# pak() {
#   pkg=$1
#   shift
#   cat=${pkg%%/*}
#   print -r -- "$pkg $*" | sudo tee -a "/etc/portage/package.accept_keywords/$cat" > /dev/null
# }
# pu() {
#   pkg=$1
#   shift
#   print -r -- "$pkg $*" | sudo tee -a "/etc/portage/package.use/${pkg##*/}" > /dev/null
# }


eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=/home/fhasl/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

