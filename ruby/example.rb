#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
Options = Struct.new(:name)

# rubocop:disable Metrics/MethodLength
# Ruby's default CLI flag and option parsing
class Parser
  def self.parse(options)
    args = Options.new('world')

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: example.rb [options]'

      opts.on('-nNAME', '--name=NAME', 'Name to say hello to') do |n|
        args.name = n
      end

      opts.on('-h', '--help', 'Prints this help') do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)
    args
  end
end
# rubocop:enable Metrics/MethodLength

def my_function
  options = Parser.parse ARGV
  puts options.name

  0
end
my_function
