# Modules

## What are modules? What are they used for in Ruby?

- another way to apply polymorphic structure to programs.
- Contain shared behavior similar to classes
- cannot instantiate objects from modules
- a group or collection of behaviors that is usable in other classes via mixins
- must be mixed in a class using include method invocation called mixin
- The behaviours or methods declared in the module are available to the class and its objects
- Since instance methods basically provide an interface for the class they are in, mixing in modules or including them in a class lets the class inherit the interface provided by the module. So mixing in modules in a class is also called interface inheritance.

Modules are a collection of related behaviours that can be used in other classes by 'mixing in' the module in the class. 

They are another way of applying polymorphic structure to Ruby programs.

A module allows us to group reusable code into one place. They are also used for Namespacing

```ruby
module Speak
  def speak(words)
    puts words
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arff!!")
bob = HumanBeing.new
bob.speak("Hello")

```

## Why can't class inheritance be used to model certain problem domains accurately?

- using the class inheritance is not feasable in certain cases because defining that behavior in a superclass would provide that behaviour to all subclasses. But in some cases we only want it to be available to certain subclasses

- class inheritance in Ruby only allows single inheritance i.e. subclassing directly from only one superclass. This makes it difficult to accurately model the problem domain.

- Ruby's awnser to multiple inheritance is by way of mixing in behaviours or modules. A class can only subclass from one superclass but it can mix in as many module as it likes.

## When are modules used in Ruby? What kind of relationships are modeled through the use of modules vs. class inheritance?

- class inheritance is used where we want to model concepts that are naturally heirarchical.

- modules are used where there is a `has-a` relationship between a class and a behavior.
- class inheritance is used where there is an `is-a` relationship between two different class types.

## Other uses of modules

### Namespacing

- Namespacing means organizing similar classes under a module. 
- group related classes 
- becomes easy to recognize related classes in our code.
- reduces the likelihood of our classes colliding with other similarly named classes in our codebase.

### Container for methods

- container for methods called module methods
- used to house out of place methods that dont `go into any class
- are called directly from the module