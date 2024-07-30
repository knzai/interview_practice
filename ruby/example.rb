#!/usr/bin/env ruby
require './scrabble'

puts Scrabble::Dictionary.from_file("dictionary.txt").possible_words(ARGV.first)