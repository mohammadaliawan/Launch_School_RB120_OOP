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
- a class groups behavious i.e. methods

## What are Objects?

Objects in Ruby are anything that have a value e.g. strings, integers, arrays and hashes. They can also represent real world nouns. For example a cat, dog or a mouse.

Objects are created or instantiated from Classes.

They are instances of a class. 

Each individual object will contain different information from other objects yet they are instances of the same class. 

**Objects**

- created from classes 
- anything that has a value is an object
- instances of a class
- encapsulate state
- Objects donot share state between objects, but do share behaviour
- The values in the object's instance variables (states) are different, but they can call the same instance methods i.e. behaviours defined in the class.

## How are classes created?

```ruby
class GoodDog
end

sparky = GoodDog.new
```

In the above code, we created a class called `GoodDog` and instantiated a new object of the class `GoodDog` called `sparky`.

We have instantiated an object called `sparky` from the class `GoodDog`.

## What two things do we focus on when defining classes?

**States** and **behaviours**

**State** refers to the data associated to an individual object.

**Behaviors** are what objects are capable of doing.

## What are attributes?

- **Attributes** 
  - characteristics of an object type
  - a class defines the attributes that each object of that class shall have.

  **State**
  - refers to the data associated to an individual object.
  - an object's state tracks these attributes
  - the state comprises of the instance variables and their values
  - instance variabless are used to track state
  - instance variables are scoped at the object level
  - classes specify the name of the instance variables each object should have.
  - each object's state is unique

- **behaviours** 
  - actions that an object can perform
  - exposed by the instance methods defined in the class
  - behaviour is shared OR all objects contain identical behaviour

## How do objects and classes show encapsulation?

While objects encapsulate state in the form of instance variables, classes encapsulate and expose behaviors in the form of instance methods.

In summary, instance variables keep track of state, and instance methods expose behavior for objects.

## How are new objects instantiated and build? What is a constructor?

```ruby
class GoodDog
  def initialize
    puts "New GoodDog Object initialized!"
  end
end

sparky = GoodDog.new

```

Whenever a new object is created using the `new` class method, the `initialize` instance methods gets triggered and invoked. The `initialize` method is called a "constructor" because it is a special method that builds the object when a new object is instantiated.

