#!/bin/bash
FILE=$1

if [ ! -f "$FILE" ]; then
   echo "File $FILE does not exist."
   exit 0
fi

outputdir=$(dirname "$FILE")
filefullname=$(basename "$FILE")
extension="${filefullname##*.}"
filename="${filefullname%.*}"

echo $outputdir
echo $filefullname
echo $extension
echo $filename

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${outputdir}/${filename}_shrink.${extension} $FILE
