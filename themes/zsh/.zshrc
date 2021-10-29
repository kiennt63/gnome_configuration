if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/neik/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_MODE="nerdfont-complete"

# ENABLE_CORRECTION="true"
DISABLE_MAGIC_FUNCTIONS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
plugins=(git zsh-z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ----------------- 3rdparty setup --------
# source /opt/ros/melodic/setup.zsh
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
alias tree="exa --icons -T -L"


# ----------------- EXPORT -----------------
# export CAR_MODEL_NAME=mkz_01 
# export APOLLO_ROOT_DIR=/home/neik/vinai/apollo
# export PATH=/usr/local/cuda-10.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export PATH=/opt/cmake/cmake-3.20.6-linux-x86_64/bin:$PATH
export PATH=/opt/ipg/bin/:$PATH
export PATH=/usr/src/tensorrt/bin/:$PATH
export PATH=/usr/local/cuda/bin/:$PATH
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/rti_connext_dds-6.0.1/lib/armv8Linux4.4gcc5.4.0:/opt/rti_connext_dds-6.0.1/lib/armv8QNX7.0.0qcc_gpp5.4.0:/opt/rti_connext_dds-6.0.1/lib/x64Linux4gcc7.3.0
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/vinai_adas_dds/1.0.19/lib/armv8Linux4.4gcc5.4.0:/opt/vinai_adas_dds/1.0.19/lib/armv8QNX7.0.0qcc_gpp5.4.0:/opt/vinai_adas_dds/1.0.19/lib/x64Linux4gcc7.3.0
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
# export DATA_PATH=/home/neik/data/

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
