# Polymorphism

Polymorphism refers to the ability of different object types to respond to the same method invocation in different ways.

In other words, different data types can respond to a common interface.

When two or more object types have a method with the same name, we can invoke that method with any of those objects.

When we don't care what type of object is calling the method, we are using polymorphism.

## Two ways of implementing polymorphism

1. Inheritance
2. Duck Typing

### Polymorphism through inheritance

Example:

```ruby
class Engineer
  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age = age
  end

  def design
    puts "I am designing."
  end
end

class CivilEngineer < Engineer
  def design
    puts "Designing the foundations"
  end
end

class StructuralEngineer < Engineer
  def design
    puts "Designing the structure"
  end
end

```