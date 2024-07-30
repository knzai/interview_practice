module Scrabble
  module FreqHash
    def self.extended(mod)
      mod.default = 0
    end

    def -(rhs)
      newh = self.clone
      rhs.each do |k, v|
        newh.delete(k) if (newh[k] -= v) <= 0
      end
      newh
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
      self.select { |k, v| (v - word.chars.tally ).empty? }.keys
    end
  end
end

