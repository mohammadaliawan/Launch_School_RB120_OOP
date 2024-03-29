# Class Inheritance, Encapsulation and Polymorphism

- Also cover Method lookup path

## Encapsulation

Encapsulation is hiding pieces of functionality and making it unavailable to the rest of the code base. It is a form of data protection, so that data cannot be manipulated or changed without obvious intention. It is what defines the boundaries in your application and allows your code to achieve new levels of complexity. Ruby, like many other OO languages, accomplishes this task by creating objects, and exposing interfaces (i.e., methods) to interact with those objects.

Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need. We can use method access control to expose these properties and methods through the public (or external) interface of a class: its public methods.

### My definition

- restricting access to data and functionality
- Users of the data only have access to the data and functionality they actually need 
- a way of protecting data from unintentional manipulation
- creates boundaries within the program

- hides how a functionality is implemented providing a new level of abstraction. use a functionality without needing to know how it is implemented.

- implemented through creation of objects and exposing only certain behaviours and attributes

- helps with data protection,
- reduces dependences, 
- easier to maintain,
- a new level of abstraction

Encapsulation in object oriented programming is about restricting access to data and functionality. It is a way of protecting data from unintentional manipulation. Users of the data only have access to the data and functionality that they actually need. This also helps with hiding how a functionality is implemented providing a new level of abstraction. We can use a functionality without needing to know how it is actually implemented.

Encapsulation in Ruby is implemented through the creation of objects and exposing only those behaviours and attributes of the objects through public methods that are actually needed by objects to interact with other objects.

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
    "Type: #{type}, Model: #{model}, RAM: #{ram}, Storage: #{storage}"
  end

  def upgrade_ram
    self.ram = "8 GB"
  end

  private

  attr_accessor :type, :model, :ram, :storage
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

In the above example, the `Computer` object referenced by `home_computer` has four attributes `type`, `model`, `ram` and `storage` These attributes are tracked by the state of the object which comprises of the instance variables `@type`, `@model`, `@ram`, `@storage` and their values.

In Ruby, by default, it is not possible to access these instance variables directly from outside the object. So this object encapsulates ( or hides) its own state from the outside world. The only way to access these attributes is through the public interface of the object i.e public methods. So, we can 'read' the object's state by invoking the `Computer#info` method on the `home_computer` object. 

Furthermore, by using method access control we have made all attribute accessors i.e. getters and setters, private. So it is not possible to reference the object's state or change it from outside the object or class. We have provided only a few public instance methods like `info` and `upgrade_ram` to interact with the object. This is an example of encapsulation of behaviour.

So by creating objects and only exposing certain attributes and behaviours through the public interface of a class, we have protected the data from unintentional manipulation and hid the internal representation of the object from the outside. We dont need to do know how the `info` method or the `upgrade_ram` methods work, but only what they do.

This is an example of encapsulation.

## Polymorphism

### What is polymorphism?

- ability of different types of objects to respond to a common interface in different ways.
-  objects of different classes are able to respond in different ways to the same method invocation even though the implementation details for these methods may vary from class to class. 
- client code does not care about what type of object is calling the method. all it cares about is that the methods are called in the same way with the same number of arguments.

- the public interface of these objects lets us work with these objects in the same way even though implementations may be dramatically different.
---------------------------------------------
Polymorphism is the ability for different types of data to respond to a common interface. That is, it lets objects of different types respond to the same method invocation.

When we dont care what type of object is calling the method, we are using polymorphism.

### How is polymorphism implemented in Ruby?

Polymorphism is implemented in two major ways:

1. Inheritance

 A subclass inherits a more generic method implementation from a superclass.

 A subclass overrides a more generic method implementation from a superclass with a different more specific behavior by implementing a method of the same name.

Refer to Inheritance.md

```ruby
class Animal
  def eats
    puts "feeds on other living things"
  end
end

class Carnivore < Animal
  def eats
    puts "feeds on meat"
  end
end

class Herbivore < Animal
  def eats
    puts "feeds on plants"
  end
end

class Omnivore < Animal; end

lion = Carnivore.new
rabbit = Herbivore.new
person = Omnivore.new

animals = [lion, rabbit, person]
animals.each { |animal| animal.eats }
```

2. Duck Typing

- form of polymorphism
- informal way of classifying objects based on behaviourr
- When objects of different unrelated types are able to respond to the same method invocation

Duck typing is a form of polymorphism. It is an informal way of classifying objects based on their behavior. It occurs when two or more than two different unrelated types of objects have the same behavior i.e. method with the same name, so these objects can be invoked with the same method name although these methods may have completely different implementations. 
Duck typing focuses on what an object can _do_ rather than what an object _is_.

```ruby
class EngineeringProject
  attr_reader :process_flow_diagram, :piping_layout

  def design(engineers)
    engineers.each do |engineer|
      engineer.prepare_design(self)
    end
  end
end

class PipingEngineer
  def prepare_design(project)
    design_piping(project.process_flow_diagram)
  end

  def design_piping(process_flow_diagram)
    # some implementation
  end
end

class ProcessEngineer
  def prepare_design(project)
    design_process(project.process_flow_diagram)
  end

  def design_process(process_flow_diagram)
    # some implementation
  end
end

class CivilEngineer
  def prepare_design(project)
    design_foundations(project.piping_layout)
  end

  def design_foundations(piping_layout)
    # some_implementation
  end
end

class ElectricalEngineer
  def prepare_design(project)
    design_electrical_wiring(project.piping_layout)
  end

  def design_electrical_wiring(piping_layout)
    # some_implementation
  end
end


```




