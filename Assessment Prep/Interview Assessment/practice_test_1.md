# Interview Practice Test 1

## Object Oriented Programming

### What is Object Oriented Programming? Why was it created? What are its benefits?

Object Oriented Programming is a programming paradigm. It is a way of structuring and organizing code to make it more maintainable, flexible and easier to think about. 

It was created to deal with the increasing complexity of software programs. As software systems grew larger and more complex it became very difficult to maintain them and make changes. 

OOP solves these problems by creating containers for data and functionality called objects which form the building blocks for the entire program.

These building blocks are independent of each other. Manipulating one object does not affect other objects.The entire program becomes the interaction of these objects. It is even possible to reuse these objects for other purposes which reduces repetition within the program.

OOP gives us the ability write organized code with clear boundaries. Its gives us the ability to section off areas of code, restricting access to data providing data protection and security.

It also creates another layer of abstraction for the programmer to think on which helps with comming up with a more flexibles solution. 

#### Define the Problem. Why was it created?
Object Oriented Programming is a programming model/pattern/paradigm. Its a way of organizing code.

- As software systems grew larger and more complex, they became harder to maintain
- no clear boundaries existed between the different parts in the program
- one small change in one part would result in a cascade of errors throughout the entire program

#### Define the solution
- programming paradigm
- a way of structuring (organizing) code to make it more flexible, maintainable and even easier to think about

#### How does it accomplish this?

- OOP creates containers for data and functionality like building blocks called classes and objects
- one building block can be manipulated without affecting the entire program, independent blocks
- program becomes an interaction of these buidling blocks
- Some blocks can be reused in order to reduce repetition.

#### What benefits does it have?

- makes code more maintainable, flexible and easier to think about
- that gives us the ability to write organized code with clear boundaries 
- helps to section off areas of code, restricting access to some parts providing protection and security
- creates another layer of abstraction for the programmer to think on which helps with solving the problem

## Fake Operators and Equality

### Testing for Equivalence in Ruby

- What are the different ways of testing for equivalence of objects in Ruby?
  - `==`
   - is used to compare values of objects
   - is a method not an operator
   - orignally defined in the `BasicObject` class, checks if the two objects are the same object
   - overridden by subclasses to provide more meaningful behaviour in the context of that subclass
   - to compare custom objects, we need to define it in our class

   ```ruby
  class Person
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def ==(other_person)
      name == other_person.name
    end
  end

  bob = Person.new("Bob")
  bob2 = Person.new("Bob")

  p bob == bob2 # false
  ```

  - `equal?`
   - also defined in the `BasicObject` class
   - checks if the two objects being compared are the same object
   - not overridden by subclasses
   - rarely used

  - `===`
   - used implicitly by the `case` statement to compare an object to the when clauses
   - originally defined in the `Object` class but overridden by subclasses to provide more meaningful behaviour when used in `case` statements
   - For example `Range#===` checks if a value lies between a range.

  - `eql?`
   - checks if two objects have the same value and are of the same class 

### The Comparison Methods `>`, `<`, `>=`, `<=`

These methods can also be defined in our custom class to compare objects based on some attribute's value.
Note: These methods are not inherited from some superclass. These need to be defined in our class.

```ruby
class Person
  include Comparable
  attr_reader :age

  def initialize(age)
    @age = age
  end

  # def >(other)
  #   age > other.age
  # end

  def <=>(other)
    age <=> other.age
  end
end
```

### The `<<` method

- is used to store/append objects in an object that represents a collection

```ruby
class Company
  attr_reader :staff
  def initialize
    @staff = []
  end

  def <<(member)
    staff << member
  end
end

worley = Company.new
worley << "Bob"

p worley.staff
```

### `+` and `[]` and `[]=`

```ruby
class Company
  attr_accessor :staff

  def initialize(members)
    @staff = members
  end

  def +(other_company)
    temp_comp = Company.new([])
    temp_comp.staff = staff + other_company.staff
    temp_comp
  end

end

worley = Company.new(["Bob", "Tom"])
wood = Company.new(["kitty", "perry"])

new_company = worley + wood

p new_company.staff
```

## Collaborator Objects

- Collaborator objects are objects that are stored as part of the state of other object
- Since state comprises of instance variables and their values, collaborator objects are stored as instance variables values
- have a `has a` relationship
- Collaboration is a way of modeling relationships between object types that have an associative relationship. That is, objects that work togather with each other. Collaborator objects can be thought of as having a 'has a' relationship. For example, a library has books, a team has members, a deck has cards etc.

Collaborator objects are an important aspect of OO design as they represent the connections between the various buidling blocks of the program. Collaborator objects allow us to breakdown the problem into smaller pieces and work on the smaller pieces seperately. This makes solving the smaller problem easier. And then bringing togather all the pieces or buidling blocks that fit togather to solve the problem at hand.


```ruby
class Person
  attr_reader :pet

  def initialize
    @pet = Pet.new
  end
end

class Pet
  def say_hi
    "Hi"
  end
end

bob = Person.new

p bob.pet.say_hi
```

## `self`

- `self` is a keyword in Ruby that can represent different things depending on the context it is used in
- it is used as a way of being explicit about what our intentions are in code
- it is used to define class methods
- it is used to call setter methods inside the class
- inside the class it references the class
- inside instance methods it references the calling object of the method

```ruby
class Person
  def self.say_hi
    "Hi"
  end
end

p Person.say_hi
```

```ruby
class Person
  attr_writer :name

  def change_name(new_name)
    self.name = new_name
  end
end

bob = Person.new

p bob.change_name("Bob")
```

## Method Lookup Path

Brief definition:

- When a method is invoked the order in which Ruby traverses the class hierarhcy to look for the method definition is called the Method lookup path.
More detail: How does it work?

- When a method is invoked on an object, ruby first looks for that method definition in the class that the object belongs to. If the method is not found, ruby keeps looking in any modules that are mixed in with the class following which it looks in the superclass of the current class. This continues in an ordered fashion until the method is found or there are no more places to look. 

WHy is the method lookup path important?

- The method lookup path is important because it determines which method definition ruby will execute in case the same method is defined in the class of the calling object as well as in the superclass or a mixed in module. 
- It is important to know what the method lookup path looks like for our class hierarchy. It helps us to avoid accidental method overriding and also helps us determine where each method should go i.e. in the subclass or superclass or maybe a module.

```ruby
module Swimmable
end

class Person
end

class Employee < Person
  include Swimmable
end

p Employee.ancestors
```

## Modules

- What are modules? What are they used for in Ruby?
  - multiple uses of modules in Ruby- various types of modules 
  - mixin modules that are used as a group or collection of shared behaviours that are usable in classes
  - namespacing modules that used to group related classes
  - Modules for Containing Out of place methods or functions

- When are mixin modules used or when is interface inheritance used?
  - mixin modules are used when there are multiple classes that share a common behaviour. So in this case we can extract that behaviour from thos classes and keep it in one place a module. And then all we need to do is mixin that module using the include method in all the classes that need that behaviour. 
  - they are used to keep logic in one place, keep code dry and increases maintainability, code reusability
    
- Why can't class inheritance be used to model certain problem domains accurately?
    using the class inheritance is not feasable in certain cases because defining that behavior in a superclass would provide that behaviour to all subclasses. But in some cases we only want it to be available to certain subclasses
- class inheritance in Ruby only allows single inheritance i.e. subclassing directly from only one superclass. This makes it difficult to accurately model the problem domain.

- When are modules used in Ruby? What kind of relationships are modeled through the use of modules vs. class inheritance?

- How are modules similar to classes? How are they different? When would you use modules vs. classes?

mixin modules

```ruby
module Eatable
  def eat
    "Eats"
  end
end

class Animal
  include Eatable
end

class Person
  include Eatable
end
```

- namespacing modules

```ruby
module HighSchool
  class Teacher
  end

  class Student
  end
end

module College
  class Teacher
  end

  class Student
  end
end

p HighSchool::Teacher.new
p College::Teacher.new
```

Container for out of place methods - Module methods modules

```ruby
module SomeModule
  def self.double(num)
    num * 2
  end
end

p SomeModule.double(4)
```

