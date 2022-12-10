# Object Oriented Programming

## What is Object Oriented Programming?   

Object Oriented Programming is a programming model/pattern/paradigm. Its a way of organizing code.

### Define the Problem? Why was it created?

- As software systems grew larger and more complex, they became harder to maintain
- no clear boundaries existed between the different parts in the program
- one small change in one part would result in a cascading effect of errors throughout the entire program

### Define the solution?
- programming paradigm
- a way of structuring (organizing) code to make it more flexible, maintainable and even easier to think about


### Define the benefits?What benefits does it have?

- makes code more maintainable, flexible and easier to think about
- that gives us the ability to write organized code with clear boundaries 
- helps to section off areas of code, restricting access to some parts providing protection and security
- creates another layer of abstraction for the programmer to think on which helps with solving the problem

### How does it accomplish those benefits?

- OOP creates containers for data and functionality like building blocks called classes and objects
- one building block can be manipulated without affecting the entire program, independent blocks
- program becomes an interaction of these buidling blocks
- Some blocks can be reused in order to reduce repetition.

## What is encapsulation? WHat purpose does it serve in Object Oriented Programming? How does Ruby achieve this?

Encapsulation is sectioning off and hiding data and functionality and making it unavailable to the rest of the code base. It is a form of data protection so that data cannot be manipulated without explicit intention.
It defines the boundaries within our program.

Ruby accomplishes this by creating **objects** and exposing **interfaces** to interact with those objects.

Another benefit of creating objects is that it allows us to think on a new level of abstraction as objects can represent real world nouns and can be provided with methods that represent behaviours that we are trying to model.


## What is polymorphism? What purpose does it serve in Object Oriented Programming?

Polymorphism is the ability of different types of data to respond to a common interface. It gives us the ability to use prewritten code for new purposes.

## What is inheritance?

Inheritance is when a class inherits behaviours of another class known as the **superclass**. It helps us to define basic classes with large reusability and small **subclasses** for more fine grained behaviours.

## WHat are modules? What are Modules used for?

Modules are a collection of related behaviours. Modules are similar to classes in that they contain shared behavior but it is not possible to create object from Modules. Modules are 'mixed in' to classes using the `include` method invocation. After mixing in modules, the behaviours declared in that module become available to the class and its objects.

