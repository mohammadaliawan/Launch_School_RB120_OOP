class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
p cat1.color

# [Cat, Animal]

=begin
`cat1` refernces a `Cat` object. On line 16 when we invoke 
the `#color` instance method on the `cat1` object, Ruby starts
its search for the method definition by first looking in the 
calling object's class i.e. the `Cat` class. Since there is no
`#color` method defined there, Ruby next searches the `Animal`
class for the `#color` method as `Animal` is the superclass for
  `Cat` class. The `#color` getter method is created because of the 
  `attr_reader` method invocation on line 2. So when Ruby finds this
  method in the `Animal` class, Ruby executes this method and stops looking
  further up the method lookup path. So only the `Cat` and the `Animal` classes
  are searched.

=end