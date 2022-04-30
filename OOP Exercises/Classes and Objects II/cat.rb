class Cat
  COLOR = "purple"
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def to_s
    "I'm #{name}"
  end
end


kitty = Cat.new('Sophie')

puts kitty