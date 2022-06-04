# Polymorphism and Encapsulation

## Polymorphism

Polymorphism refers to the ability of different object types to respond to the same method invocation in different ways. 

Data of different types can respond to a common interface.

When two or more object types have a method with the same name, we can invoke that method with any of those objects. When we dont care what type of object is calling the method we are using polymorphism. 

### What are two ways of implementing Polymorphism

1. Polymorphism through Iheritance
  The interface for this class hierarchy lets us work with all of those types in the same way even though the implementations may be dramatically different. That is polymorphism.

  This is polymorphism through inheritance -- instead of providing our own behavior for the move method, we're using inheritance to acquire the behavior of a superclass

  This is a simple example of polymorphism in which two different object types can respond to the same method call simply by overriding a method inherited from a superclass

  Looking at this example, we can see that every object in the array is a different animal, but the client code can treat them all as a generic animal, i.e., an object that can move. Thus, the public interface lets us work with all of these types in the same way even though the implementations can be dramatically different. That is polymorphism in action.

2. Polymorphism through duck typing

  Duck Typing occurs when objects of different unrelated types both respond to the same method name. With duck typing we arent concerned with the class of type of an object, but we do care whether an object has a particular behaviour. If an object quacks like a duck, then we can treat it as a duck.

  Duck Typing is a form of polymorphism. As long as the objects involved use the same method name and take the same number of arguments, we can treat the object as belonging to a specific category of objects. 

  Duck typing is an informal way to classify or ascribe a type to objects. Classes provide an informal way to do that.

  Unless you're actually calling the method in a polymorphic manner, you don't have polymorphism. In practice, polymorphic methods are intentionally designed to be polymorphic; if there's no intention, you probably shouldn't use them polymorphically.

## Encapsulation

  Encapsulation lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need. We can use method access control to expose these properties and methods through the public or external interface of a class: its public methods.

  