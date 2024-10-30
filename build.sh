#!/bin/sh

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install sssd-idp sssd-passkey sssd-common sssd-krb5 libsss_certmap \
    libsss_idmap libsss_sudo sssd-client libsss_nss_idmap \
    sssd-krb5-common sssd-nfs-idmap sssd-proxy sssd-ad \
    sssd-common-pac sssd-ldap sssd sssd-ipa sssd-kcm libipa_hbac freeipa-client \
    toolbox samba samba-winbind samba-client cups epson-inkjet-printer-escpr epson-inkjet-printer-escpr2 \
    krb5-workstation krb5-server fedora-packager fedora-packager-kerberos virt-manager virt-viewer \
    blackbox-terminal podman-tui bootc podman-tui qemu-img ansible

# this would install a package from rpmfusion
#RUN rpm-ostree install vlc

#### Change to System Configuration Files

# this example modifies default timeouts to prevent slow reboots from services that won't stop
#sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf
#sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf
