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


## VS Code extension for Scala
From the Microsoft Marketplace, download the following extensions
 * [Scala Syntax (official)](https://marketplace.visualstudio.com/items?itemName=scala-lang.scala)
 * [Scala (Metals)](https://marketplace.visualstudio.com/items?itemName=scalameta.metals)
The download button can be found on the right under heading resources after Categories and Tags. Alternatively
the Extensions can also be found at [VisxHub](https://www.vsixhub.com).

Open in GitPod Menu -> View -> Extensions and drag and drop file into left-hand "context" window
titled EXTENSIONS (BETA). For `Scala Syntax (official) 0.3.8` and `Scala (Metals) 1.6.2` the following 
lines will be added to `gitpod.yml`:
```
vscode:
  extensions:
    - scala-lang.scala@0.3.8:wQBBM+lKILHBqOqlqW60xA==
    - scalameta.metals@1.6.2:njgbLSjeMDyY9TZFwn0Bdw== 
```
This concludes the installation.