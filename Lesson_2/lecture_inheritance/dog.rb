class Pet
  def run
    "running"
  end

  def jump
    "jumping"
  end
end

class Dog < Pet
  def fetch
    "fetching"
  end

  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Cat < Pet
  def speak
    "Meow!"
  end
end

class BullDog < Dog
  def swim
    "can't swim"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run                # => "running!"
pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"