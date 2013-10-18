# setup-product.pp - 2013-10-14 06:24
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#
Package {
  provider => $osfamily ? {
    'Darwin'  => macports,
    default   => undef,
  }
}
case $::osfamily {
  'RedHat' : {
    $pkg_list = ['ruby-devel']
  }
  default : {
    $pkg_list = ['ruby-full']
  }
}
package { $pkg_list :
  ensure    => 'installed',
}
package { ['rspec-core',
          'puppet',
          'puppet-lint',
          'rspec-puppet',
          'puppetlabs_spec_helper',
          'librarian-puppet'] :
  ensure    => 'installed',
  provider  => 'gem',
}

