#Emacs custom configuration for UNIX

To set up:
1. Clone dotfile repository
2. symlink init.el to ~/.emacs.d/

```ln -s ~/dotfiles/emacs/init.el ~/.emacs.d/init.el```


OS
```ln -s ~/code/dotfiles/emacs/init.el ~/.emacs.d/init.el```

3. symlin themes to ~/.emacs.d/themes

```ln -s ~/dotfiles/emacs/themes ~/.emacs.d/themes```


OS
```ln -s ~/code/dotfiles/emacs/themes ~/.emacs.d/themes```



For Windowws

NOC WSL2

Clone dotfile repo then link
ln -s ~/code/dotfiles/emacs/init.el ~/.emacs.d/init.el
ln -s ~/code/dotfiles/emacs/themes/ ~/.emacs.d/themes


https://lucidmanager.org/productivity/emacs-windows/

set home directory 
setx HOME %USERPROFILE%

create emacs directory
mkdir .emacs.d
created symlink 

open Admin CMD prompt
mklink "C:\Users\alan_\.emacs.d\init.el" "C:\Users\alan_\code\dotfiles\emacs\init.el"

mklink C:\Users\alan_\.emacs.d\themes C:\Users\alan_\code\dotfiles\emacs\themes


Run emacs as daemon service on Linux
(currently ran on Rocky Linux 9

CD to emacs.service file location:
then run command
systemctl link ./emacs.service
<Enter password or run with sudo>

Then run
 systemctl enable --user emacs.service
 systemctl start --user emacs.service

Then you should be able to run 
emacsclient <filename> 
