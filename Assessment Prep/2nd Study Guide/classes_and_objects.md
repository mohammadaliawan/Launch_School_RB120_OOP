# Classes and Objects

## What are Classes? How do class and objects relate to each other?

Objects are created from classes. 

Classes are like the basic outlines of what an object should be made of i.e. attributes and what it should be able to do i.e. behaviours.

In other words, Classes define the attributes and behaviours of the objects created from them. 

**Classes**

- class are blueprints or a basic outline for objects
- classes define the attributes and behaviours of a particular object type
- group common behaviours
- objects are created from classes

## What are Objects?

Objects in Ruby are anything that have a value e.g. strings, integers, arrays and hashes. They can also represent real worls nouns. For example a cat, dog or a mouse.

Objects are created or instantiated from Classes.

They are instances of a class. 

Each individual object will contain different information from other objects yet they are instances of the same class. 

**Objects**

- created from classes 
- anything that has a value is an object
- instances of a class
- encapsulate state

## How are classes created?

```ruby
class GoodDog
end

sparky = GoodDog.new
```

In the above code, we created a class called `GoodDog` and instantiated a new object of the class `GoodDog` called `sparky`.

We have instantiated an object called `sparky` from the class `GoodDog`.

## What two things do we focus on when defining classes?

States and behaviours

## What are attributes?

- **attributes** 
  - characteristics of an object type
  - a class defines the attributes that each object of that class shall 
    have.
  - an object's state tracks these attributes
  - the state comprises of the instance variables and their values
  - classes specify the name of the instance variables each object should 
    have.
  - each object's state is unique

- **behaviours** 
  - actions that an object can perform
  - exposed by the instance methods defined in the class
  - behaviour is shared

## How do objects and classes show encapsulation?

While objects encapsulate state in the form of instance variables, classes encapsulate and expose behaviors in the form of instance methods.