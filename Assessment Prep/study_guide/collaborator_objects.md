# Collaborator Objects

- stored as state within another object
- assigned to instance variables in another object
- work in conjunction with the class they are associated with
- represent connections between various parts in a program
- associations should make sense both technically and how it models the problem domain.

Objects that are stored as state within another object are called collaborator objects i.e they are assigned to instance variables of another object. They are called collaborators because they work in conjunction with the class they are associated with.

Another definition: An object that is assigned to an instance variable in another object.

As state is tracked by(or stored in) instance variables, we can assign instance variables to reference any type of object. These objects are known as collaborator objects.

Collaborator objects are usually custom objects. Technically string or other built-in object types that is assigned to an instance variable of another object is also a collaborator object but we dont tend to think of them in that way.

Collaborator objects have an important role in object oriented design as they represent the connections between various parts in a program so it is important to consider what collaborators a class has and if those associations make sense both technically and in terms of modeling the problem.

```ruby
class Pet
end

class Person
  attr_accessor :pet

  def initialize(name, pet)
    @name = name
    @pet = Pet.new
  end
end

jack = Person.new("Jack")
puts jack.pet #=>
```

As seen in the above example, on line `x` the constructor `Person#initialize` is instantiating a new `Pet` object and assigning that object to the instance variable `@pet`. So the `@pet` instance variable for each `Person` object will reference a `Pet` object.

Here, the relationship between `Person` objects and `Pet` objects is that of collaboration. A person **has a** pet. So this 'has a pet' relationship is modeled in our program as the `Peron` objects state comprising of the `@pet` instance variable and its referenced `Pet` object.

