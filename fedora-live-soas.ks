# fedora-livecd-soas.ks
#
# Description:
# - A Sugar environment that you can carry in your pocket
#
# Maintainers:
# - Chihurumnaya Ibiam <ibiamchihurumnaya AT gmail DOT com>
# - Alex Perez <aperez AT alexperez DOT com>

%include fedora-live-base.ks
%include fedora-live-minimization.ks
%include fedora-soas-common.ks

%post

# set livesys session type
sed -i 's/^livesys_session=.*/livesys_session="soas"/' /etc/sysconfig/livesys

%end
