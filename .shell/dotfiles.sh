cd
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# initialize repository
if [ ! -d .dotfiles ]; then
  git init .dotfiles
  dotfiles config --local status.showUntrackedFiles no
  dotfiles remote -v add origin git@github.com:AbramClark/dotfiles.git
fi
