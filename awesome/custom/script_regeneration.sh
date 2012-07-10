#!/bin/bash
cd $HOME/.config/awesome/themes/
for dir in `find ./ -type d | cut -d/ -f2 | sort | uniq`; do  
    cp -i $HOME/.config/awesome/custom/default_script $dir/script.sh  
    sed -i "s/themes\/default_script/themes\/${dir}/g" $dir/script.sh  
#   echo $dir;
done