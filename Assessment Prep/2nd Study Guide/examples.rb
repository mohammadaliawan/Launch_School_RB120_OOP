class GoodDog
  puts self

  attr_accessor :name
  @@total_gooddogs = 0

  def initialize(name)
    @@total_gooddogs += 1
    self.name = name
  end

  def what_is_self
    self
  end

  def speak
    puts "#{name} says Arf!!"
  end

  def self.total_gooddogs
    @@total_gooddogs
  end
end

sparky = GoodDog.new("Sparky")
fido = GoodDog.new("Fidos")

# sparky.speak
# fido.speak

# p sparky.what_is_self
# p fido.what_is_self
