#!/bin/bash
function yesno() {
    MSG=$1
    echo $MSG
    while : ;
    do
        read -rsn1 input;
        if [[ "$input" == "n" || "$input" == "N" ]];
        then
            return 1
        elif [[ "$input" == "Y" ]];
        then
            return 0
        fi
    done
}

function build_sbt() {
    SCALAVERSION=$1
    echo "name := \"${PWD##*/}\"
         version := \"1.0\"
         scalaVersion := \"$SCALAVERSION\"" > build.sbt
}

if ! [[ "$PWD" =~ ^/workspace/ ]];  #PWD starts with /workspace/
then
    if ! yesno "Current directory is not a workspace. Continue (Y/n)"
    then
        echo no
        exit 1
    else
        echo yes
        exit 1
    fi
fi

mkdir -p src/{main,test}/{java,resources,scala}
mkdir lib project target

# create an initial build.sbt file
if [ -f build.sbt ];
then
    if yesno "A build.sbt file was found. Overwrite (Y/n)?";
    then
        build_sbt 2.12.7
    else
        exit 1
    fi
else
    build_sbt 2.12.7
fi

if [ -f ./project/build.properties ];
then
    if yesno "A ./project/build.properties file was found. Overwrite (Y/n)?";
    then
        echo "sbt.version=1.2.8" > ./project/build.properties
    else
        exit 1
    fi
else
    echo "sbt.version=1.2.8" > ./project/build.properties
fi