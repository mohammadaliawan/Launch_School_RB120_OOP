# Enacapsulation

## What is encapsulation?  

In general, encapsulation is the act of hiding or restricting access to some data and functionality in a program making it unavailable to rest of the codebase.

In Ruby, it is implemented through the creation of objects and exposing interfaces to interact with those objects.

When objects are created in Ruby, by default they hide or restrict access to their own internal representation i.e. their own state and behaviours from the rest of the program. They expose only those behaviours and attributes that users of the object need through their public interace.

It means first that the attributes and methods of an object are associated specifically with that object, or bundled with it; second, it means that the scope of those attributes and methods is by default the object itself.

- Encapsulation of data: Objects encapsulate their own state i.e. instance variables are private by default
- Encapsulation of behaviour: Pulic methods defined in a class can be accessed only by objects of that class or a subclass, they cannot be accessed by other classes or their objects
- Encapsulation of behaviour: private methods can only be accessed within the class by the current object, they are not even accessible by objects of that class outside the class.


### What purpose does it serve in Object Oriented Programming?

It is a form of **data protection** so that data cannot be manipulated without explicit intention.

It also helps define the boundaries within our program.

It also provides a new layer of abstraction.

### How does Ruby achieve this?

Ruby accomplishes this by creating **objects** and exposing **interfaces** to interact with those objects.

Method access control can be used to expose these properties and methods through the public interface of a class i.e. its public methods.

### What are the benefits of encapsulation?

We can interact with an object using its public interface without needing to know the internal implementations of the behaviours of the object.

Another benefit of creating objects is that it allows us to think on a new level of abstraction as objects can represent real world nouns and can be provided with methods that represent behaviours that we are trying to model.

