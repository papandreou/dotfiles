# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

function sourceFiles() {
  for file in $@ ; do
    source $file
  done
}

#DOTFILES_DIR=$(cd $(dirname $(readlink -f ${BASH_SOURCE[0]}))/.. && pwd)
DOTFILES_DIR=~/dotfiles

# XXX: Remove the following line
sourceFiles $(find $DOTFILES_DIR/bash/bash.d -type f | grep -v bash.d/local.sh)

# Load and configure p.sh
export PROJECTS_DIR=~/Projects
source $DOTFILES_DIR/modules/p/p.sh

# title script: set the title of the terminal
function title {
    printf "\033]0;%s\007" "$1"
}

# Load the *.bashrc.sh files from the topic folders in the DOTFILES_DIR
sourceFiles $(find $DOTFILES_DIR -type f -name "*.bashrc.sh")

# Make sure to source the local stuff last
sourceFiles $DOTFILES_DIR/bash/bash.d/local.sh
