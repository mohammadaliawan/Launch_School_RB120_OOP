class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side)
    super(side, side)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"

=begin
Since `Square` subclasses from the `Rectangle` class, it inherits
all the instance methods defined in the `Rectangle` class i.e.
the `#area` and `initialize`. We could use these methods as they are 
with `Square` objects but the only problem is that the `Rectangle#initialize`
method takes two arguments while we only want to provide one argument while initializing
the object as on line 18 i.e. the length of the side of the square.

We can do this by defining an `Square#initialize` method that will
override the `Rectangle#initialize` method and we can use `super` to invoke
the `Rectangle#initialize` method while passing the side argument twice to `super`.
`super` when invoked with any specific srguments, invokes a method of the same
name earlier in the method lookup path and forwards only those arguments to the method.
So both the @height and @width instance variables will be assigned to the 
same integer value.

=end