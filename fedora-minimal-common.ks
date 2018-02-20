%packages --excludedocs --excludeWeakdeps --nocore
bash
filesystem
coreutils-single
util-linux
rpm
shadow-utils
microdnf
glibc-minimal-langpack
grubby
kernel
libcrypt
sssd-client
dhcp-client
-fedora-logos
-coreutils
-dosfstools
-e2fsprogs
-fuse-libs
-gnupg2-smime
-libss # used by e2fsprogs
-libusbx
-pinentry
-shared-mime-info
-trousers
-xkeyboard-config
-dracut
%end

%post

# setup systemd to boot to the right runlevel
echo -n "Setting default runlevel to multiuser text mode"
rm -f /etc/systemd/system/default.target
ln -s /lib/systemd/system/multi-user.target /etc/systemd/system/default.target
echo .

%end
