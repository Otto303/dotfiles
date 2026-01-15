# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/otto/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ========== Config ==========
# Visuals
autoload -Uz vcs_info
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
