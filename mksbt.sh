#!/bin/bash
if [ -z "$SCALA_VERSION"];
then
    SCALA_VERSION=2.13.0
    echo "Env var SCALA_VERSION not set. Using default $SCALA_VERSION"
fi

if [ -z "$SBT_VERSION"];
then
    SBT_VERSION=1.2.8
    echo "Env var SBT_VERSION not set. Using default $SBT_VERSION"

fi

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
    fi
fi

for i in main test;
do
    for j in java resources scala;
    do
        if ! [ -d src/$i/$j ]; then mkdir -p src/$i/$j; fi
    done
done

for i in lib project target;
do
    if ! [ -d $i ]; then mkdir $i; fi
done

# create an initial build.sbt file
if [ -f build.sbt ];
then
    if yesno "A build.sbt file was found. Overwrite (Y/n)?";
    then
        build_sbt $SCALA_VERSION
    else
        exit 1
    fi
else
    build_sbt $SCALA_VERSION
fi

if [ -f ./project/build.properties ];
then
    if yesno "A ./project/build.properties file was found. Overwrite (Y/n)?";
    then
        echo "sbt.version=$SBT_VERSION" > ./project/build.properties
    else
        exit 1
    fi
else
    echo "sbt.version=$SBT_VERSION" > ./project/build.properties
fi