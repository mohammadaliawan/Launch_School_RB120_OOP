# Classes and Objects

  - classes
  - objects
  - class and object creation
  - 

## What is OOP and Why is it important?

Object oriented programming is a programming paradigm. As software systems grow in size, they become complex and it becomes hard to maintain them. OOP was created to deal with this problem.

If a software program contains several dependent parts, then changing something in one part effects several other parts which makes making a small change a very difficult task.

OOP provides a way to create containers for data that can be changed and manipulated without affecting the entire software program. It helps to section off code and 

## What are classes and Objects?

Objects are created from Classes. They are instances of a class. Classes are like blueprints for objects.Classes are like basic outlines of what an object should be made of and what it should be able to do. 

They are like a specification or a plan specifying what attributes or properties those objects will have and what kind behaviours these objects will be able to perform. 

The attributes and behaviours of objects are defined in the class they belong to. 

An individual object contains different information than other objects although they are instances of the same class.

Objects are known as instances of a class.

### How are classes created?

```ruby
class CamelCase

end
```

### How are objects created from classes? How does the `new` method work?

Objects are instantiated from classes using the Class method `new` which every object in Ruby has.

For example.
```ruby
class Computer
end

puffy = Computer.new
```
In the above example we created the class `Computer` and instantiated a new `Computer` object by invoking the Public Class method `new` on the `Computer` class. This returns a new `Computer` object. This object is then assigned to the local variabl `puffy`. 

### What is instantiation?

Class instantiation is the workflow of creating a new object from a class. 

### When defining a class what are the two things we focus on?

States and Behaviours.

States track attributes for individual objects. Behavious are what objects of a class are capable of doing.

For example, we have a `Computer` Class. We may create two different objects one named "HP Notebook" and the other "Dell Latitude". They are both `Computer` objects but contain different informatition like model, screen size, RAM, storage etc. 

But both `Computer` objects will be able to perform the same functions or behaviours e.g `start` or `powerdown` or `display_new_wallpaper` etc.

### What are attributes?

Attributes can be thought of as the different characteristics that make up an object. 

For example, attributes of a `Computer` object might be model, screen size, RAM, storage etc.

These attributes can be accessed and manipulated from outside the object. 

### When we refer to attributes what might we be referring to?

We could be referring to the characteristic names or the name and the values attributed to the object. The meaning becomes clear from context.

When we say classes define the attributes of its objects, we are referring to how classes specify the name of the instance variables each object should have. 

The classes also define the accessor methods and level of method access control however we are generally just pointing to the instance variables. 

When we say state tracks attributes for individual objects, we mean instance variables and values comprise an object's state. Here we are not referring to the getters and setters.


