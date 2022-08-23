# Class variables and Class Methods

## Class Methods

- methods that we call on the class itself, without instantiating any objects of that class
- defined by prepending the class name with self, self refers to the class itself
- define functionality that does not pertain to individual objects
- methods that do not need to need to deal with state

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

- capture information related to an entire class
- keep track of a class level detail
- available to every object of a class and subclass inside instance methods
- All objects of the class and subclass share one copy of the class variable
- scoped at the class level.
- Class methods can access class variables regardless of where they are initialized
- are initialized when the class is evaluated by Ruby, 
- donot require methods that explicitly initialize them
- class variables share state between objects

Class variables are used to capture information related to an entire class. They are used to keep track of a class level detail.

They are initialized when the class is evaluated by Ruby.

They are created by prepending two `@@` symbols to the variable name.

Class variables can be accessed in an instance methods.

```ruby
class Computer
  @@total_computers = 0
end
```

