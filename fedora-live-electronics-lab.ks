#
# Fedora Live Electronics Lab with XFCE Desktop
#
# fedora-live-electronics-lab.ks
#
# Restart Fedora Electronics Lab live image
# the former project under this name (FEL) went dormant some years ago
#
# Description:
# - Fedora Live Electronics Lab Spin
#
# Maintainer(s):
# - R P Herrold		<herrold@owlriver.com>
#
# Does not include package selection (other then mandatory)
# Does not include localization packages or configuration
#

#
%include fedora-live-base.ks
%include fedora-live-minimization.ks
%include fedora-xfce-common.ks

%packages

# Embedded controller coding IDE
arduino
lua

# Embedded device applications and tools
kalibrate-rtl

# Compilers and headers
spasm-ng
llvm
gcc-c++
glib-devel
zlib-devel

# PCB layout
kicad

# Drawing, Picture viewing tools, Visualization tools
blender
dia
gimp
gnuplot
ImageMagick
inkscape
xfig
xloadimage

# Tooling development
dialog
lua-devel
popt-devel
python2-dialog
tk
Xnee
xforms
xforms-doc

# Related physics
lensfun

# Version control
git
git-gui

# Misc. Utils
bc
screen
konsole
minicom
telnet
tilp2
tmux
lynx
curl
wget

# Desktop tools
units
calc
kcalc
meta-calc
qalculate
tcalc
xcalc
xfce4-calculator-plugin
calligra-sheets
gnumeric
ginac-utils
kwrite
xfce4-screenshooter
xlockmore-motif
xls2csv
xorg-x11-apps

# Reporting
#		needs to be configured for off host logging
logger
rsyslog

# Include Mozilla Firefox
firefox

%post
# xfce configuration

# create /etc/sysconfig/desktop (needed for installation)

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/startxfce4
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

mkdir -p /home/liveuser/.config/xfce4

cat > /home/liveuser/.config/xfce4/helpers.rc << FOE
MailReader=sylpheed-claws
FileManager=Thunar
WebBrowser=firefox
FOE

# disable screensaver locking (#674410)
cat >> /home/liveuser/.xscreensaver << FOE
mode:           off
lock:           False
dpmsEnabled:    False
FOE

# deactivate xfconf-migration (#683161)
rm -f /etc/xdg/autostart/xfconf-migration-4.6.desktop || :

# deactivate xfce4-panel first-run dialog (#693569)
mkdir -p /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml
cp /etc/xdg/xfce4/panel/default.xml /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

# set up lightdm autologin
sed -i 's/^#autologin-user=.*/autologin-user=liveuser/' /etc/lightdm/lightdm.conf
sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
#sed -i 's/^#show-language-selector=.*/show-language-selector=true/' /etc/lightdm/lightdm-gtk-greeter.conf

# set Xfce as default session, otherwise login will fail
sed -i 's/^#user-session=.*/user-session=xfce/' /etc/lightdm/lightdm.conf

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/liveuser/Desktop
cp /usr/share/applications/liveinst.desktop /home/liveuser/Desktop

# and mark it as executable (new Xfce security feature)
chmod +x /home/liveuser/Desktop/liveinst.desktop

# this goes at the end after all other changes. 
chown -R liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser

EOF

%end
