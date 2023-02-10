# Polymorphism

Polymorphism refers to the ability of different object types to respond to the same method invocation in different ways.

In other words, different data types can respond to a common interface.

When two or more object types have a method with the same name, we can invoke that method with any of those objects.

When we don't care what type of object is calling the method, we are using polymorphism.

## Two ways of implementing polymorphism

1. Inheritance
2. Duck Typing

### Polymorphism through inheritance

The interface for the class heirarchy lets us work with all of the object types in the same way even though the implementations may be very different. 

Polymorphism through inheritance works in two major ways:
1. Inheriting behaviour from a superclass: Instead of providing their own implementation of a behaviour, different object types use inheritance to aquire the behaviour of a common superclass. 

2. Overriding an inherited behaviour: Different object types can respond to the same method call by overriding a method from a common superclass.

The client code does not care about what each object type is, all it cares about is that each object type has some implementation of the same method that can be invoked in the same way.