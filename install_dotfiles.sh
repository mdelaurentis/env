#SCRIPT=`readlink -f $0`
#SRC_PREFIX=`dirname $SCRIPT`
SRC_PREFIX=~/code/env
for f in dotfiles/*; do
    dest=~/.`basename $f`
    src=$SRC_PREFIX/$f
    ln -fs $src $dest
done

