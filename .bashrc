# ~/.bashrc

# Personal environment variables and startup programs
# should go into ~/.bash_profile.
# Personal aliases and functions should go into ~/.bashrc

RCol='\[\e[0m\]'
Gre='\[\e[1;32m\]'
BBlu='\[\e[1;36m\]'

PS1="${BBlu}\H:\w > ${RCol}"
PS2='> '

export LS_OPTIONS='--color=auto -lh'
eval "$(dircolors -b)"

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend
export HISTSIZE=1000000

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

##############################################################################

linediff() { 
     if [ -z "$1" ] || [ -z "$2" ]; then return; fi
     f1=$(basename "$1")
     f2=$(basename "$2")
     cat -n "$1" > "/tmp/$f1"
     cat -n "$2" > "/tmp/$f2"
     vimdiff "/tmp/$f1" "/tmp/$f2"
     rm "/tmp/$f1" "/tmp/$f2"
}

function set_sbt_heap_size() {
  export SBT_OPTS="-Xmx16G -Xms1G"
}

function connect_ssh_agent() {
  # set SSH_AUTH_SOCK env var to a fixed value
  export SSH_AUTH_SOCK=~/.ssh/ssh-agent.sock

  # test whether $SSH_AUTH_SOCK is valid
  ssh-add -l 2>/dev/null >/dev/null

  # if not valid, then start ssh-agent using $SSH_AUTH_SOCK
  [ $? -ge 2 ] && ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
}

function firesim1_connect_ssh_agent() {
  # set SSH_AUTH_SOCK env var to a fixed value
  export FIRESIM1_SSH_AUTH_SOCK=~/.ssh/firesim1-ssh-agent.sock

  # test whether $SSH_AUTH_SOCK is valid
  ssh-add -l 2>/dev/null >/dev/null

  # if not valid, then start ssh-agent using $SSH_AUTH_SOCK
  [ $? -ge 2 ] && ssh-agent -a "$FIRESIM1_SSH_AUTH_SOCK" >/dev/null
}

function clone_chipyard() {
  git clone git@github.com:ucb-bar/chipyard.git $1
}

function clone_firesim() {
  git clone git@github.com:firesim/firesim.git $1
}

############################################################################

BASE_DIR="/scratch/joonho.whangbo"

alias ls='ls $LS_OPTIONS'
alias l="ls -al"
alias ll="ls -al"

if [ -d $BASE_DIR ]
then
  alias gd="cd $BASE_DIR/coding"
  alias vi="$BASE_DIR/nvim-linux64/bin/nvim"
  PATH="$BASE_DIR/bin:$PATH"
  PATH="$BASE_DIR/lua_build/lua-5.4.4/src:$PATH"
  PATH="$PATH:$BASE_DIR/coding/pandoc-2.19.2/bin"
  PATH="$PATH:$BASE_DIR/clangd_16.0.2/bin"
  PATH="$BASE_DIR/coding/.local/bin:$PATH"

  if [ -d "$BASE_DIR/usr/bin" ]; then
    export PATH="$BASE_DIR/usr/bin:$PATH"
  fi

  if [ -d $BASE_DIR/go ]
  then
    export PATH=$BASE_DIR/go/bin:$PATH
  fi
fi

# Rust setup
if [ -d $HOME/.cargo ]
then
  source "$HOME/.cargo/env"
fi

# ripgrep setup
if [ -d $HOME/ripgrep ]
then
  PATH=$HOME/ripgrep/target/release:$PATH
fi

# Cad tools
export ECAD_TOOLS_DIR="/ecad/tools"
if [ -d $ECAD_TOOLS_DIR ]
then
  source $ECAD_TOOLS_DIR/vlsi.bashrc

  # VCU118
  # source "$ECAD_TOOLS_DIR/xilinx/Vivado/2019.1/settings64.sh"
  # Intel FPGA
  # export PATH="$ECAD_TOOLS_DIR/altera/intelFPGA_pro/23.2/quartus/bin:$PATH"
  # U250
  source "$ECAD_TOOLS_DIR/xilinx/Vivado/2021.1/settings64.sh"
fi

# llano vivao_lab
HOSTNAME=$(hostname)
if [ $HOSTNAME = "llano" ]
then
  source /tools/Xilinx/Vivado_Lab/2023.1/settings64.sh
fi

############################################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/scratch/joonho.whangbo/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/scratch/joonho.whangbo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/scratch/joonho.whangbo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/scratch/joonho.whangbo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#######################################################################
