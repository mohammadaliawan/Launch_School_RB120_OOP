class Animal
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def speak
    "Hello!"
  end
end

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  private

  def human_years
    age * DOG_YEARS
  end

end

class BadDog < Animal
  attr_accessor :age, :name

  def initialize(age, name)
    super(name)
    self.age = age
  end
end

class Cat < Animal

end

# bruno = GoodDog.new("Brown")
# bear = BadDog.new(2, "bear")
# # paws = Cat.new

# p bruno
# p bear.age

# # puts sparky.speak
# # puts paws.speak

sparky = GoodDog.new("Sparky", 4)
p sparky.public_disclosure