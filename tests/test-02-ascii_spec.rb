# test-02-ascii_spec.rb - 2013-10-12 12:32
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#

describe "Feature install simple package - ascii" do
  it "provides ascii" do
    `ascii -v`.should include("ascii 3")
  end
end
