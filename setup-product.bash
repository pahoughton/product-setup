#!/bin/bash
# setup-product.bash - 2013-10-12 12:15
#
#   see https://github.com/pahoughton/product-setup for details
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
[ -z "${DEBUG}" ] || set -x

[ -d _setup_temp ] || git clone https://github.com/pahoughton/product-setup _setup_temp
pushd _setup_temp
git checkout devel
popd
bash _setup_temp/product-setup.bash
DEBUG="${DEBUG}" bash _setup_temp/product-setup.bash

