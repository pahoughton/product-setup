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
    git clone https://github.com/pahoughton/install-puppet
    pushd install-puppet; git checkout stable; popd
    sudo -n python install-puppet/bin/install-puppet.py || exit 1
fi

[ -d modules ] && rm -rf modules
[ -f Puppetfile ] && rm Puppetfile

gem install librarian-puppet
librarian-puppet init

if [ -f "${setup_ppmod}" ] ; then
    cp "${setup_ppmod}" Puppetfile
fi
cat >> Puppetfile <<EOF
mod "python",
  :git => "https://github.com/pahoughton/puppet-python",
  :ref => "stable"
EOF
librarian-puppet install
sudo -n puppet apply -v --modulepath=modules -e 'include python'  || exit 1

popd
pwd
ls
sudo -n puppet apply -v --modulepath="${mydir}/modules" "${setup_pp}"
# travis-ci needs any gem's installed as the normal user
if [ -n "${TRAVIS}" ] ; then
    puppet apply -v --modulepath="${mydir}/modules" "${setup_pp}"
fi
