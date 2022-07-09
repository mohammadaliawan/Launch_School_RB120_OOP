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
  - the 
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

