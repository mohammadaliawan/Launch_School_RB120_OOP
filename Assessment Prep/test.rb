class Pet
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def ==(other_pet)
    self.name == other_pet.name
  end
end

pet1 = Pet.new("buddy")
pet2 = Pet.new("bud")

p pet1 == pet2