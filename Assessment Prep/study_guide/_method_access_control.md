# Method Access Control


Access Control is about allowing or restricting access to a particular functionality or data in our code base.

Method access control is about restricting access to methods defined in a class. Method access control is implemented through the use of access modifiers.

In Ruby, Method Access Control is implemented through the use of `public`, `private`, `protected` access modifiers.

## Public Methods

Public methods are methods that are available for use to anyone who knows either the class name or object name. These methods are readily available for the rest of the program to use and comprise the class's interface.


All methods are public by default.

## Private methods

Methods that are performing some function inside a class but dont need to be available to rest of the program can be defined as private methods in a class.

We can call the `private` method and any methods defined below the `private` method call is `private`

`private` methods are only accessible from other methods in the class. They are not accessible outside of the class definition at all. We can only call private methods with the current object using `self`. They cannot be called with any other object even one of the same type.

## Protected Methods

Like `private` methods, `protected` methods can only be called from within the class definition. However, unlike `private` methods, `protected` methods allow access between class instances i.e. other instances of the class or subclass can also invoke the method.

When a method is `private`, the method can only be invoked on `self`. However, when a method is `protected`, instances of the class or a subclass can also call the method. This means we can easily share sensitive data between instances of the same class type.


```ruby
class Person

def older?(other_person)
    age > other_person.age
end
end
```