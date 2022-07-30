class Animal
  def eat
    "Eating food..."
  end
end

class Dog < Animal
  def eat
    "Eating Dog Food..."
  end
end

class Cat < Animal
  def eat
    "Eating Cat Food..."
  end
end

animals = [Dog.new, Cat.new, Animal.new]

animals.each {|animal| puts animal.eat}

=begin


=end