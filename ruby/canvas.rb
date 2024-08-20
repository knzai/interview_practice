class Canvas < Array
  attr_accessor :width, :height

  def initialize(width, height)
    self.width = width
    self.height = height
    (0..height).each do |i|
      self[i] = " " * width
    end
  end

  # def [](index)
  #   self[index] = [] unless self[index]
  # end



  def draw_horizontal(index)
    self[index] = ("-" * self.width)
  end

  def draw_vertical(index)
    self.each do |line|
      line[index] = "|"
    end
  end


end