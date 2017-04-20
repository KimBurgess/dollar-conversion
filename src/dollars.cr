require "cli"
require "./lib/transcode"

class Dollars < Cli::Command
  class Help
    header "Converts numeric dollar amounts into words."
  end

  class Options
    arg "amount", desc: "amount to convert (e.g. 1.42)", default: ""
    help
  end

  def run
    puts Transcode.dollars args.amount
  end
end

Dollars.run ARGV
