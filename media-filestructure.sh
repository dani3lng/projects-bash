# Content File Structure Bash Script
#!/bin/sh
#
# prep: prep analytics directory structure
#
# usage: prep DIRNAME
#

year_array=(01-January 02-February 03-March 04-April 05-May 06-June 07-July 08-August 09-September 10-October 11-November 12-December)
 
if [ "$#" == "0" ]; then
    echo "ERROR: Please specify a directory name"
    echo
    echo "USAGE: prep DIRNAME"
fi
 
 
DIR=$1
 
if [ ! -d "${DIR}" ]; then
    mkdir -p ${DIR} && cd ${DIR}
    for item in "${year_array[@]}"; do
        mkdir $item
    done
    for item in "${year_array[@]}"; do
        cd $item
            mkdir title
            cd title
            mkdir Fujifilm \Hasselblad \DJI
            cd Fujifilm && mkdir Photo Video
            cd ..
            cd Hasselblad && mkdir Photo Video
            cd .. 
            cd DJI && mkdir Photo Video
            cd .. && cd .. && cd ..
    done
    ls -l ${DIR}
else
    echo "Directory "${DIR}" already exists"
fi
