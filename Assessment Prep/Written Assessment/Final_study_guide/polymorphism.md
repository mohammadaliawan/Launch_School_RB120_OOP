# Polymorphism

Polymorphism describes the ability of different object types to respond to the same method invocation in different ways.

__Polymorphism refers to the many forms that a method can take in terms of how that method is implemented in different classes but the way that method is invoked on different object types remains the same i.e. different object types share a common interface. In otherwords, the objects of different types are able to respond to the same method invocation but in different ways.__

When two or more object types have a method with the same name, we can invoke that method with any of those objects.

When we don't care what type of object is calling the method, we are using polymorphism.

## Explain two different ways to implement polymorphism?

Polymorphism can be implemented in two major ways:

1. Inheritance
2. Duck Typing

**Polymorphism through Inheritance**

Inheritance is a mechanism through which a class can inherit behaviour from another class or module. 

So when two or more different classes either subclass from a common superclass or have a common mixin module, then objects of all those different classes will be able to invoke the same methods because those methods have been aquired by those different classes through inheritance either from the superclass or a mixin module. So any client code that is using objects of these various classes does not need to care about what type of object is invoking a method. All it needs to know is that those object types have that behaviour. This is polymorphism through inheritance.

Furthermore, the subclasses may provide their own implementations of that behaviour by overriding the behaviours inherited from the superclass. In this case as well, the different object types will be able to respond to the same method invocation but the implementation details may be different. This is also polymorphism.

Below is an example of polymorphism through class Inheritance:

```ruby
class Engineer
  def design
    puts "I am designing."
  end
end

class ProjectEngineer < Engineer
end

class CivilEngineer < Engineer
  def design
    puts "Designing the foundations"
  end
end

class StructuralEngineer < Engineer
  def design
    puts "Designing the structure"
  end
end

engineer1 = CivilEngineer.new
engineer2 = StructuralEngineer.new
engineer3 = ProjectEngineer.new

engineers = [engineer1, engineer2, engineer3]

engineers.each do |engineer|
  engineer.design
end
```

In the above code, we have three classes `ProjectEngineer`, `CivilEngineer` and `StructuralEngineer` that subclass from a common superclass `Engineer`. The `design` instance method defined in the superclass `Engineer` is inherited by all three subclasses. But both `CivilEngineer` and `StructuralEngineer`  override this behaviour with their own implementations. While the subclass `ProjectEngineer` aquires this behaviour from its superclass `Engineer`.

We have also created three objects from each of those classes on lines 162 to 164 and we have stored them in an array referenced by the local variable `engineer`.

On lines 168 to 170, the client code i.e. the `each` method with the passed in block does not care about what type of object is being passed into the block as long as this object has the behaviour or instance method `design`. All three objects that are passed into the block are able to respond to the same method invocation `design`. This is an example of polymorphism through inheritance.

**Polymorphism through Duck Typing**

Duck Typing is an informal way of categorizing different unrelated object types based on a common behaviour that all those object types have. It occurs when objects of different unrelated types are able to respond to the same method invocation.

Below is an example of polymorphism through duck typing:

```ruby
class Project
  attr_accessor :drawings, :schedule, :staff

  def initialize
    self.staff = [DesignEngineer.new, ProjectManager.new]
  end

  def start
    staff.each do |person|
      person.execute_project(self)
    end
  end
end

class ProjectManager
  def execute_project(project)
    develop_milestones(project.schedule)
  end

  def develop_milestones(schedule)
    puts "Developing Milstones"
  end
end

class DesignEngineer
  def execute_project(project)
    develop_design(project.drawings)
  end

  def develop_design(drawings)
    puts "Designing the Equipment"
  end
end

Project.new.start
```
In the above code, we have a class `Project` that has the attributes `drawings`, `schedule` and `staff`. And we have also defined two other class which are unrelated to `Project` i.e. `ProjectManager` and `DesignEngineer`. 

Polymorphism through duck typing is implemented in the `Project#start` method. We are invoking the `each` method on the array referenced by `@staff`. So, the `DesignEngineer` and `ProjectManager` objects are being passed into the block and the `execute_project` method is being invoked on each of these objects and the `Project` object being passed in as argument.

Here the client code does not need to know the what type of object is calling the `execute_project` method. All it needs to know is that these objects have this method and that it takes a `Project` object as an argument.

The respective classes i.e. `DesignEngineer` and `ProjectManager` then take care of the implementation details of these methods. And as we can see they are completely different. The `DesignEngineer#execute_project` method invokes the `DesignEngineer#develop_design` method while the `ProjectManager#execute_project` method invokes the `ProjectManager#develop_milestones` method.

Hence we have informally categorized these different object types. Both `DesignEngineer` and `ProjectManager` type objects belong to the category that can `execute_project`. This is an example of polymorphism through duck typing.