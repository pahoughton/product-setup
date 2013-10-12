## product-setup

[![Test Build Status](https://travis-ci.org/pahoughton/...png)](https://travis-ci.org/pahoughton/..)

Resolves product dependencies with puppet. The value of this product
is that it installs puppet first, then resolves the products
dependencies. Primary use is for multi language (c, py, php) products
that run tests on bare virtual machines.

## Features

Can fully configure a system for any product using puppet and existing
puppet modules on bare bones hosts.

Currently testing on:

* Fedora
* Ubuntu
* Darwin (Mac OS X)

## Usage

copy setup-product.bash to your project's top level directory, it
contains two lines:

    git clone https://github.com/pahoughton/product-setup _setup_temp
	bash _setup_temp/product-setup.bash

You also need a puppet module to describe your dependencies. The
default filename is setup-product.pp, but you can pass any name as an
argument to product-setup.bash. For example:

	package { 'emacs' :
	  ensure => 'installed'
	}

Now emacs will be installed correctly when product-setup.bash
completes.

## Contribute

[Github pahoughton/..](https://github.com/pahoughton/..)

## Licenses

Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>

[![LICENSE](http://i.creativecommons.org/l/by/3.0/88x31.png)](http://creativecommons.org/licenses/by/3.0/)

[![endorse](https://api.coderwall.com/pahoughton/endorsecount.png)](https://coderwall.com/pahoughton)
