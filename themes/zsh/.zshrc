if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/neik/.oh-my-zsh"
HISTORY_IGNORE="exa*"
ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_MODE="nerdfont-complete"
# ENABLE_CORRECTION="true"
DISABLE_MAGIC_FUNCTIONS="true"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
# ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=1'

plugins=(git tmux web-search zsh-z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ----------------- 3rdparty setup --------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/neik/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/neik/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/neik/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/neik/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
 


# ----------------- VI mode ---------------
bindkey -v
export KEYTIMEOUT=1

# ----------------- Key Binding -----------

bindkey '^[[13;5u' autosuggest-accept
bindkey '^[[13;2u' autosuggest-execute
# bindkey '^K' up-line-or-history
# bindkey '^J' down-line-or-history


# Change cursor shape for different vi modes.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.


# ----------------- ALIAS -----------------
alias gcm="git checkout main"
alias gc="git checkout"
alias status="git checkout status"
alias ac="git add . && git commit -m"
alias sad="echo not sad at all"
alias ssh-xavier="ssh nvidia@10.208.255.188"
alias rm="rm -i"
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first"
alias l="exa -l --icons --group-directories-first -a"
alias la="exa -l --icons --group-directories-first -a"
alias tree="exa --icons -T -L"
alias untar="tar -xvf"
alias ssh="ssh -t -- /bin/sh -c 'tmux has-session && exec tmux attach || exec tmux:'"
alias c="xclip -selection clipboard"

# ----------------- EXPORT -----------------
export PATH=/opt/cmake/cmake-3.20.6-linux-x86_64/bin:$PATH
export PATH=/opt/ipg/bin/:$PATH
export PATH=/usr/src/tensorrt/bin/:$PATH
export PATH=/usr/local/cuda/bin/:$PATH
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/neik/Downloads/installations/cudnn-10.2-linux-x64-v7.6.5.32/cuda/lib64/:$LD_LIBRARY_PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Remove padding in the right end of the prompt
ZLE_RPROMPT_INDENT=0
