# Classes and Objects

  - classes
  - objects
  - class and object creation
  - `new` method
  - `initialize` method
  - states and behaviours

## What is OOP and Why is it important?

Object oriented programming is a programming paradigm. It was created to deal with growing complexity of large software systems. As software systems grow in size, they become complex and it becomes hard to maintain them.

If a software program contains several dependent parts, then changing something in one part effects several other parts which makes making a small change a very difficult task.

OOP provides a way to create containers for data that can be changed and manipulated without affecting the entire software program. 

- created to deal with growing complexity of large software programs
- as the software program grew larger, became harder to maintain
- no clear boundaries between the different parts
- one part could effect another without explicit intention of doing so.
- many dependent parts triggers many errors due to a small change
- programming paradigm
- a way of structuring code to make it easier to maintain and think about
- OOP creates containers for data and functionality, section off areas of code
- can be manipulated without affecting the entire program
- program becomes an interaction of many small parts
- creates another layer of abstraction for the programmer to think 

```ruby
class
  # behaviours: move, eat, sleep, walk, take pet for a walk
end

class Cat
  # attributes: name, age, type
  # behaviours: move, eat, sleep, walk
end

```

## What are Classes and Objects?

- anything that has a value is an object
- created from classes
- encapsulate state

- class are blueprints or a basic outline for objects
- objects are created from classes
- classes define the attributes and behaviours of a particular object type
- group common behaviours
- attributes: 
  - characteristics of an object type
  - an object' state tracks these attributes
  - the state comprises of the instance variables and their values
  - classes specify the name of the instance variables each object should have.
  - each object's state is unique
- behaviours: 
  - actions that an object can perform
  - exposed by the instance methods defined in the class
  - behaviour is shared

### Objects

In Ruby, anything that can be said to have a value is an object. For example, strings, integers, floats, arrays, hashes and even classes and modules are objects. Custom Objects can represent real world nouns. Objects have both attributes and behaviors. Attributes are like properties of the object and behaviours are like actions that an object can perform. 

Objects are created from Classes. They are known as instances of classes.

### Classes

Classes are like blueprints for objects. They are what objects are created from. They are basic outlines of what an object should be made of i.e. 'attributes' and what it should be able to do i.e. 'behaviours'. That is, they define the attributes and behaviors of the objects instantiated from them.

Individual objects of a class will contain different information from other objects, yet they are instances of the same class.

Classes group common behaviors and objects encapsulate state.

For example in Ruby, there are classes like `String`, `Integer`, `Array` and `Hash`. And we can create instances of these classes which are known as objects. 

```ruby
new_str = String.new("Hello")
```
The above code is an example of instantiating an object of the `String` class with the class method `new`. `new_str` references a `String` object. We can also create custom classes in Ruby.

```ruby
class Computer
  def initialize(type, model, ram)
    @type = type
    @model = model
    @ram = ram
  end

  def upgrade_ram
    @ram = "8 GB"
  end
end

home_computer = Computer.new("Laptop", "HP Notebook", "4 GB" )
```
In the above code we have created a new custom class `Computer` and instantiated a new `Computer` object with the class method `new`. `home_computer` now references a `Computer` object.
We have also initialized the object with a state which is tracked by the three instance variables `@type, @model, @ram`. 

The public instance method `upgrade_ram` exposes behavior for the `home_computer` object. Now this object can perform this action of upgrading ram by invoking the instance method `upgrade_ram`

<!-- Classes are like a specification or a plan specifying what attributes or properties those objects will have and what kind of behaviours these objects will be able to perform. 

The attributes and behaviours of objects are defined in the class they belong to.  -->

### How are classes created?

```ruby
class CamelCase

end
```

### How are objects created from classes? How does the `new` method work?

Objects are instantiated from classes using the Class method `new`which every object in Ruby has.

For example.
```ruby
class Computer
end

home_computer = Computer.new
```
In the above example we created the class `Computer` and instantiated a new `Computer` object by invoking the Public Class method `new` on the `Computer` class. This returns a new `Computer` object. This object is then assigned to the local variable `home_computer`. 

### What is instantiation?

Class instantiation is the workflow of creating a new object from a class. 


### When defining a class what are the two things we focus on?

States and Behaviours.

States track attributes for individual objects. 
Behavious are what objects of a class are capable of doing.

States are tracked by instance variables which are scoped at the object level and specified in the class  while behaviours are defined as instance methods in the class which are available to all objects of that class.

Individual objects of the same class have unique states while having shared behaviors.

While objects encapsulate state in the form of instance variables, classes encapsulate and exposes behaviors in the form of instance methods.

For example, we have a `Computer` Class. We may create two different objects one named "HP Notebook" and the other "Dell Latitude". They are both `Computer` objects but contain different informatition like model, screen size, RAM, storage etc. 

But both `Computer` objects will be able to perform the same functions or behaviours e.g `start` or `powerdown` or `display_new_wallpaper` etc.

### What are attributes?

Attributes can be thought of as the different characteristics that make up an object. 

For example, attributes of a `Computer` object might be model, screen size, RAM, storage etc.

### When we refer to attributes what might we be referring to?

We could be referring to the characteristic names or the name and the values attributed to the object. The meaning becomes clear from context.

When we say classes define the attributes of its objects, we are referring to how classes specify the name of the instance variables each object should have. 

The classes also define the accessor methods and level of method access control however we are generally just pointing to the instance variables. 

When we say state tracks attributes for individual objects, we mean instance variables and values comprise an object's state. Here we are not referring to the getters and setters.

### How does the initialize method work?

`initialize` is an instance method that gets invoked every time we instantiate a new object by invoking the class method `new`. So basically the `new` method triggers the `initialize` method. 

The initialize method is known as a constructor because it builds the object when a new object is instantiated. 