## Polymorphism

What is polymorphism and why is it used?

Polymorphism refers to the many forms that a method can take in terms of how that method is implemented in different classes but the way that method is invoked on different object types remains the same i.e. different object types share a common interface.

- WHen we have different object types but all are able to invoke the same method we are using polymophism
- makes using multiple classes easier to use because they share a common interface
- depending on how we are implementing it, it helps reduce repeition in our code, making it dry
- increases code reusability
- helps to keep logic in one place increasing maintainability of code.

There are three ways to implement polymophism:

1. Class inheritance
2. Interface inheritance
3. Duck Typing 

```ruby
class Engineer
  def design
    "Designing..."
  end
end

class MechanicalEngineer < Engineer
end

p Engineer.new.design 
p MechanicalEngineer.new.design
```


```ruby
module Designable
  def design
    "Designing..."
  end
end

class Engineer
  def design
    "Designing..."
  end
end

class ProjectEngineer < Engineer
end

class CivilEngineer < Engineer
  def design
    "Designing the foundations..."
  end
end

class MechanicalEngineer < Engineer
  def design
    "Designing the Structure..."
  end
end

engineers = [ProjectEngineer.new, CivilEngineer.new, MechanicalEngineer.new]

engineers.each do |engineer|
  engineer.design
end

=begin
# + You are building an application for Airplane Ride.

# + Every airplane ride has 2 pilots, 2 flight attendants and 10 passengers. A mechanic supports the team from the ground.

  # + Everyone that's on an Airplane Flight has medical clearance.  A Mechanic cannot be on the plane.

  #  + Every employee is a part of the airline's workforce. They all work and get paid.  
  
  # + Pilots can fly and Mechanics can fix the engine of a plane.

  # + Flight attendants and pilot, and mechanic are all a part of a union and they pay dues.
   
  # + Passengers can do a lot of actions: ride, buy food, drink alcohol, pay for a ticket, and accrue miles.
  
  # + The flight attendant, pilot and passenger can breathe at high altitudes, but a mechanic cannot.
  
  # + Keep track of how many airplane rides are happening at the same time.
  
  # + Keep track of how many airplane employees are on the plane at a time.
  
  # + Every airline employee gets 4 to 10 hours of sleep a night except a pilot who only gets 4-6 hours a night.

  
=end 

module Medicable
  MEDICAL_CLEARANCE = true
end 

module Unionable
  PART_OF_UNION = true

  def pay_dues
  end 
end 

module Breathable
  def breathe_high
  end 
end 

class AirplaneRide
  @@number_of_rides = 0

  def self.number_of_rides
    @@number_of_rides
  end 

  def initialize
    @flight = Flight.new
    @ground = Ground.new
    @@number_of_rides += 1
  end 

  def employees_on_plane_num
    flight.pilots.size + flight.flight_attendants.size
  end 


  private

  attr_reader :flight
end

class Flight
  attr_reader :pilots, :flight_attendants

  def initialize
    @passengers = []
    10.times { @passengers << Passenger.new }
    @pilots = []
    2.times { @pilots << Pilot.new }
    @flight_attendants = []
    2.times { @flight_attendants << Flight_Attendant.new }    
  end
end 

class Ground
  def initialize
    @mechanic = Mechanic.new
  end 
end 

class Employee
  include Unionable

  def initialize
    @sleep_hours = (4..10).to_a.sample
  end
  
  def work
  end 

  def get_paid
  end   
end

class FlyingEmployee < Employee

end

class Pilot < FlyingEmployee
  include Breathable

  def initialize
    @sleep_hours = (4..6).to_a.sample
  end

  def fly
  end 
end

class Flight_Attendant < FlyingEmployee 
  include Breathable
end 

class Mechanic < Employee
  def fix_engine
  end 
end 

class Passenger
  include Medicable
  include Breathable

  def ride
  end 

  def buy_food
  end 

  def drink_alcohol
  end 

  def pay_for_ticket
  end
  
  def accrue_miles
  end 
end

ride = AirplaneRide.new
p AirplaneRide.number_of_rides
p ride.employees_on_plane_num