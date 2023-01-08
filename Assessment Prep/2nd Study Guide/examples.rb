class Animal
  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def older_than?(other_animal)
    self.human_years > other_animal.human_years
  end

  protected

  def human_years
    age * self.class::ANIMAL_YEARS
  end
end

class GoodDog < Animal
  ANIMAL_YEARS = 7

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end
end

sparky = GoodDog.new("sparky", 4)
fido = GoodDog.new("fido", 3)

sparky.human_years
p sparky.older_than?(fido)