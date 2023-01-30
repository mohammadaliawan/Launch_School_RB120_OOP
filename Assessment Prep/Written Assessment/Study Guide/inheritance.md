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
- model an 'is a'  `` relationship between objects e.g. A cat `is a` pet.
- superclasses are defined as basic classes with large reusability
- subclasses are defined for more fine tuned detailed behaviours
- both class methods and instance methods are inherited in class heritance.
----------------------------------------------------------------------

Class Inheritance is when a class inherits behavior or methods from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass. Class inheritance is used when there is a "is a" relationship between classes while interface inheritance is used when there is a "has a relationship".

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

If `super` is called without any arguments, it automatically forwards the arguments that were passed to the method from which `super` is called. 

When called with specific arguments e.g. `super(a,b)`, the specified arguments will be sent up the method lookup path.

If you call `super()` with empty paratheses, it calls the method in the superclass with no arguments at all.

See example in computer.rb

**Example of Polymorphism through class inheritance**

The interface for the class heirarchy lets us work with all of the object types in the same way though the implementation may be dramatically different.

```ruby
class Transportation
  def move
    puts "Moving."
  end
end

class Vehicle < Transportaiton
  def move
    puts "Driving on the road."
  end
end

class Train < Transportation
  def move
    puts "Running on the track."
  end
end

class Airplane < Transportation
  def move
    puts "Flying in the air."
  end
end

transports = [Vehicle.new, Train.new, Airplane.new]

transports.each {|transport| puts transport.move}


```

Polymorphism is the ability for different types of data to respond to a common interface. That is, it lets objects of different types respond to the same method invocation.

In the above code we have defined a `Transportation` class that is the superclass for three other classes i.e. `Vehicle`, `Train` and `Airplane`.
 `Vehicle`, `Train` and `Airplane` all inherit the behaviors from `Transportation` class. `Transportation` class defines a general `move` method. And each of the  `Vehicle`, `Train` and `Airplane` classes define their own `move` methods. So essentially the `Transportation#move` method is overridden by the  `Vehicle`, `Train` and `Airplane`subclasses. 

 We have also initialized a `transports` array which contains three different objects i.e. objects of  `Vehicle`, `Train` and `Airplane` classes. 
Every object in the `transports` array is a differnt type of object. The client code i.e. the `each` method with its accompanying block is using each of these objects in the same way i.e. calling the `move` method on each object. It does not matter what type of object is calling the `move` method. All that matters is that the calling object for the `move` method has an implementation for the `move` method.

Since each class overrides the `Transportation#move` method with its own implementation of the `move` method, these overriding methods shall be invoked.
This is an example of polymorphism in which three different object types can respond to the same method call by overriding a method inherited from a superclass. This is polymorphism through inheritance.


### Method Lookup Path

- the order in which Ruby searches classes for the method definition

The **method lookup path** describes the order in which classes are inspected when a method is called to see how that method is defined.

Ruby has a distinct lookup path that it follows each time a method is called.

Whenever a method is invoked, the order in which Ruby searches classes for the method definition is called the method lookup path.

**Importance**

Method lookup path describes the order in which ruby inspects or traverses the class hierarchy when a method is invoked to look for the method definition.

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
module Swimmable
  def swim
    puts "I am swimming"
  end
end

class Person
  include Swimmable
end

class Dog
  include Swimmable
end

Person.new.swim
Dog.new.swim
```
A module is a collection of behaviors i.e. methods that are usable in other clasess through mixins. A module must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

Modules can be mixed into as many classes as needed. Modules are similar to classes as they contain shared behavior. However, you cannot create an object with a module. 

The purpose of a module is to group reusable code into one place. Another use is namespacing.