require "spec"
require "../src/lib/transcode.cr"

describe Transcode do
  describe ".dollar" do
    it "works for well formed values" do
      Transcode.dollars("1.11").should eq "one dollar and eleven cents"
      Transcode.dollars("1.01").should eq "one dollar and one cent"
    end

    it "works for empty values" do
      Transcode.dollars("").should eq "zero dollars and zero cents"
    end

    it "works for value with no decimal point" do
      Transcode.dollars("0").should eq "zero dollars and zero cents"
      Transcode.dollars("1").should eq "one dollar and zero cents"
    end

    it "works for values with a single digit for cents" do
      Transcode.dollars("0.1").should eq "zero dollars and ten cents"
      Transcode.dollars("1.0").should eq "one dollar and zero cents"
    end

    it "works for value with a trailing dot" do
      Transcode.dollars("1.").should eq "one dollar and zero cents"
      Transcode.dollars("0.").should eq "zero dollars and zero cents"
    end

    it "works for value with a leading dot" do
      Transcode.dollars(".34").should eq "zero dollars and thirty-four cents"
    end

    it "works for values that need to be rounded" do
      Transcode.dollars("0.3456789").should eq "zero dollars and thirty-four cents"
    end

    it "works for large values" do
      Transcode.dollars("1000456.13").should eq "one million four hundred and fifty-six dollars and thirteen cents"
    end
  end
end
