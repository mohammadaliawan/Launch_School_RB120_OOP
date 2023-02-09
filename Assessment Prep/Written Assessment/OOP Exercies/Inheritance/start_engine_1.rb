class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super
    start_engine
  end

  def start_engine
    puts "Ready to go!"
  end
end

truck1 = Truck.new(1993)
puts truck1.year

=begin
- invoke the start engine method when a new `Truck` object is
instantiated. 


The `new` class method that is used to instantiate a new `Truck` object, automatically
invokes the `initialize` method. So basically whenever a new `Truck` object is created
the `initialize` method is invoked. So we can invoke the `start_engine` method in the 
`initialize` method

The `Truck` class subclasses from the `Vehicle` class which means that
it inherits the `initialize` method from the `Vehicle` class. But if we invoke the `start_engine`
method in the `Vecicle#initialize` method, that would mean that `Vehicle` and all subclasses of `Vehicle`
need to have a `start_engine` method. But that would be too early to assume.

`start_engine` method is a detailed behaviour that is specific to the `Truck` class and its
objects. So we need to define a `Truck#initialize` method that would override the `Vehicle#initialize` method
but that can also use the functionality defined in the `Vehicle#initialize` method so that we dont have any
repetitive code.

To accomplish this we can invoke `super` in the `Truck#initialize` method that invokes a method
of the same name earlier in the method look up path in this case `Vehicle#initialize`.
once the `@year` instance variable is initialized on line 5, Ruby returns to the `Truck#initialize` method
and invokes the `start_engine` method.


=end