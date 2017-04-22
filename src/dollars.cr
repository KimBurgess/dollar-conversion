require "cli"
require "./lib/wordify"

class App < Cli::Command
  class Help
    header "Converts numeric dollar amounts into words."
  end

  class Options
    arg "amount", desc: "amount to convert (e.g. 1.42)", default: ""
    help
  end

  def run
    puts dollars args.amount
  end
end

# Converts a string containing a numeric representation of a dollar amount
# into it's English equivalent.
def dollars(amountAsNumeric : String) : String
  # note: examples included in project spec showed cents being rounded down
  # rather than rounded to the closest whole cent, normalisation follows this.
  normalise = ->(x : Float64) { ((x < 1) ? (x * 100).floor : x).to_i }

  begin
    amount = amountAsNumeric.to_f
  rescue
    amount = 0.0
  end

  dollars, cents = amount.divmod(1)
                         .map(&normalise)
                         .map { |x| Wordify.numberToWords(x).as String }

  dollars = Wordify.append_unit dollars, "dollar"
  cents = Wordify.append_unit cents, "cent"

  "#{dollars} and #{cents}"
end

App.run ARGV
