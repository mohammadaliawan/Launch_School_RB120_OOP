module Offroadable
  def go_offroad
    p "#{self.model} Going offroad...."
  end
end

class Vehicle
  attr_accessor :current_speed, :model, :color, :year

  @@number_of_vehicles = 0

  def self.total
    p "Total Vehicles created are #{@@number_of_vehicles}"
  end

  def initialize(model, color, year)
    @@number_of_vehicles += 1
    self.current_speed = 0
    self.model = model
    self.color = color
    self.year = year
  end

  def accelerate(increase_speed)
    self.current_speed += increase_speed
    p "Increasing speed to #{self.current_speed} Km/Hr...."
  end

  def brake(decrease_speed)
    self.current_speed -= decrease_speed
    p "Decreasing speed to #{self.current_speed} Km/H...."
  end

  def stop
    self.current_speed = 0
    p "Parking my #{self.model}...."
  end

  def public_disclosure
    p "I have a #{self.color} #{self.year} #{self.model}!!"
  end

  def how_old
    self.age
  end
    # "My #{self.model} is #{self.age} years old"

  private

  def age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  DRIVE = 2
end

class MyTruck < Vehicle
  include Offroadable

  DRIVE = 4
end

honda = MyCar.new("Honda Civic", "Yellow", 2006)
toyota = MyTruck.new("Land Cruiser", "Black", 1995)

p honda.how_old
honda.age

# honda.public_disclosure
# toyota.public_disclosure

# toyota.go_offroad

# honda.accelerate(35)
# honda.accelerate(20)
# honda.brake(10)
# honda.stop

# p MyCar.ancestors
# p MyTruck.ancestors
# p Vehicle.ancestors
# p Offroadable.ancestors

