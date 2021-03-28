#!/usr/bin/env sh

#VARIABLES 

FONT_PATH="$HOME/.fonts"


#END VARIABLES


#START FUNCTIONS


#END FUNCTIONS


# START SCRIPT EXECUTION 
echo "copy fonts. (creates directory if they do not exist)"

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


echo "setting wallpaper"
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorrdp0/workspace0/last-image -s $HOME/dotfiles/images/wallpapers/anime-skies.jpg
