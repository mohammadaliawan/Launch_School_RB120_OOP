# Class Inheritance, Encapsulation and Polymorphism

- Also cover Method lookup path

## Encapsulation

Encapsulation is hiding pieces of functionality and making it unavailable to the rest of the code base. It is a form of data protection, so that data cannot be manipulated or changed without obvious intention. It is what defines the boundaries in your application and allows your code to achieve new levels of complexity. Ruby, like many other OO languages, accomplishes this task by creating objects, and exposing interfaces (i.e., methods) to interact with those objects.

Check this <!-- Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need. We can use method access control to expose these properties and methods through the public (or external) interface of a class: its public methods. -->

### My definition

- restricting access to data and functionality
- implemented through creation of objects and exposing behaviours and attributes
- helps with data protection, reduces dependences, 

Confirmed<!-- Encapsulation in object oriented programming is about restricting access to data and functionality. It is a way of protecting data from unintentional manipulation. Users of the data only have access to the data and functionality that they actually need. This also helps with hiding how a functionality is implemented providing a new level of abstraction. We can use a functionality without needing to know how it is actually implemented.

Encapsulation in Ruby is implemented through the creation of objects and exposing only those behaviours and attributes of the objects through public methods that are actually needed by objects to interact with other objects. -->

Encapsulation helps with data protection, reduces dependencies within the program and also makes the software program easier to maintain. It also helps the programmer to think on a new level of abstraction as the objects represent real world nouns.

### Example

```ruby
module Upgradable
  def upgrade_ram
  end

  def upgrade_storage
  end
end
class Computer
  def initialize(type, model, ram, storage)
    self.type = type
    self.model = model
    self.ram = ram
    self.storage = storage
  end

  def info
    "#{type}, #{model}, #{ram}"
  end

  def upgrade_ram
    self.ram = "8 GB"
  end

  private

  attr_accessor :type, :model, :ram
end

class Laptop < Computer
  include Upgradable
end

class Desktop < Computer
  include Upgradable
end


home_computer = Computer.new("laptop", "Dell Latitude", "4 GB")

p home_computer.info

home_computer.upgrade_ram

p home_computer.info

```

In the above example, the `Computer` object referenced by `home_computer` has three attributes `type`, `model` and `ram`. These attributes are tracked by the state of the object which comprises of the instance variables `@type`, `@model`, `@ram` and their values.

In Ruby, by default, it is not possible to access these instance variables directly from outside the object. So this object encapsulates i.e hides its own state from the outside world. The only way to access these attributes is through the public interface of the object i.e public methods. So, we can 'read' the object's state by invoking the `Computer#info` method on the `home_computer` object. 

Furthermore, by using method access control we have made all attribute accessors i.e. getters and setters, private. So it is not possible to reference the object's state or change it from outside the object or class. We have provided only a few public instance methods like `info` and `upgrade_ram` to interact with the object. This is an example of encapsulation of behaviour.

So by creating objects and only exposing certain attributes and behaviours through the public interface of a class, we have protected the data from unintentional manipulation and hid the internal representation of the object from the outside. We dont need to do know how the `info` method or the `upgrade_ram` methods work, but only what they do.

## Polymorphism

Polymorphism is the ability for different types of data to respond to a common interface. That is, it lets objects of different types respond to the same method invocation.

When two or more object types have a method with the same name, we can invoke that method with any of those objects.

When we dont care what type of object is calling the method, we are using polymorphism

Polymorphism is implemented in two major ways:

### Inheritance

They are two ways to implement inheritance in Ruby i.e. Class Inheritance and Interface Inheritance.

#### Class Inheritance:

Class Inheritance is when a class inherits behavior or methods from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.

Super classes can be defined as basic classes with large reusability and smaller subclasses are defined for more fine-grained, detailed behaviors.

We use inheritance as a way to extract common behaviors from classes that share that behavior, and move it to a superclass. This lets us keep logic in one place. 


##### Method Overriding
Method overriding occurs when we have a method in a subclass that has the same name as a method in it's superclass. When the method is invoked, Ruby first looks for that method in the subclass. And as it finds a method with that name, it executes that method. It does not go looking further up the method look up path in the superclass. This is called method overriding. The method in the superclass was overridden by the method defined in the subclass. 

See example in computer.rb

##### `super`

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


- **Interface Inheritance**

Interface inheritance is achieved through the use of modules. 
A module is a collection of behaviors i.e. methods that is usable in other clasess through mixins. A module must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviors declared in that module are available to the class and its objects.

Modules can be mixed into as many classes as needed. Modules are similar to classes as they contain shared behavior. However, you cannot create an object with a module. 

The purpose of a module is to group reusable code into one place. Another use is namespacing.

2. Duck Typing

Duck typing is a form of polymorphism. It is an informal way of classifying objects based on their behavior. It occurs when two or more than two different unrelated types of objects have the same behavior i.e. method with the same name, so these objects can be invoked with the same method name although these methods may have completely different implementations. 


## Method Lookup Path

Ruby has a distinct lookup path that it follows each time a method is called.

Whenever a method is invoked, the order in which Ruby searches classes for the method definition is called the method lookup path.

When a method is invoked on an object, ruby first looks for that method definition in the class that the object belongs to. If the method is not found, ruby keeps looking in any modules that are mixed in with the class following which it looks in the superclass of the current class. This continues in an ordered fashion until the method is found or there are no more places to look. 

The Method lookup path ends with the following three classes/modules

```
Object
Kernel
BasicObject
```
