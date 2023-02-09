class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed}, please"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

=begin
The `Truck` class is a subclass of `Vehicle`. The `Truck#start_engine` method overrides the
`Vehicle#start_engine` method. But we still want to be able to use the functionality 
defined in the `Vehicle#start_engine` method. 

So we need to invoke `super` inside our `Truck#start_engine` method to invoke the 
`Vehicle#start_engine` method. But `Vehicle#start_engine` method does not 
take any arguments. To make sure that `super` does not pass on any arguments
passed to `Truck#start_engine` we need to invoke `super` with `()` like this
`super()`

=end