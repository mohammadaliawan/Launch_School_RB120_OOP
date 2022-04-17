class MyCar
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def spray_paint(color)
    color = color
  end
end

lumina = MyCar.new("white")

puts lumina.color

lumina.color = "Black"

puts lumina.color


