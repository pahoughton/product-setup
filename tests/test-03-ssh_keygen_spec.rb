# test-03-ssh_keygen_spec.rb - 2013-10-18 07:10
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>

describe "Feature use ssh_keygen module to create a key" do
  it "creates id_rsa file" do
    File.exist?(File.expand_path('~george/.ssh/id_rsa')).should be_true
  end
end
