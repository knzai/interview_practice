#!/usr/bin/env ruby
require 'optparse'
require './linked_list'
Options = Struct.new(:name)

class Parser
  def self.parse(options)
    args = Options.new("world")

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"

      opts.on("-nNAME", "--name=NAME", "Name to say hello to") do |n|
        args.name = n
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)
    return args
  end
end

@list1 = Node.new(4)
@list1.push(3)
@list1.push(6)

@list2 = Node.new(3)
@list2.push(8)
@list2.push(2)


carry = 0
sums = @list1.map(&:h).zip(@list2.map(&:h)).map(&:sum).map { |n| (n % 10 + carry).tap{carry = n / 10 } }

pp sums.drop(1).inject(Node.new(sums.first)) { |a, s| a.append(s); a}


def my_function
  options = Parser.parse ARGV
  puts options.name

  return 0
end
my_function()