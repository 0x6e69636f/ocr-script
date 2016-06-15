#!/bin/bash

for file in "$@"
do
  if [[ -f $file && "${file: -3}" == "pdf" ]];
  then
      fbname=$(basename "$file" .pdf);
      
      # fbname = $(basename "$1" .pdf)
      echo "* Converting $fbname to png in ./$fbname"
      mkdir $fbname;
      convert -density 300 $file "$fbname/$fbname.png"
      # #cd $fbname
      echo "* Running tesseract on $fbname"
      for i in $fbname/*png
        do tesseract $i - >> $fbname/$fbname.txt
      done  
      #cd ..
  else 
    echo "$file non pris en charge"
  fi

done
