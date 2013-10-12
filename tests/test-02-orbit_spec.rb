# test-02-orbit_spec.rb - 2013-10-12 12:32
#
# Copyright (c) 2013 Paul Houghton <paul4hough@gmail.com>
#

describe "Feature install simple package - orbit" do
  it "provides orbit" do
    `orbit --version`.should include("0.5")
  end
end
