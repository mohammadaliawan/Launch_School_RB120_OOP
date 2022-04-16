# Object Oriented Programming With Ruby

### Why Object Oriented Programming?
  - is a programming paradigm
  - created to deal with growing complexity of large software systems
  - increase in complexity and size lead to increased difficulty in maintenance.

### What is encapsulation?
 - Encapsulation is hiding pieces of functionality
 - Making that functionality unavailable to rest of the code base.
 - a form of data protection - so that data doesnt get manipulated without obvious intent
 - boundaries are defined by data encapsulation

### How does Ruby accomplish data encapsulation?
  - By creating objects and exposing interfaces i.e. methods to interact with those objects.

### What is another benefit of creating objects?
  - Allows the programmer to think on a new level of abstraction. Objects are represented as real world nouns and can be given methods that describe the behaviour that the programmer is trying to represent. 

### What is polymorphism?
  The ability of different types of data to respond to a common interface.
  poly -> many, morph -> forms

### What benefits does polymorphism provide?
  - Gives us the ability to use prewritten code for new purposes.

### What are the two different ways of applying polymorphic structure to Ruby programs?
  - Using Inheritance or Modules

### What is inheritance?
  - Where a class inherits behaviours of another class reffered to as the **superclass**.

### What is the difference between a superclass and subclass?
  - Superclasses are basic classes with large reusability containing common behaviours. Subclasses inherit behaviours from superclasses and define behaviours that are more fine grained and detailed.

### What are modules?
  Modules are similar to classes in that they contain shared behaviour. However, modules cannot be used to create objects.
  A module is a collection of behaviors that is usable in other classes via mixins.

### What is the purpose of Modules?
  A module allows us to group reusable code into one place. Modules are also used as a namespace.

### How are modules used with classes?
  Modules must be mixed in with a class using the `include` method invocation. This is called a mixin. After mixing in a module, the behaviours declared in that module are available to the class and its objects.

### What is an object?
  Anything that can be said to have a value is an object including classes and modules.

### How are objects formed? Give an analogy.
  Objects are created from classes. Classes can be considered to be molds and objects the things that are produced out of those molds

### What is the meaning of "instances of the same class"?
  Objects are instances of classes; meaning that objects are created from classes. 

## What is the meaning "instantiated from a class"?
  Objects are created from classes.

## Where are the attributes and behaviours of objects defined?
  Ruby defines the attributes and behaviours of its objects in classes.

## What are classes?
  Classes are basic outlines of what objects should be made of and what they should be able to do.

## How do you define a class?
  ```ruby
  class CamelCase

  end
  ```
## How do you create an instance of a class?
  By using the class method `new`
  ```ruby
  sparky = GoodDog.new
  ```
  We created an instance of the `GoodDog` class and assigned it to the local variable `sparky`

## What is the workflow of creating a new object from a class called?
  Instantiation
  We have instantiated an object called sparky from the GoodDog Class.

## How are modules created and mixed in to a class?
  ```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!!")

bob = HumanBeing.new
bob.speak("Hello")
  ```

## What is the Method Lookup Path?
  Method Lookup Path is the path that ruby follows to find a method that has been called.

## How can we get the lookup path for the GoodDog Class?
  By using the class method `ancestors`.

## GoodDog Class Method Lookup path?
  ---GoodDog ancestors---
GoodDog  
Speak
Object
Kernel
BasicObject

---HumanBeing ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject

