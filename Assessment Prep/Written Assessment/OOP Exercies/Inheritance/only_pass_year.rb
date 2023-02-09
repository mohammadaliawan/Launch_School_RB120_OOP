class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle

end

truck1 = Truck.new(1994, "Short")
puts truck1.year
puts truck1.bed_type

=begin
We have three classes defined `Vehicle`, `Truck` and `Car`. `Truck` and `Car`
both subclass from `Vehicle`. So all the methods defined in the `Vehicle` are inherited
by both the `Truck` and `Car` classes. That includes the `initialize` method and 
the `year` getter method. 

On line 24 we are invoking a getter method `bed_type` on the `truck1` object.
This method is not defined in the `Vehicle` class. So we have defined this 
method in the `Truck` class using the `attr_reader` method and passing in `:bed_type`

When `Truck::new` method is invoked on line 22 and two arguments are passed to it,
it will invoke the `initialize` method inheritd from the `Vehicle` class. But that method
only accepts one argument so an ArgummentError will be raised.

We need a `Truck#initialize` method that accepts two arguments. So we will need
to override the `Vehicle#intialize` method with a `Truck#initialize` method but that also
utllizes the functionality defined in the `Vehicle#initialize` method. 

To accomplish this we need to use the reserved keyword `super`. `super` invokes a method
of the same name as the method from which `super` was called but earlier in the method lookup path.
But we need to invoke `super` with only one argument `year` so that only that is forwarded to
the `Vehicle#initialize` method as this method only accepts one argument.

Once Ruby returns from the `Vehicle#initialize` method after initializing the `@year` instance variable
 back to the `Truck#initialize`method, it will initialize the `@bed_type` instance variable to the argument `bed_type`.

=end