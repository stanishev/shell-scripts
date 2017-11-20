alias ll='ls -al'
alias lrt='ls -alrt'
alias ..='cd ..'
alias path='echo $PATH'

# Path to your oh-my-zsh installation.
export ZSH=/Users/username/.oh-my-zsh

# plugins
plugins=(git zsh-autosuggestions)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh
