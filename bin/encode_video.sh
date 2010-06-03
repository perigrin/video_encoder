#!/bin/bash 
INPUT=$1
NAME=`echo $INPUT | cut -d\. -f1`

echo 'Making output directory'
mkdir -p ${NAME};

echo 'Making h.264 video'
ffmpeg -i ${INPUT} -acodec libfaac -ab 128k -vcodec libx264 -vpre slow -crf 22 -threads 0 -s 640x480 ${NAME}/${NAME}.mp4

echo 'Making Ogg/Theora video'
ffmpeg2theora --videoquality 5 --audioquality 1 --max_size 640x480 -o ${NAME}/${NAME}.ogv ${INPUT} 

echo 'Making Thumbnail Now'
ffmpeg  -itsoffset -4  -i ${INPUT} -vcodec mjpeg -vframes 1 -an -f rawvideo -s 640x480 ${NAME}/thumb.jpg

