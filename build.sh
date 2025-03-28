#!/bin/sh

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
cat <<END > /etc/yum.repos.d/podman-bootc.repo
[copr:copr.fedorainfracloud.org:gmaglione:podman-bootc]
name=Copr repo for podman-bootc owned by gmaglione
baseurl=https://download.copr.fedorainfracloud.org/results/gmaglione/podman-bootc/fedora-\$releasever-\$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://download.copr.fedorainfracloud.org/results/gmaglione/podman-bootc/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
END

# this installs a package from fedora repos
rpm-ostree install sssd-idp sssd-passkey sssd-common sssd-krb5 libsss_certmap \
    libsss_idmap libsss_sudo sssd-client libsss_nss_idmap \
    sssd-krb5-common sssd-nfs-idmap sssd-proxy sssd-ad \
    sssd-common-pac sssd-ldap sssd sssd-ipa sssd-kcm libipa_hbac freeipa-client \
    toolbox samba samba-winbind samba-client cups gutenprint-cups cups-printerapp cups-pdf cups-ipptool cups-filters-driverless \
    krb5-workstation krb5-server fedora-packager fedora-packager-kerberos virt-manager virt-viewer \
    blackbox-terminal podman-tui bootc podman-compose qemu-img ansible podman-bootc

# this would install a package from rpmfusion
#RUN rpm-ostree install vlc

#### Change to System Configuration Files

# this example modifies default timeouts to prevent slow reboots from services that won't stop
#sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf
#sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf
