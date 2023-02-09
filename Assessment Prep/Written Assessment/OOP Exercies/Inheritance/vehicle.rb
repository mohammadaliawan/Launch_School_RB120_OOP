class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

=begin
From lines 9 and 12, we can see that our `Truck` and `Car` classes need
to have a constructor method which will be invoked when we instantiate a new `Car`
or `Truck` object and it needs to take one argument `year` and also needs to initialize
the object with a state that tracks the year attribute. 

`Vehicle` class has a contructor method `initialize` that is doing exactly that by
initializing the instance variable `@year` to the argument passed to the `new` method.

From lines 16 and 19 we can see that we need a getter method for the instance variable
`@year`. And we have that in the `Vehicle` class as the `attr_reader` method invocation
on line 2 creates a getter method `@year`. 

So if we make our `Truck` and `Car` classes subclass from `Vehicle` both classes will
the required functionality from the `Vehcile` superclass. 

=end