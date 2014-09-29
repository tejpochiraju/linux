STRING=$1;

find . -type f -name "*${STRING}*" | while read -r file;
do 
        nfile=`echo $file | sed "s/ ${STRING}//g"`; 
            mv "$file" "$nfile" 2>/dev/null; 
        done
