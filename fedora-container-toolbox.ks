# Kickstart file for Fedora Toolbox

# See fedora-container-common.ks for details on how to hack on container image kickstarts
# This base is a standard Fedora image with python3 and dnf5

%include fedora-container-common.ks

# Install packages
%packages --excludedocs --inst-langs=en --nocore --exclude-weakdeps
rootfiles
tar # https://bugzilla.redhat.com/show_bug.cgi?id=1409920
vim-enhanced
dnf5
sudo
-glibc-minimal-langpack
glibc-all-langpacks
acl
bash
coreutils-common
curl
findutils
gawk
gnupg2
grep
gzip
libcap
openssl
p11-kit
pam
python3
rpm
sed
systemd
util-linux-core
bash-completion
bc
bzip2
diffutils
dnf5-plugins
flatpak-spawn
fpaste
git
gnupg2-smime
gvfs-client
hostname
iproute
iputils
whois
keyutils
krb5-libs
less
lsof
man-db
man-pages
mesa-dri-drivers
mesa-vulkan-drivers
mtr
nano-default-editor
nss-mdns
openssh-clients
passwd
pigz
procps-ng
rsync
shadow-utils
tcpdump
time
traceroute
tree
unzip
util-linux
vte-profile
vulkan-loader
wget
which
words
xorg-x11-xauth
xz
zip
%end

# Pre-installation commands
%pre
# Copy README.md
cp /README.md /mnt/sysimage/README.md

# Remove macros.image-language-conf file
rm -f /mnt/sysimage/etc/rpm/macros.image-language-conf

# Remove 'tsflags=nodocs' line from dnf.conf
sed -i '/tsflags=nodocs/d' /mnt/sysimage/etc/dnf/dnf.conf

# https://bugzilla.redhat.com/show_bug.cgi?id=1343138
# Fix /run/lock breakage since it's not tmpfs in docker
# This unmounts /run (tmpfs) and then recreates the files
# in the /run directory on the root filesystem of the container
#
# We ignore the return code of the systemd-tmpfiles command because
# at this point we have already removed the /etc/machine-id and all
# tmpfiles lines with %m in them will fail and cause a bad return
# code. Example failure:
#   [/usr/lib/tmpfiles.d/systemd.conf:26] Failed to replace specifiers: /run/log/journal/%m
#
umount /run
rm -f /run/nologin # https://pagure.io/atomic-wg/issue/316

# Final pruning
rm -rfv /var/cache/* /var/log/* /tmp/*

%end

# Perform any necessary post-installation configurations specific to Fedora Toolbox (nochroot environment)
# Post-installation commands

%post --nochroot --erroronfail --log=/mnt/sysimage/root/anaconda-post-nochroot.log
set -eux

# Check if specified files exist
declare -a files=(
  "/usr/share/man/man1/bash.1*"
  "/usr/share/man/man1/cd.1*"
  "/usr/share/man/man1/export.1*"
  "/usr/share/man/man1/cat.1*"
  "/usr/share/man/man1/cp.1*"
  "/usr/share/man/man1/ls.1*"
  "/usr/share/man/man1/gpg2.1*"
  "/usr/share/man/man7/gnupg2.7*"
  "/usr/share/man/fr/man8/rpm.8*"
  "/usr/share/man/ja/man8/rpm.8*"
  "/usr/share/man/man8/rpm.8*"
  "/usr/share/man/man1/kill.1*"
  "/usr/share/man/man8/mount.8*"
)

ret_val=0
for file in "${files[@]}"; do
  if ! compgen -G "$file" >/dev/null; then
    echo "$file: No such file or directory" >&2
    ret_val=1
    break
  fi
done

if [ "$ret_val" -ne 0 ]; then
  false
fi

# Clean up dnf cache
dnf clean all

%end
