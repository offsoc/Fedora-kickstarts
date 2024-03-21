# Maintained by x3mboy and the Fedora Robotics SIG:
# https://fedoraproject.org/wiki/SIGs/Robotics
# mailto:x3mboy@fedoraproject.org
# mailto:robotics@lists.fedoraproject.org

%include fedora-live-base.ks
%include fedora-live-minimization.ks

# The recommended part size for DVDs is too close to use for the robotics spin
part / --size 10752

%packages
# Start with GNOME
# Install workstation-product-environment to resolve RhBug:1891500
@^workstation-product-environment

# Add robotics development packages
@robotics-suite
pcl-devel
player-devel
stage-devel

# Add version control packages
git
mercurial

# Remove extra gnome-y things
-@graphical-internet
-@games
-@sound-and-video
-@dial-up
-@input-methods
-@standard
-@container-management
-@libreoffice
-@networkmanager-submodules
-@workstation-product

# Remove office suite
-libreoffice-*
-planner

# Drop the Java plugin
-icedtea-web

# Drop things that pull in perl
-linux-atm

# No printing or scanning
-foomatic-db-ppds
-foomatic
-sane-backends-drivers-scanners
-libsane-hpaio

# Dictionaries are big
-aspell-*
-man-pages*
-words

# Help and art can be big, too
-gnome-user-docs
-evolution-help
-desktop-backgrounds-basic
-*backgrounds-extras

# Legacy cmdline things we don't want
-krb5-auth-dialog
-krb5-workstation
-pam_krb5
-nano
-dos2unix
-finger
-ftp
-jwhois
-mtr
-pinfo
-rsh
-ypbind
-yp-tools
-acpid
-ntsysv

# Drop some system-config things
-system-config-language
-system-config-network
-system-config-rootpassword
-system-config-services
-policycoreutils-gui

%end

%post
# Extend the post-configuration from the live-desktop, set default shortcuts to IDEs
cat >> /var/lib/livesys/livesys-session-extra << EOF
# disable screensaver locking
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.screensaver.gschema.override << FOE
[org.gnome.desktop.screensaver]
lock-enabled=false
FOE

# and hide the lock screen option
cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.lockdown.gschema.override << FOE
[org.gnome.desktop.lockdown]
disable-lock-screen=true
FOE

# make the installer show up
if [ -f /usr/share/applications/liveinst.desktop ]; then
  # Show harddisk install in shell dash
  sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop ""
  # need to move it to anaconda.desktop to make shell happy
  mv /usr/share/applications/liveinst.desktop /usr/share/applications/anaconda.desktop

  cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override << FOE
[org.gnome.shell]
favorite-apps=['firefox.desktop', 'org.qt-project.qtcreator.desktop', 'arduino.desktop', 'gnome-terminal.desktop','nautilus.desktop', 'anaconda.desktop']
FOE

fi

# rebuild schema cache with any overrides we installed
glib-compile-schemas /usr/share/glib-2.0/schemas

EOF
%end
