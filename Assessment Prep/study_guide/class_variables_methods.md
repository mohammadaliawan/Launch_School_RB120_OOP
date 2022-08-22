# Class variables and Class Methods

## Class Methods

Class methods are methods we can call direclty on the class itself without having to instantiate any objects.

Class methods are where we put functionality that does not pertain to individual objects. Objects contain state, and if we have a method that does not need to deal with states, then we can just use a class method,

class methods are defined in the following way:

```ruby
class Computer
  def self.total
    @@total_computers
  end
end

Computer.total
```
The method name is prepended with the keyword `self`. Here `self` refers to the class itself.

The class method is invoked by calling the method directly on the class itself as shown above.

## Class Variables

Class variables are used to capture information related to an entire class. They are used to keep track of a class level detail.

They are created by prepending two `@@` symbols to the variable name.

Class variables can be accessed in an instance method.

```ruby
class Computer
  @@total_computers = 0
end
```

