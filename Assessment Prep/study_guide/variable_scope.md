# Variable Scope

## Instance Variable Scope

Instance variables are scoped at the object level. They do not cross over between objects.

Because the scope of instance variables is at the object level, this means that instance variables are accessible in an object's instance methods even if it is initialized outside that method.

### What differentiates instance variables from local variables?

Instance variables are accessible inside an instance method even if they have not been initialized inside that method or passed in as an argument because they are scoped at the object level. 

### What happens if you try to access an instance variable that has not been initialized anywhere?

If we try to access an instance variable that has not been initialized, Ruby returns `nil` but if we try to access a local variable before it is initialized, we get a `NameError`.

**Instance variables should be initialized inside instance methods only. If instance variables are initialized at the class level they are known as class instance variables.**

```ruby
class Computer
  def initialize(storage)
    @storage = storage
  end

  def get_storage
    @storage
  end

end

home_computer = Computer.new("350 GB")
laptop = Computer.new("150 GB")

p home_computer.get_storage
p laptop.get_storage 

```

Instance variables have object level scope which means that each individual object can access only the instance variables associated with it. Instance variables donot cross over between objects.

In the above example, on lines `x` to `x` we have defined a class `Computer` and instantiated two `Computer` objects `home_computer` and `laptop` on lines `x` and `x` respectively. We have initialized both objects with their own instance variable `@storage`in the `initialize` method which is invoked by the `new` method. 

On lines `x` and `x` we invoke the `get_storage` method on both objects `home_computer` and `laptop` which return the value for their respective instance variables `@storage`. The output for line `x` is `"350 GB"` while for line `x` the output is `"150 GB"` which is what we passed into the `new` method during instantiation.

This shows that instance variables are scoped at each individual object's level. In other words, each individual object has its own copy of the instance variable.

## Class Variables

Class variables are scoped at the class level.

- All objects of a class share 1 copy of the class variable. 
- Objects can access class variables through instance methods
- Class methods can access class variables regardless of where they are initialized.

Even if there are several different objects of a class, all those objects will access or modify one copy of that class variable. So, effectively, the same class variable is shared by all objects of the class. So any object can modify the class variable. Hence, we can say that class variables can share state between objects, unlike instance variables or local variables.

```ruby
class Computer
  @@total_computers = 0

  def initialize(storage)
    @@total_computers += 1
  end

  def total_computers
    @@total_computers
  end

  def self.total_computers
    @@total_computers
  end

end

home_computer = Computer.new
laptop = Computer.new

p Computers.total_computers
p laptop.total_computers
p home_computer.total_computers

```

In the above example, on lines `x` to `x` we have defined a class `Computer` and instantiated two `Computer` objects `home_computer` and `laptop` on lines `x` and `x` respectively. In the class definition we have initialized a class variable `@@total_computers` to the integer object `0`. 

In the `Computer` class definition we have also defined an `initialize` method which gets invoked whenever a new `Computer` object is instantiated using the `new` method. This is an instance method and this method increments the value for `@@total_computers` by 1 each time a new `Computer` object is created.

In addition, we have also defined an instance method `total_computers` and a class method `total_computers`. Each of these returns the value for the `@@total_computers` class variable.

First we invoke the class method `total_computers` on the class `Computer` and output the result. The output is `2`. Then we invoke the instance method `total_computers` on the `laptop` object and output the result. The output is `2` again. Then we do the same with the `home_computer` object and output is `2 `yet again.

This shows two things: first that all objects of a class can access class variables through instance methods, second that all objects share one copy of a class variable which is why both lines `81` and `82` output the same value `2`.

## Constants

Constants have lexical scope. Lexical scope means that where the constant is defined in the source code determines where it is available. When Ruby tries to resolve a constant it searches lexically - that is, it searches the surrounding structure of the constant reference. 


### Constant Lookup

Ruby first attempts to resolve a constant reference in the lexical scope of the reference. This means it first searches the class or module that encloses the reference to see if that class or module defines the constant. If not, it searches the next enclosing class or module. This continues if there are no more enclosing classes or modules.  If no constant definition is found in the lexically enclosing scope, ruby next tries to resolve the constant in the inheritance heirarchy by checking the ancestors of the class or module that referred to the constant.
If no constant definition is found in the inheritance heirarchy, then top level constant definition is checked.

## Variable Scope and Inheritance

### Instance Variables and class inheritance

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark bark #{@name} bark bark"
  end
end

fido = Dog.new("Fido")
puts fido.dog_name
```

In the above code, we have defined two classes `Animal` and `Dog`. `Dog` is a subclassed from `Animal`. On line `x` we instantiate a new `Dog` object by invoking the `new` class method on `Dog` and pass in the string object `"Fido"` as an argument. The `new` method invokes the instance method `initialize` . Ruby looks for the `initialize` method in `Dog` but not finding it there goes up the method lookup path to the superclass for `Dog` i.e. `Animal`. It finds the `initialize` method there and invokes it and initializes the `@name` instance variable to the argument passed to `new` i.e. the string object `"Fido"`. 

So the `@name` instance variable associated with the `fido` object has been initialized and is available at the object level being an instance variable and hence is available in instance methods. So when the `dog_name` instance method is invoked on line `x` on the `fido` object, the value for `@name `instance variable for the `fido` object is interpolated into the surrounding string on line `x` and the resulting string is output.

### Instance variables and interface inheritance

```ruby
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  def can_swim?
    @can_swim
  end
end

fido = Dog.new
p fido.can_swim?

```