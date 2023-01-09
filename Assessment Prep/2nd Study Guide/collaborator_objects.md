# Collaborator Objects

We can use any object to represent an object's state. Instance variables can be set to any object even an object of a custom class. 

```ruby
class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Bulldog
end

bob = Person.new("Robert")
bud = Bulldog.new

bob.pet = bud
```

## Definition

Objects that are stored as state in other objects are called Collaborator Objects i.e. assigned to an object's instance variables.

Collaborator objects are not strictly custom objects. Built in object types in ruby are also technically collavorator objects.

Collaborator Objects can be of any type.

## What is collaboration?

Collaboration is a way of modeling relationshops between different objects.

## What kind of relationship exists between collaborator objects?

Collaborator objects have an **associative** relationship with each other. It can be thought of as a 'has a' relationship. For example a Library 'has a' book.

A collaborative relationship is a relationship of association - not of inheritance. Collaboration is a 'has a' relationship rather than an 'is a' relationship.

## Why are they called 'collaborators'?

They are called 'collaborators' because they work in conjuction on in collaboration with the class they are associated with.

## Can collaborator objects be used through their associated objects?

When we need the collaborator object to perform some behavior, we can go through the object whose instance variables are referencing it as a collaborator object, by using the getter method for that instance variable and invoking instance methods on the returned collaborator object.

## Why are collaborator objects important in OO design?

They play an important role as they represent the connections between various parts in a program.

## When working on an OO program, what are two things you should consider with respect to Collaborator Objects?

- What collaborators your classes will have
- and if those collaborations make sense both 
  - technically
  - in terms of modeling the problem 


## What are CRC cards and what are they used for?

Class Responsibility Collaborator (CRC) cards is a way to model the various classes in a program. Its a tool to design classes and map interactions between classes.