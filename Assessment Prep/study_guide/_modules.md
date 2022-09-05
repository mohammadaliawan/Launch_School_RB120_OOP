# Modules

## What is a module?

- polymorphism
- shared behaviour
- collection of behaviours useable in other classes via mixins
- the class inherits the interface provided by the mixin module.

- are used where there is a `has-a` relationship between objects and behaviours and 
- using the class inheritance is not feasable because defining that behavior in a superclass would provide that behaviour to all subclasses. But we only want it to be available to certain subclasses.
- a class can inherit behaviours from multiple modules.

- another way to apply polymorphic structure to programs.
- Contain shared behavior similar to classes
- cannot instantiate objects from modules
- a group or collection of behaviors that is usable in other classes via mixins
- must be mixed in a class using include method invocation called mixin
- The behaviours or methods declared in the module are available to the class and its objects
- class inheritance is used where we want to model concepts that are naturally heirarchical.
- class inheritance in Ruby only allows single inheritance i.e. subclassing directly from only one superclass. This makes it difficult to accurately model the problem domain.
- Ruby's awnser to multiple inheritance is by way of mixing in behaviours or modules. A class can only subclass from one superclass but it can mix in as many module as it likes.

- modules are used where there is a `has-a` relationship between a class and a behavior.
- class inheritance is used where there is an `is-a` relationship between two different class types.

Example of where modules are used:

```ruby
module Teachable
  def teach
    puts "I am teaching ..."
  end
end

class Person; end

class Student < Person
end

class TeacherAssitant < Student
  include Teachable
end

class Instructor < Person
  include Teachable
end
```

## Other uses of modules

### Namespacing

- Namespacing means organizing similar classes under a module. 
- group related classes 
- becomes easy to recognize related classes in our code.
- reduces the likelihood of our classes colliding with other similarly named classes in our codebase.

### Container for methods

- container for methods called module methods
- used to house out of place methods that go into any class
- are called directly from the module

-------------------------------------------------------------------------------------------------------------------------------------


Modules are one of the ways of applying polymorhpic structure to Ruby programs.

A module is a group or collection of behaviors i.e instance methods that is usable in other classes via mixins. A module must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviors declared in that module are available to the class and its objects. Since instance methods basically provide an interface for the class they are in, mixing in modules or including them in a class lets the class inherit the interface provided by the module. So mixing in modules in a class is also called interface inheritance.

## What are modules used for in Ruby? What functions do they serve in Ruby OOP?

Modules are one of the ways to achieve polymorphism in Ruby. 

In Ruby, a class can only inherit from one superclass. This is called single inheritance. Sometimes, this makes it difficult to accurately model problems. 

Some programming languages do allow inheritance from multiple classes. But Ruby does not. To cater for this functionality, ruby allows to mix-in as many modules as needed into our classes. 


## What problem do modules solve in Ruby?

Ruby does not allow multiple class inheritance which means that a class can only iherit from a single superclass. But that makes it difficult to accurately model a problem's requirements. So to provide some kind of fuctionanlity that solves this problem, Ruby allows interface inhertance from multiple sources, which means that a class can inherit only behavior i.e. interface from other multiple sources. This is where modules come in. Since Modules are just a collection of related behaviours or instance mwthods, by mixing in or including a module in a class lets the class inherit the interface or instance methods provided by the module. 

And it is possible to include as many modules as required in a class


```ruby
module Upgradable
  def upgrade_ram
  end

  def upgrade_storage
  end
end

class Laptop
  include Upgradable
end

class Desktop
  include Upgradable
end
```
In the above example, we have two classes `Laptop` and `Desktop`. And we have defined a module `Upgradable` which has two instance method `upgrade_ram` and `upgrade_storage`. 

We have mixed in the module `Upgradable` in both classes by invoking the `include`method and passing the name of the module as argument.

Now, the instance methods defined in the `Upgradable` module are available to all instances of the classes `Laptop` and `Desktop`.

## Namespacing

Namespacing means organizing similar classes under a module.OR Using modules to group related classes.

## Container for methods

Modules can also be used as a container for methods called module methods. This is useful for methods that seem out of place.

 ```ruby
module Mammal
  def self.some_method(num)
    num**2
  end
end
 ```
Module methods can be called directly from the module:

```
value = Mammal.some_method(2)

```
