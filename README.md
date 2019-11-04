# parallelTrie

## install_sbt.sh
Downloads a version (currently `v1.2.8`) of SBT as tarball into the `$HOME` directory and extracts it there.
At the same time the directory `$HOME/bin` is created and added to the path variable in `.bashrc`. A symbolic link 
from the SBT executable is set in `$HOME/bin` and `.bashrc` is sourced.

## mksbt.sh
The file needs to be called in the `/workspace` directory. It creates the `sbt` workspace directories. 
It creates the files `./build.sbt` as well as `./project/build.properties`. If either of these files already
exists, the user is prompted for consent. If the user agrees to proceed, the respective file will be overwritten,
or else the program is terminated.
