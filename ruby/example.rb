#!/usr/bin/env ruby
require 'optparse'
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

@arr = []

File.open("dictionary.txt", "r") do |f|
  f.each_line do |line|
    @arr.push(line.strip)
  end
end


def count_letters(collection)
  collection.map { |ele| ele.chars.tally }
end


#@lcs = count_letters(@arr)


def exists(word)
  #puts word.strip
  #@arr.index(word)
  wh = word.chars.tally

  @arr.map do |line|
    fh = line.chars.tally



    # wh.select do |k, v|
    #   if lv = fh[k]
    #     lv - v <= 0
    #   else
    #     false
    #   end
    # end
  end

  #puts @lcs.select { |line| (line.to_a - w.to_a) == [] }

  #puts @lcs
  
end

#puts @arr

options = Parser.parse ARGV
puts exists(options.name)

#my_function()