#!/usr/bin/env sh

#VARIABLES 

FONT_PATH="$HOME/.fonts"


#END VARIABLES


#START FUNCTIONS





# START SCRIPT EXECUTION 
if [ ! -d $FONT_PATH ] 
  then 
    echo "$FONT_PATH does not exist. Creating directory"
    mkdir $FONT_PATH
    echo "font directory created"
    echo "Copying fonts"
    cp $HOME/dotfiles/fonts/* $FONT_PATH
  else 
    echo "Font directory already exisits"
    echo "Copying fonts"
    cp $HOME/dotfiles/fonts/* $FONT_PATH
fi

# Set xfce wallpaper
#xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorrdp0/workspace0/last-image -s $HOME/dotfiles/images/wallpapers/anime-skies.jpg
