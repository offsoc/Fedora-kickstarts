# fedora-livecd-lxde.ks
#
# Description:
# - Fedora Live Spin with the light-weight LXDE Desktop Environment
#
# Maintainer(s):
# - Christoph Wickert <cwickert@fedoraproject.org>

%include fedora-live-base.ks
%include fedora-live-minimization.ks
%include fedora-lxde-common.ks

%post
# LXDE and LXDM configuration

# create /etc/sysconfig/desktop (needed for installation)
cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/startlxde
DISPLAYMANAGER=/usr/sbin/lxdm
EOF

# Fix https://bugzilla.redhat.com/show_bug.cgi?id=2240162
cat > /etc/xdg/autostart/xfce-polkit.desktop <<EOF
[Desktop Entry]
Type=Application
Name=xfce-polkit
Exec=/usr/libexec/xfce-polkit
EOF

# set livesys session type
sed -i 's/^livesys_session=.*/livesys_session="lxde"/' /etc/sysconfig/livesys

%end

