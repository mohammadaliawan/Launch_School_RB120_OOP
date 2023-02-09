class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# [Cat, Animal, Object, Kernel, BasicObject]

=begin
Ruby raises an exception, a NoMethodError. The reason for this is
that it does not find the `#color` method defined in any of the
classes/modules in the method lookup path. First it looks in the class of 
the calling object i.e. `Cat`, not finding the method defined in `Cat`
it goes up the method lookup path to the `Animal` class. `Animal` also does not define the
`#color` method. So Ruby goes further up to the `Object` class. And then in the 
`Kernel` module which is included in the `Object` class. And finally it searches
the `BasicObject` class. And this is the last place it looks for the `#color` method


=end