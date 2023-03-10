# RB120 Praciice Problems

__What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?__

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
Line 15 outputs `nil`. 

On line 15, the instance method `name` was invoked on the `Person` object referenced by the local variable `bob` which was instantiated on line 14.

`name` is a getter method that returns the value of the `@name` instance variable and is defined in the `Person` class by the `attr_reader :name` method invocation.

`bob.name` returns `nil` because the `@name` isntance variable is not yet initialized. So Ruby returns `nil` when uninitialized instance variables are referenced.

This differentiates instance variables from local variables in the way that when an uniitialized local variable is referenced, an exception is raised.

