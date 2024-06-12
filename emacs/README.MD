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

