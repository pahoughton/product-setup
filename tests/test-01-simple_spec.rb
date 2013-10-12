# test-01-simple_spec.rb - 2013-10-12 12:14
#
# simple rspec test for bison install
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>

describe "Feature install simple package - bison" do
  it "provides bison" do
  # run bison --version and get a valid value
    `bison --version`.should include("GNU Bison")
  end
end
