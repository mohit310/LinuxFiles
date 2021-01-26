#!/bin/bash
outputdir=$(dirname "$FILE")
outfilename=merged.pdf

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -dDOPDFMARKS -sOutputFile=${outputdir}/${outfilename} $@
