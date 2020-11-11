# fedora-live-kde-ru_RU.ks
#
# Description:
# - Russian Fedora Live Spin with the K Desktop Environment (KDE), default 1.4 GB version
#
# Maintainer(s):
# - Sergey Mihailov <sergey.mihailov at gmail.com>

%include ../fedora-live-kde.ks

lang ru_RU.UTF-8
keyboard ru
timezone Europe/Moscow

%packages
langpacks-ru

# exclude input methods
-m17n*
-scim*
-iok
%end

%post
# add keyboard layout in X11
cat > /etc/X11/xorg.conf.d/00-keyboard.conf << "EOF"
# Written by systemd-localed(8), read by systemd-localed and Xorg. It's
# probably wise not to edit this file manually. Use localectl(1) to
# instruct systemd-localed to update it.
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbVariant" ","
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
EOF
%end
