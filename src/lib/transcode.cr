module Transcode
  extend self

  # Converts a string containing a numeric representation of a dollar amount
  # into it's English equivalent.
  def dollars(amount : String) : String
    # TODO: implement parser
    ""
  end

  # Creates a Proc that splits strings representing positive integers into
  # chunks of digits. Each chunk of size x will represent value of 10^(xn),
  # where x is the chunk size and n is the array index.
  #
  #    chunker(3) "123456789" # => [789, 456, 123]
  #
  def chunker(size : Number) : String -> Array(Int32)
    ->(numberString : String) do
      numberString.reverse
                  .scan(/\d{1,#{size}}/)
                  .map(&.[0])
                  .map(&.reverse)
                  .map(&.to_i)
    end
  end
end
