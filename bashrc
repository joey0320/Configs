# ~/.bashrc            

# Personal environment variables and startup programs
# should go into ~/.bash_profile.
# Personal aliases and functions should go into ~/.bashrc


# interactive prompt
PS1="> "

# use the following instead, if you don't want your username in the prompt
#PS1="[\h:\w]\\$ "

# continuation interactive prompt (for multi-line commands)
PS2='> '

PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs

__prompt_command() {
  local EXIT="$?"                # This needs to be first
  PS1=""

  local RCol='\[\e[0m\]'

  local Red='\[\e[0;31m\]'
  local Gre='\[\e[0;32m\]'
  local BYel='\[\e[1;33m\]'
  local BBlu='\[\e[1;34m\]'
  local Pur='\[\e[0;35m\]'

  if [ $EXIT != 0 ]; then
    PS1+="${Red}\w ${Pur}> ${RCol}"        # Add red if exit code non 0
  else
    PS1+="${Gre}\w ${Pur}> ${RCol}"
  fi

# PS1 += "> "
# PS1+="${RCol}@${BBlu}\h ${Pur}\W${BYel}$ ${RCol}"
}

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
############################################################################

alias ls='ls $LS_OPTIONS'
alias l="ls -al"
alias ll="ls -al"
alias gd="cd /scratch/joonho.whangbo/coding"

shopt -s histappend
export HISTSIZE=100000

############################################################################
export VERILATOR_ROOT="/scratch/joonho.whangbo/coding/verilator"
PATH="$VERILATOR_ROOT/bin:$PATH"

export ENABLE_SBT_THIN_CLIENT=1


source /ecad/tools/vlsi.bashrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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


