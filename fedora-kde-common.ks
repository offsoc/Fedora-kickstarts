
%packages

# Provides Spectacle and basic image-related programs
@kde-graphics

# Provides KDE connect and KTorrent, as well as Falkon, our browser
@kde-network

# Provides Elisa (Music Player) and Kamoso (Camera)
@kde-multimedia

# Provides things necessary for basic interaction with the system (file management, terminal)
@kde-system

# Provides basic utilities like text editing and archive management
@kde-utilities

# These are some settings modules providing useful features like Wacom tablet configuration and SDDM configuration
@kde-kcms

# This wouldn't be a KDE spin without Plasma...
@kde-plasma

# We probably want Breeze too, since that's like, *the* KDE theme.
@kde-themes

# This wouldn't be a Fedora spin without branding...
@kde-fedora-branding

@networkmanager-submodules
fedora-release-kde

### fixes

# use kde-print-manager instead of system-config-printer
-system-config-printer

# minimal localization support - allows installing the kde-l10n-* packages
system-config-language
kde-l10n

# Additional packages that are not default in kde-* groups, but useful
fuse
mediawriter

### space issues

# admin-tools
-gnome-disk-utility
# kcm_clock still lacks some features, so keep system-config-date around
#-system-config-date
# prefer kcm_systemd
-system-config-services
# prefer/use kusers
-system-config-users

## avoid serious bugs by omitting broken stuff

%end
