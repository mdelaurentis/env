sudo apt-get update
sudo apt-get install git emacs screen make
sudo apt-get install git python-numpy python-scipy python-matplotlib python-h5py redis-server python-pip
sudo pip install virtualenv

mkdir -p ~/src
cd ~/src
git clone git@github.com:mdelaurentis/env.git

SCRIPT=`readlink -f $0`
SRC_PREFIX=`dirname $SCRIPT`

for f in dotfiles/*; do
    dest=~/.`basename $f`
    src=$SRC_PREFIX/$f
    ln -fs $src $dest
done

