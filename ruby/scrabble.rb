module Scrabble
  module FreqHash
    def self.extended(mod)
      mod.default = 0
    end

    def <= (rhs)
      select{ |k, v| (v - rhs[k]) > 0}.empty?
    end
  end

  class Dictionary < Hash
    def self.from_file(file_path)
      self.new(File.open(file_path).readlines.map(&:strip))
    end

    def initialize(lines)
      lines.each do |line|
        self[line] = line.chars.tally.extend(FreqHash)
      end
    end

    def possible_words(word)
      self.select { |k, v| v <= word.chars.tally.extend(FreqHash) }.keys
    end
  end
end