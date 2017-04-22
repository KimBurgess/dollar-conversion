require "spec"
require "../src/lib/wordify"

describe Wordify do
  describe ".chunker" do
    it "chunks values that align with chunk size" do
      hundredsChunker = Wordify.chunker(3)
      hundredsChunker.call(123456789).should eq [789, 456, 123]
    end

    it "chunks values that do not align with chunk size" do
      hundredsChunker = Wordify.chunker(3)
      hundredsChunker.call(12345678).should eq [678, 345, 12]
    end

    it "chunks values less than the chunk size" do
      Wordify.chunker(5).call(123).should eq [123]
    end

    it "works for zero" do
      Wordify.chunker(3).call(0).should eq [0]
    end
  end

  describe ".numberToWords" do
    it "works for zero" do
      Wordify.numberToWords(0).should eq "zero"
    end

    it "works for values < 10" do
      Wordify.numberToWords(4).should eq "four"
    end

    it "workd for teen values" do
      Wordify.numberToWords(17).should eq "seventeen"
    end

    it "works for whole multiples of 10" do
      Wordify.numberToWords(60).should eq "sixty"
    end

    it "works for complex / concatenated values < 100" do
      Wordify.numberToWords(48).should eq "fourty-eight"
    end
  end
end
