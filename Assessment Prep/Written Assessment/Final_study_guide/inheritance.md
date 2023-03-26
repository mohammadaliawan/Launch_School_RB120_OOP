# Inheritance

- one of the ways to implement polymorphism 
- mechanism through which a class can inherit behavior from another class or module
- a way to share behavior among classes
- helps extract common behaviors from classes and moving to a superclass or module
- keep logic in one place, remove duplication
---------------------
Inheritance is one of the ways of implementing polymorphism.
It is a process through which a class can inherit behavior from other classes or modules.

Inheritance is a way to share behaviour among classes. Inheritance is used as a way to extract common behaviors from classes that share that behaviour moving it to a superclass or module. It lets us keep logic in one place.

Two ways of implementing Inheritance in Ruby
  - Class Inheritance
  - Interface Inheritance

## Class Inheritance

- class inherits behavior from another class
- subclass: that is inheriting behavior
- superclass: the class it inhertis from
- used to model hierarchical domains
- model an 'is a' relationship between objects e.g. A cat `is a` pet.
- superclasses are defined as basic classes with large reusability
- subclasses are defined for more fine tuned detailed behaviours
- both class methods and instance methods are inherited in class heritance.
----------------------------------------------------------------------

Class Inheritance is when a class inherits behavior or methods from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass. Class inheritance is used when there is a "is a" relationship between classes while interface inheritance is used when there is a "has a relationship".

### Superclass vs. Subclasses

Superclasses are defined as general classes that have multiple use cases. So the attributes and behaviours defined in superclasses are generic and could be applicable in multiple scenarios.

On the other hand, subclasses are defined for a more specific use case where the attributes and behaviours are detailed and fine tuned to that specific scenario. Subclasses can either extend the behaviours defined in their superclasses or completely override that behaviour with their own implementation.

Super classes can be defined as basic classes with large reusability and smaller subclasses are defined for more fine-grained, detailed behaviors.

We use inheritance as a way to extract common behaviors from classes that share that behavior, and move it to a superclass. This lets us keep logic in one place. 


### Method Overriding

- method in a subclass has same name as a method in its superclass

Method overriding occurs when we have a method (instance or class) in a subclass that has the same name as a method in it's superclass.

When the method is invoked, Ruby first looks for that method in the subclass. And as it finds a method with that name, it executes that method. It does not go looking further up the method look up path in the superclass. This is called method overriding. The method in the superclass was overridden by the method defined in the subclass. 

See example in computer.rb

#### `super`

- when called from within a method (instance or class), calls a method of the same name earlier in the method lookup path

The `super` keyword is used to call a method of the same name earlier in the method lookup path. 

When you call `super` from within a method, it searches the method lookup path for a method with the same name, then invokes it.

**Calling `super` with and without arguments**

If `super` is called without any arguments, it automatically forwards all the arguments that were passed to the method from which `super` is called.

When called with specific arguments e.g. `super(a,b)`, the specified arguments will be sent up the method lookup path.

If you call `super()` with empty paratheses, it calls the method in the superclass with no arguments at all.

See example in computer.rb

### Method Lookup Path

Method lookup path describes the order in which ruby traverses the class hierarchy when a method is invoked to look for the method definition.

The **method lookup path** describes the order in which classes are inspected when a method is called to see how that method is defined.

Ruby has a distinct lookup path that it follows each time a method is called.

Whenever a method is invoked, the order in which Ruby searches classes for the method definition is called the method lookup path.

**Importance of Method Lookup path**

The method lookup path is important because it determines which method definition ruby will execute in case the same method is defined in the class of the calling object as well as in the superclass or a mixed in module. 

It is important to know what the method lookup path looks like for our class hierarchy. It helps us to avoid accidental method overriding and also helps us determine where each method should go i.e. in the subclass or superclass or maybe a module.

When a method is invoked on an object, ruby first looks for that method definition in the class that the object belongs to. If the method is not found, ruby keeps looking in any modules that are mixed in with the class following which it looks in the superclass of the current class. This continues in an ordered fashion until the method is found or there are no more places to look. 

The Method lookup path ends with the following three classes/modules

```
Object
Kernel
BasicObject
```

## Interface Inheritance

- Interface inheritance is achieved through the use of modules. 
- a module is a collection of behaviours i.e instance methods that are usable in other classes through mixins
- they contain shared behavior and are used to group resuable or shared behavior
- When a module is mixed in with a class through the use of include method invocation, its called a mixin
- the methods declared in the module become available to the objects and the class

```ruby
module Upgradable
  def upgrade(new_ram, new_storage)
    self.ram = new_ram if ram < new_ram
    self.storage = new_storage if storage < new_storage
  end
end

class Computer
  include Upgradable
  attr_accessor :ram, :storage

  def initialize(ram, storage)
    self.ram = ram
    self.storage = storage
  end
end
```
In the above example, we have created a class `Computer`. Computers have an ability that they can be upgraded. Hence, this signifies a 'has an ability' relationship between `Computer` objects and the `upgrade` behaviour. So we can extract this behaviour from the class `Computer` into a module `Upgradable`. This will help us to keep the logic of this behaviour in one place and also reuse this code in multiple other classes that have this behaviour. This is an example of interface inheritance.


A module is a collection of behaviors i.e. methods that are usable in other clasess through mixins. A module must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

Modules can be mixed into as many classes as needed. Modules are similar to classes as they contain shared behavior. However, you cannot create an object with a module. 

The purpose of a module is to group reusable code into one place. Another use is namespacing.