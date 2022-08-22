# Fake operators and equality

Many operators in Ruby are actually method calls that are using Ruby's syntactical sugar to appear as operators to provide a more natural syntax. These methods are called fake operators.

Because they are methods, we can define our own implementations of them within our own custom classes. Doing so overrides the fake operators from the superclasses where they are defined. 

While defining our own fake operators, it is important to follow the conventions established for them in the Ruby Core Library so that others who use those operators can understand how those operators work without needing to know the exact implementations of them.

## Equivalence

Equivalence is the idea of equality. It is used by many built-in Ruby objects to evaluate the equality of two objects of the same class.
The `==` is a fake operator that is actually a method and it is used by many Ruby built-in objects to check for equivalence of two objects of that class.

Many of these built-in classes defines their own implementation for the `==` method. So for string objects the idea of equivalence means something else and for array objects it means something else.

But essentially, for all these classes the `==` method checks to see the 'values' for the two compared objects are the same. Now 'values' for string objects would be different from integer objects. So each class defines what value is being compared when an object is compared to another object using `==`.

The same way if we want to compare objects of our custom classes and check for equivalence, we need to define the `==` method to override the default `BasicObject#==` method. This custom method then needs to define which 'values' of the custom objects need to be the same for the objects to be considered equivalent.

```ruby
class Person
  attr_accessor :name

```



`==`

- for most objects, the == operator compares the values of the objects, and is frequently used.
- the == operator is actually a method. Most built-in Ruby classes, like Array, String, Integer, etc. provide their own == method to specify how to compare objects of those classes.
- by default, BasicObject#== does not perform an equality check; instead, it returns true if two objects are the same object. This is why other classes often provide their own behavior for #==.
- if you need to compare custom objects, you should define the == method.
understanding how this method works is the most important part of this assignment.

## Comparison

### Example

```ruby
class Dog
  attr_reader :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_dog)
    age > other_dog.age
  end
end
```