#!/bin/bash
START_DIR=`pwd`
DOXY_CFG=$START_DIR/'doxygen.cfg'
rm -rf $START_DIR/html
rm -rf $START_DIR/latex
rm -rf $START_DIR/cpp/*

cd ../
TOP_DIR=`pwd`

#matlab_files=( $START_DIR/'classDocumentationExample.m' )

input='*.m'
#matlab_files=()
#while IFS=  read -r -d $'\0'; do
#        array+=("$REPLY")
#done < <(find . -name "${input}" -print0)

matlab_files=`find ../ -name "${input}"`

CPP_PATH=$START_DIR"/cpp/"
#for word in $matlab_files
#do
#        echo $word
#done
#
#exit

for mfile in $matlab_files
do
    #echo $mfile ; echo \n
    filename=$(basename -- "$mfile")
    extension="${filename##*.}"
    filename="${filename%.*}"
    #echo $filename
    cppname=${CPP_PATH}${filename}".cpp"

    #echo $cppname
    perl $START_DIR/m2cpp.pl $mfile > $cppname

    #echo $mfile
done
doxygen  $DOXY_CFG
cd $START_DIR/latex; make
cd $START_DIR

