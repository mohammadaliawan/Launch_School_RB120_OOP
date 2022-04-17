# Create a superclass called Vehicle for your MyCar class to inherit from and 
# move the behavior that isn't specific to the MyCar class to the superclass.
# Create a constant in your MyCar class that stores information about the vehicle that 
# makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also 
# has a constant defined that separates it from the MyCar class in some way.

module Towable
  def tow
    puts "What do you need me to tow?"
  end
end


class Vehicle
  attr_accessor :year, :color, :model, :speed

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @@number_of_vehicles += 1
    self.year = year
    self.color = color
    self.model = model
    self.speed = 0
  end

  def self.total
    @@number_of_vehicles
  end

  def self.mileage(gallons, miles)
    puts "This vehicle has a milage of #{miles/(gallons.to_f)} miles per gallon"
  end
  
  def speed_up
    self.speed += 10
  end

  def brake
    self.speed -= 5
  end

  def shut_off
    self.speed = 0
  end
end


class MyCar < Vehicle
  DRIVE = 4

  @@number_of_cars = 0

  def initialize(year, color, model)
    super
    @@number_of_cars += 1
  end

  def self.total
    @@number_of_cars
  end

  def to_s
    "Car model: #{model}, year: #{year}, color: #{color}"
  end
end

class MyTruck < Vehicle
  include Towable
  DRIVE = 8

  @@number_of_trucks = 0

  def initialize(year, color, model)
    super
    @@number_of_trucks += 1
  end

  def self.total
    @@number_of_trucks
  end

  def to_s
    "Truck model: #{model}, year: #{year}, color: #{color}"
  end
end

new_car = MyCar.new(1987, "Yellow", "Choverlet")
new_truck = MyTruck.new(1987, "Black", "Ford Tundra")

my_car = MyCar.new(2007, "White", "Suzuki")

# p new_car.to_s

# p new_truck.to_s

# p Vehicle.total

# p MyCar.total

# p MyTruck.total

# new_truck.tow

# puts Vehicle.ancestors

# puts "-------------------------"

# puts MyCar.ancestors

# puts "-------------------------"

# puts MyTruck.ancestors

new_car.speed_up
new_truck.speed_up

p new_car.speed
p new_truck.speed

new_car.brake
new_truck.brake

p new_car.speed
p new_truck.speed

new_car.shut_off
new_truck.shut_off

p new_car.speed
p new_truck.shut_off



