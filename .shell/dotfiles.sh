cd
# initialize repository
if [ ! -d .git ]; then
  git init .
  git config --local status.showUntrackedFiles no
  git remote -v add origin git@github.com:AbramClark/dotfiles.git
  git push --set-upstream origin master
fi
cd -
