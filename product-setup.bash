#!/bin/bash
# product-setup.bash - 2013-10-12 11:39
#
# Usage somedir/product-setup.bash [mysetup.pp]
#
# default setup file is product-setup.pp and product-setup.ppmod
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
[ -n "${DEBUG}" ] && set -x
set -x
mydir=`pwd`/`dirname "$0"`
setup_pp=${1:-'setup-product.pp'}
setup_ppmod="${setup_pp}"mod

if [ ! -f "${setup_pp}" ] ; then
    echo "ERROR: file: ${setup_pp} not found!"
    exit 2
fi

pushd "${mydir}"

# is puppet installed?
ppver=`puppet --version`
if [ "${ppver}" '<' "3.2.0" ] ; then
    # need to install
    # FIXME - change to clone specific version
    git clone https://github.com/pahoughton/install-puppet
    sudo -n python install-puppet/bin/install-puppet.py || exit 1
fi

[ -d modules ] || mkdir modules
cd modules

# grab my python module for pip3 provider
git clone https://github.com/pahoughton/puppet-python python
# is python3 installed?
python3 --version > pyver.$$.tmp 2>&1
pyver=`grep Python pyver.$$.tmp`
rm pyver.$$.tmp
if [ "${pyver}" '<' "Python 3.1.0" ] ; then
    # need to install
    cd ..
    sudo -n puppet apply -v --modulepath=modules -e 'include python'  || exit 1
fi

if [ -f "${setup_ppmod}" ] ; then
    echo "Documentation LIES ..."
    echo "Unsupported ${setup_ppmod}"
    exit 1
fi


popd
pwd
ls
sudo -n puppet apply -v --modulepath="${mydir}/modules" "${setup_pp}"
# travis-ci needs any gem's installed as the normal user
if [ -n "${TRAVIS}" ] ; then
    puppet apply -v --modulepath="${mydir}/modules" "${setup_pp}"
fi
