# ========== Oh-my-zsh cinfig ==========
export ZSH="$HOME/.oh-my-zsh"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ========== Config ==========

plugins=(git zsh-autosuggestions)

# Loads
autoload -Uz vcs_info
autoload -Uz tetriscurses

# Exports
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat --paging=always -p -lman'"

# Visuals
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{red} %b %m%u%c%f'

setopt PROMPT_SUBST
PROMPT='%F{blue}╭─𜲂%f %~ ${vcs_info_msg_0_}
%F{blue}╰─%f$ '

# Aliases
alias ls='lsd'
alias grep='grep --color=auto'
alias tree='lsd --tree'

f_fzf() {
    out=$(\fzf -m --highlight-line --cycle --preview="[ -d {-1} ] && tree {-1} || cat {-1}" --walker=file,dir)
    [ -z $out ] && return
    [ -d $out ] && cd $out && return
    [ -f $out ] && nvim $out && return
}
alias fzf='f_fzf'

alias la='lsd -A'
alias nv='nvim'

alias less='bat -p'
alias cat='bat --paging=never --style=plain'

# Binds
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3~' delete-char

function clear-screen-and-scrollback() {
  builtin echoti civis >"$TTY"
  builtin print -rn -- $'\e[H\e[2J' >"$TTY"
  builtin zle .reset-prompt
  builtin zle -R
  builtin print -rn -- $'\e[3J' >"$TTY"
  builtin echoti cnorm >"$TTY"
}
zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback
