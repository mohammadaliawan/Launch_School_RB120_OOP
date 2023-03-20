# Polymorphism

Polymorphism refers to the ability of different object types to respond to the same method invocation in different ways.

In other words, different data types can respond to a common interface.

When two or more object types have a method with the same name, we can invoke that method with any of those objects.

When we don't care what type of object is calling the method, we are using polymorphism.

## Two ways of implementing polymorphism

1. Inheritance
2. Duck Typing

### Polymorphism through inheritance

When different classes inherit behaviour from a common superclass or module, then the the objects of those classes can invoke the same methods because those methods are inherited from the superclass or module. 
The public interface for the class heirarchy lets us work with all of the object types in the same way even though the implementations may be very different. 

Polymorphism through inheritance works in two major ways:
1. Inheriting behaviour from a superclass/module: Instead of providing their own implementation of a behaviour, different object types use inheritance to aquire the behaviour of a common superclass or module. 

2. Overriding an inherited behaviour: Different object types can respond to the same method call by overriding a method from a common superclass.

The client code does not care about what each object type is, all it cares about is that each object type has some implementation of the same method that can be invoked in the same way.

### Polymorphism through duck typing

Duck typing occurs when objects of different **unrelated** types respond to the same method invocation. When we dont care about the class or type of an object but we do care whether an object has a particular behavior.

Duck typing is an informal way of ascribing a common type to different object types because they behave a certain way. 

