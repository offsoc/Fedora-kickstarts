# fedora-livecd-kde-ja_JP.ks
#
# Description:
# - Japanese Fedora Live Spin with the KDE Desktop Environment
#
# Maintainer(s):
# - Shintaro Fujiwara <shintaro.fujiwara@miraclelinux.com>

%include ../fedora-live-kde.ks

lang ja_JP.UTF-8
keyboard jp
timezone Asia/Tokyo

%packages
@japanese-support
# exclude input methods except ibus:
-m17n*
-scim*
-iok
%end

%post
