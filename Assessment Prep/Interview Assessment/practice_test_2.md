__What role do classes and objects play in OOP?__

__Q: Objects do not share state between other objects, but do share behaviors__

__Q: Add the required setters and getters in the below code so that output is as expected?__

```ruby
class Engineer
  def initialize(name)
    @name = name
  end

end

class ProjectEngineer < Engineer
  def initialize(designation, department)
    super
    @designation = designation
    @department = department
  end

end

class CivilEngineer < Engineer
  def initialize(designation, department)
    super
    @designation = designation
    @department = department
  end
end

bob = Engineer.new("Bob")
jerry = ProjectEngineer.new("Jerry", "Senior Engineer", "Project Execution")
tom = CivilEngineer.new("Tom", "Junior Engineer", "Infrastructure")

bob.name # Bob
jerry.name # Jerry
tom.name # Tom

jerry.designation # "Senior Engineer"
tom.designation # "Junior Engineer
bob.designation # NoMethodError

jerry.deparment # Project Execution
tom.deparment # Infrastructure
bob.deparment # NoMethodError

jerry.department = "Infrastructure" # NoMethodError
tom.department = "Administration" # NoMethodError
bob.department = "HR"# NoMethodError

bob.change_department("Offshore Structures")
bob.which_deparment? # Offshore Structures
```

__Q: What is an instance variable, and how is it related to an object?__

__Q: How does sub-classing affect instance variables?__

__Q: Why is it recommended to avoid the use of class variables when working with inheritance?__

__Q: Is it possible to reference a constant defined in a different class?__

__Q: When dealing with code that has modules and inheritance, where does constant resolution look first?__

__Q: What is the difference between a superclass and a subclass?__

__Q: Give an example of how to use class inheritance.__

__Q: What is inheritance, and why do we use it?__

__Q: How does Ruby provide the functionality of multiple inheritance?__

__Q: How do objects encapsulate state?__

__Q: How does encapsulation relate to the public interface of a class?__

