# This is a basic Fedora cloud spin
# UEFI only, boots with UKI

# Inherit from cloud base
%include fedora-cloud-base.ks

%packages
-kernel-core
kernel-uki-virt
uki-direct
%end

%post

# setup discoverable partitions
sh /usr/share/doc/python3-virt-firmware/experimental/fixup-partitions-for-uki.sh

# bz2240989: shim has a hard dependency on grub.  grub has a hard
# dependency on dracut.  Ideally we would simply not install
# grub+dracut, but given we can't until the shim bug is fixed disable
# their kernel-install plugins instead.
kversion=$(ls /lib/modules)
if test -f /lib/modules/${kversion}/vmlinuz-virt.efi; then
    /bin/kernel-install -v remove ${kversion}
    touch /etc/kernel/install.d/20-grub.install
    touch /etc/kernel/install.d/50-dracut.install
    /bin/kernel-install -v add ${kversion} /lib/modules/${kversion}/vmlinuz-virt.efi
fi

# create BOOT.CSV for direct kernel boot
sh /usr/share/doc/python3-virt-firmware/experimental/generate-bootcsv-for-uki.sh /boot/efi

%end
