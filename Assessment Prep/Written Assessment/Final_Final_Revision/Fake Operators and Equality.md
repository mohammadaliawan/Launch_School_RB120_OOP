# Equivalence

`==`

`==` is not actually an operator. It is an instance method defined in the `BasicObject` class which is the superclass for all classes in Ruby. Hence, all classes, even custom ones, have the `==` method because it is inherited from the `BasicObject` class. The `BasicObject#==` method checks to see if the two objects being compared are the same object. However, to determine equivalence of its objects, each class needs to define this method to specify what values of the objects to compare when this method is called.So all class in Ruby's Core library override this method to define exactly what values to compare for a particular object type. For example, `String#==` method compares the length and content of the string objects. `Integer#==` method compares the values of the integer objects. 

In the same way, we need to override this method in our custom classes to specify what value of objects to compare to determine equivalence of objects.

`equal?` 

`equal?` is an instance method defined in the `BasicObject` class which is the superclass for all classes in Ruby. Hence, this method is inherited by all classes even custom ones. `equal?` returns `true` only if the two objects being compared are the same object. Even if the objects have the same value but are different objects, `equal?` will still return `false` because it determines if the two objects occupy the same space in memory i.e. they are the same objects.

`===`

`===` is also an instance method. This method is defined in the `Object` class which is the super class for all classes in Ruby's Core library. Hence, this method is inherited by all classes.
By default `Object#===` istance method returns the same as the `BasicObject#==` method, that is it returns `true` if the two object being compared are the same object. However, if a class overrides the `BasicObject#==` method with its own implementation, then `Object#===` is also overridden and will now return according to the new implementation of `==` defined in the class.

However, as this method is used implicitly by the `case` statement to determine equivalency of objects, it is overridden by most classes to provide more meaningful behaviour in the context of that class in a `case` statement. For example `Range#===` method determines if the object passed as argument lies in the provides `Range` object e.g. `(1..10) === 5` will return `true`.

`eql?`

The `eql?` method determines if the two objects contain the same value and if they are of the same class. Its used by the `Hash` class to determine equality of it key-value pairs. 

__Q: How and why would we implement a fake operator in a custom class? Give an example.__

Fake operators are actually instance methods that Ruby provides with a special syntax that reads more naturally. For example, `+`, `-`, `<<`, `<`, `>` are all instance methods disguised as operators.

Since these all are actually instance methods, we can implement them in our custom classes by defining these methods in our class. The reason for implementing these methods is that it provides our classes with a public interface that reads more naturally and makes it easy to use the classes and its methods. But we should take care to follow the Ruby core library's convention in implementing how these methods work. For example, `+` method usually increments or concatenates two objects and returns a new object of the same class. `<<` is used by `Array` objects to append elements to the array objects and returns the calling array.

For example we can implement the `<<` method in a `ProjectTeam` class as shown below:

```ruby
class ProjectTeam
  attr_accessor :members

  def initialize
    self.members = []
  end

  def <<(person)
    members << person
    self
  end
end

class Engineer
end

class ProjectManager
end

team1 = ProjectTeam.new

civil_engineer = Engineer.new
project_manager = ProjectManager.new

team1 << civil_engineer << project_manager

p team1
```