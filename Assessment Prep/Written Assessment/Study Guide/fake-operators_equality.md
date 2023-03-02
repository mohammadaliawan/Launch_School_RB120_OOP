# Equivalence

When comparing string, integers or symbols using the `==` method, the objects know to compare values even though they are different objects. 

When we want to check if two variables point to the same object we can use the `equal?` method

The `==` method compares compares the values of two objects whereas the `equal?` method determines whether two variables point to the same object.

How does the `==` method know what value to use for comparison?

Since it is an instance method, its determined by how this method is defined by the class.

The original `==` method is defined in the `BasicObject` class which is the superclass for all classes in Ruby. Thus, every object in Ruby has a `==` method. However, each class should define the `==` method to specify the value to compare.

The default implementation for `==` is the same as `equal?` method. It checks if both objects are the same object.

```ruby
class Pet
  attr_accessor :name

  def ==(other_pet)
    self.name == other_pet.name
  end
end

pet1 = Pet.new("buddy")
pet2 = Pet.new("buddy")

pet1 == pet2
```

By defining a `==` method in our `Pet` class, we are overriding the default `BasicObject#==` behaviour and providing a much more meaningful way to compare `Pet` objects.

`==`

- for most objects, the == operator compares the values of the objects, and is frequently used.
- the `==` operator is actually a method. Most built-in Ruby classes, like Array, String, Integer, etc. provide their own `==` method to specify how to compare objects of those classes.
- by default, `BasicObject#==` does not perform an equality check; instead, it returns true if two objects are the same object. This is why other classes often provide their own behavior for `#==`.
- if you need to compare custom objects, you should define the `==` method.
- understanding how this method works is the most important part of this assignment.