# Enacapsulation

## What is encapsulation?  

Encapsulation is **sectioning off areas of code** in a program and hiding data and functionality and making it unavailable to the rest of the code base.

It is the hiding of the internal representation of an object from the outside of the object and exposing only those methods and properties that users of the object need. 

### What purpose does it serve in Object Oriented Programming?

It is a form of **data protection** so that data cannot be manipulated without explicit intention.

It also helps define the boundaries within our program.

### How does Ruby achieve this?

Ruby accomplishes this by creating **objects** and exposing **interfaces** to interact with those objects.

Method access control can be used to expose these properties and methods through the public interface of a class i.e. its public methods.

Another benefit of creating objects is that it allows us to think on a new level of abstraction as objects can represent real world nouns and can be provided with methods that represent behaviours that we are trying to model.