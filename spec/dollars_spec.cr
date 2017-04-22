require "spec"
require "../src/dollars"

describe "dollars conversion" do
  it "works for well formed values" do
    dollars("1.11").should eq "one dollar and eleven cents"
    dollars("1.01").should eq "one dollar and one cent"
  end

  it "works for empty values" do
    dollars("").should eq "zero dollars and zero cents"
  end

  it "works for value with no decimal point" do
    dollars("0").should eq "zero dollars and zero cents"
    dollars("1").should eq "one dollar and zero cents"
  end

  it "works for values with a single digit for cents" do
    dollars("0.1").should eq "zero dollars and ten cents"
    dollars("1.0").should eq "one dollar and zero cents"
  end

  it "works for value with a trailing dot" do
    dollars("1.").should eq "one dollar and zero cents"
    dollars("0.").should eq "zero dollars and zero cents"
  end

  it "works for value with a leading dot" do
    dollars(".34").should eq "zero dollars and thirty-four cents"
  end

  it "works for values that need to be rounded" do
    dollars("0.3456789").should eq "zero dollars and thirty-four cents"
  end

  it "works for large values" do
    dollars("1000456.13").should eq "one million four hundred and fifty-six dollars and thirteen cents"
  end
end
