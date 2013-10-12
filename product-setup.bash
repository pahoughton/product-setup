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

mydir=`pwd`/`dirname "$0"`
setup_pp=${1:'product-setup.pp'}
setup_ppmod="${setup_pp}"mod

if [ ! -f "${setup_pp}" ] ; then
    echo "ERROR: file: ${setup_pp} not found!"
    exit 2
fi

pushd "${mydir}"

# is puppet installed?
ppver=`puppet --version`
if [ "${ppver}" < "3.2.0" ; then
    # need to install
    git clone https://github.com/pahoughton/install-puppet
    python install-puppet/bin/install-puppet.py || exit 1
fi

# is python3 installed?
pyver=`python3 --version`
if [ "${pyver}" < "3.1.0" ] ; then
    # need to install
    git clone https://github.com/pahoughton/puppet-python
    pushd puppet-python
    rake install || exit 1
    puppet apply -e 'python { 'python install' : }'  || exit 1
    popd
fi

popd

if [ -f "${setup_ppmod}" ] ; then
    echo "Documentation LIES ..."
    echo "Unsupported ${setup_ppmod}"
    exit 1
fi

puppet apply "${setup_pp}"
    
