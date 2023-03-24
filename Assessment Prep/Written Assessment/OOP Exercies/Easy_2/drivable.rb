module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# Currently, the `Drivable::drive` method is defined as a module mehtod.
# So it is only available to the module. Even though the `Drivable` module
# is mixed in to the `Car` class, the `drive` method is not available to its
# objects because it is defined as a module method and can only be invoked with
# the module `Drivable`. To make it available to `Car` objects, we need to define
# it as an instance method. To do that we need to remove the `self` prepended 
# to the method definition on line 2.