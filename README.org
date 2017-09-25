#+TITLE: My Vim Configuration

This is a vim configuration tree since 2017. And this configuration including
plugins for the following:

+ vimagit
+ tagbar
+ syntastic
+ nerdtree
+ nerdcommenter
+ javacomplete2
+ undotree
+ vim-airline
+ auto-pairs
+ vim-surround
+ emmet

And I choose the ~hydrangea-vim~ for my major color scheme.

** Requirements

If you want to use ~ctags~ for your C family language your need to
install ctags on your OS.

** Installation

To install, clone this repo to anywhere you want:

#+BEGIN_SRC SH
git clone https://github.com/lameshuai/vimrc.git ~/vim.d
#+END_SRC

After cloned this repo, then your should add a symbol link at your home
directory. Upon starting up VIM for the first time, further third-party
packages will be automatically downloaded and installed. If you encouter
any errors at stage, try restarting VIM, and possibly running command
with *:PluginInstall* in normal mode.


** Updates

Update the config with ~git pull~. You'll porbable also want/need to
updated the third-party packages regularly too:

*:PluginUpdate*, then enter return.

You should usually restart VIM after pulling changes or updating
packages so that they can take effect.


** Support / issues

If you hit any problems, please first ensure that you are using the
latest version of this code, and that you have updated your packages
to the most recent available versions (see "Updates" above). If you
still experience problems, go ahead and [[https://github.com/lameshuai/vimrc.git][file an issue on the github
project]]. Or your can contact me.
