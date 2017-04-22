module Wordify
  extend self

  alias UInt = UInt8 | UInt16 | UInt32 | UInt64

  NUMS = ["zero", "one", "two", "three", "four", "five", "six", "seven",
    "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
    "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
  ]

  TENS = ["", "", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy",
    "eighty", "ninety"]

  SCALES = [nil, "thousand", "million", "billion", "trillion", "quadrillion",
    "quintillion", "sextillion", "septillion", "octillion", "nonillion",
    "decillion", "undecillion", "duodecillion", "tredecillion",
    "quatttuor-decillion", "quindecillion", "sexdecillion", "septen-decillion",
    "octodecillion", "novemdecillion", "vigintillion", "centillion"]

  # Appends a correctly plurarised unit suffix.
  def append_unit(value : String, unit : String) : String
    singular? = value == NUMS[1]
    "#{value} #{unit}#{"s" unless singular?}"
  end

  # Append an appropriate scale (thousand, million etc) to a word string, nil if
  # not required.
  def append_scale(value : String, scale : Number) : String?
    if SCALES[scale]?
      zero? = value == NUMS[0]
      zero? ? nil : "#{value} #{SCALES[scale]}"
    else
      value
    end
  end

  # Converts a positive integer value < 1000 into it's english equivalent.
  def hundredsToWords(amount : Int) : String
    raise ArgumentError.new if amount < 0 || amount >= 1000

    if amount < 20
      NUMS[amount]
    elsif amount < 100
      tens, units = amount.divmod 10
      if units > 0
        "#{TENS[tens]}-#{hundredsToWords units}"
      else
        TENS[tens]
      end
    else
      hundreds, tens = amount.divmod 100
      if tens > 0
        "#{hundredsToWords hundreds} hundred and #{hundredsToWords tens}"
      else
        "#{hundredsToWords hundreds} hundred"
      end
    end
  end

  # Converts positive integer values into their English equivalent.
  def numberToWords(value : Int) : String
    raise ArgumentError.new if value < 0

    chunker(3).call(value)
              .map { |x| hundredsToWords(x).as String }
              .each_with_index
              .compact_map { |x| append_scale x[0], x[1] }
              .to_a
              .reverse
              .join " "
  end

  # Creates a Proc that splits positive integers into chunks of digits. Each
  # chunk of size x will represent value of 10**(xn), where x is the chunk size
  # and n is the array index.
  #
  #    chunker(3) 123456789 # => [789, 456, 123]
  #
  def chunker(size : Int, chunks = [] of Int32 | Int64)
    ->(x : Int32 | Int64) do
      a, b = x.divmod (10 ** size)
      chunks << b
      chunks + chunker(size, chunks).call(a) if a > 0
      chunks
    end
  end
end
