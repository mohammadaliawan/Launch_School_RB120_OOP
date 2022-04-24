class Animal
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

class GoodDog < Animal
  attr_accessor :color

  def initialize(color)
    super
    self.color = color
  end
end

bruno = GoodDog.new("brown")

p bruno


