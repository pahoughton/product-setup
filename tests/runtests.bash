#!/bin/bash
# runtests.bash - 2013-10-12 10:24
#
# Each test has 2 or 3 files.
#   test*setup.pp - the setup-product.pp file
#   test*setup.ppmod - puppet modules file
#   test*setup_rspec.rb - the actual tests
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
set -x

if [ "`uname -s`" == 'Darwin' ] ; then
    PATH="${PATH}:/opt/local/bin"
fi

[ -d tests ] && cd tests

[ -d _test_product_temp ] || mkdir _test_product_temp/
touch _test_product_temp/.sloccount.skip
pushd ..
proddir=`pwd`
popd

[ -d _test_product_temp/_setup_temp ] || \
    ln -s "${proddir}" _test_product_temp/_setup_temp

fail=0

for fn in test*.pp; do
    cat config.pp "$fn" > "_test_product_temp/setup-product.pp"
    [ -f "${fn}mod" ] && cp "${fn}mod" "_test_product_temp/setup-product.ppmod"
    pushd _test_product_temp > /dev/null
    bash _setup_temp/product-setup.bash || fail=1
    popd > /dev/null
    rspec "`basename ${fn} .pp`_spec.rb" || fail=1
done

if [ $fail != 0 ] ; then
    echo "FAILED - $fail"
fi
exit $fail
