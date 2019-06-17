#!/bin/bash
if command -v sbt > /dev/null;
then
    echo sbt is available
    exit 1
fi

SBTURL="https://sbt-downloads.cdnedge.bluemix.net/releases/v1.2.8/sbt-1.2.8.tgz"
TARGZ=${SBTURL##*/}
OLDPWD=$PWD

echo "Installing $TARGZ locally in home directory"

cd $HOME
if ! [ -d $HOME/bin ];
then
    mkdir -p $HOME/bin
    echo 'PATH=$PATH:~/bin' > $HOME/.bashrc
fi

if ! [  -f $TARGZ ]
then
    curl --output $TARGZ $SBTURL
fi

tar xvzf $TARGZ
ln -s $HOME/sbt/bin/sbt $HOME/bin/sbt

cd $OLDPWD
echo "Restart your terminal!"