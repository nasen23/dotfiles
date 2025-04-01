bindkey -e
test -e "${HOME}/.profile" && source "${HOME}/.profile"
export PATH="$HOME/.local/bin:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

zinit light z-shell/F-Sy-H
fast-theme CONFIG:catppuccin-latte > /dev/null

### End of Zinit's installer chunk

autoload -Uz compinit && compinit
setopt autocd

which exa > /dev/null && alias ls=exa
eval "$(zoxide init zsh)" && which z > /dev/null && alias cd=z
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
which direnv > /dev/null && eval "$(direnv hook zsh)"

# kitty specific
if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
  alias icat="kitty +kitten icat"
fi

# wezterm specific
if [[ $TERM_PROGRAM == "WezTerm" ]]; then
  alias nvim="env TERM=wezterm nvim"
  alias wezmux="wezterm cli spawn --domain-name"
  zinit snippet https://github.com/wez/wezterm/raw/main/assets/shell-integration/wezterm.sh
fi

# iTerm2 specific
if [[ $LC_TERMINAL == "iTerm2" ]]; then
  zinit snippet https://iterm2.com/shell_integration/zsh
fi

notify() {
  if [[ $TERM == "xterm-kitty" ]]; then
    if [[ $2 == "" ]]; then
      printf '\x1b]99;;'"$1"'\x1b\\'
    else
      printf '\x1b]99;i=1:d=0;'"$1"'\x1b\\'
      printf '\x1b]99;i=1:d=1:p=body;'"$2"'\x1b\\'
    fi
  fi
}

unset_proxy() {
  export http_proxy=; export https_proxy=; export all_proxy=;
}

if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
export TERM=xterm-256color
fi
