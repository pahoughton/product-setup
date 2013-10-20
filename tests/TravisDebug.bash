#!/bin/bash
# TravisDebug.bash - 2013-10-19 08:39
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
set -x
env
ls -al
apt-cache policy
curl http://python-distribute.org/distribute_setup.py | sudo python3
curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python3
pip-3.3 --version
# sudo -n apt-get install python3-pip

# apt-cache search '.*'
