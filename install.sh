sudo apt-get update
sudo apt-get install git emacs screen
sudo apt-get install git python-numpy python-scipy python-matplotlib python-h5py python-nose redis-server python-setuptools ipython

SCRIPT=`readlink -f $0`
SRC_PREFIX=`dirname $SCRIPT`

for f in dotfiles/*; do
    dest=~/.`basename $f`
    src=$SRC_PREFIX/$f
    ln -fs $src $dest
done

