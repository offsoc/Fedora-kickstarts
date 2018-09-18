# fedora-i3-common.ks
#
# Description:
# – Fedora Live Spin with the i3 desktop environment
#
# Maintainer(s):
# – Nicolas Chauvet <kwizart@fedoraproject.org>
#


%packages

# i3
i3
i3-doc
i3-ipc
i3lock
i3status

# we need a window manager for firstboot
metacity

# tools
tmux
vim

# powerline
powerline
powerline-docs
tmux-powerline
vim-powerline

# Drop things for size
-@3d-printing
-brasero
-colord
-fedora-icon-theme
-gnome-icon-theme
-gnome-icon-theme-symbolic
-gnome-software
-gnome-user-docs

-@mate-applications
-mate-icon-theme-faenza

# Help and art can be big, too
-gnome-user-docs
-evolution-help

# Legacy cmdline things we don't want
-telnet

%end
