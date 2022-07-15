# RB129 Practice Problems

 What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?

```ruby
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
``` 

- output
- why
- instance variables vs. local variables

The last line outputs `nil`. This happens because when the getter method `name` which is an instance method is invoked on the object referenced by `bob`  it returns `nil`. The reason it returns `nil` is because the getter method `name` returns the value for the instance variable `@name` and `@name` has not been initialized yet. Ruby returns `nil` when an uninitialized instance variable is referenced. 

This differentiates instance variables from local variables which if referenced before initialization raise an exception called `NameError`. 

To initialize `@name` we need to first invoke the setter method `set_name` on the `bob` object. This method will assign the string object `"Bob"` to the the instance variable `@name`.


> What is output and why? What does this demonstrate about instance variables?

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim
```

- output
- why
- demonstrate about instance variables

Line `47` outputs `nil` because the `swim` method invocation on line `47` returns `nil`. It returns `nil` because the test expresson `@can_swim` for the `if` modifier on line `42` returns `nil`as `@can_swim` is yet uninitialized Since `nil` is falsey, the `if` expression returns `nil` and being the last line in the method `swim` , `nil` is returned by the `swim` method which is then output by the `p` method.

To initialize the `@can_swim` variable we need to first invoke the `enable_swimming` method which is provided by the `Swim` module mixid in to the `Dog` class on line `39`. The `enable_swimming` method will initialize `@can_swim` to the object `true`. Now that , `@can_swim` is initialized to `true` , the `if` conditional on line `42` will return the string object `"swimming"`. And this will be returned by the `swim` method invocation. 

This demonstrates that ruby returns `nil` if uninitialized instance variables are referenced instead of raising an error.

> What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above

```ruby
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides  # Square < Quadrilateral (Constant) < Shape ()
p Square.new.sides 
p Square.new.describe_shape 
```