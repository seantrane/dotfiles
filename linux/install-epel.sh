#!/usr/bin/env bash
#
# Install Extra Packages for Enterprise Linux (EPEL)
#
# There are repository rpm packages for RHEL5, RHEL6 and RHEL7.
# The repository package installs the repo details on your local system for yum or up2date to use.
# Then you can install packages with your usual method, and the EPEL repository is included.
# https://fedoraproject.org/wiki/EPEL/FAQ#How_can_I_install_the_packages_from_the_EPEL_software_repository.3F

if type "yum" &> /dev/null; then
  su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm'
fi
