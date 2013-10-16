#!/bin/bash
# setup-product.bash - 2013-10-12 12:15
#
#   see https://github.com/pahoughton/product-setup for details
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
[ -n "${DEBUG}" ] && set -x
cat >> ~/.ssh/config <<EOF
Host heroku.com
    StrictHostKeyChecking no
Host github.com
    StrictHostKeyChecking no
EOF

[ -d _setup_temp ] || git clone https://github.com/pahoughton/product-setup _setup_temp
pwd
ls -l
DEBUG="${DEBUG}" bash _setup_temp/product-setup.bash

