
class Transportation
  def move
    puts "Moving."
  end
end

class Vehicle < Transportation
  def move
    puts "Driving on the road."
  end
end

class Train < Transportation
  def move
    puts "Running on the track."
  end
end

class Airplane < Transportation
  def move
    puts "Flying in the air."
  end
end

transports = [Vehicle.new, Train.new, Airplane.new]

transports.each {|transport| transport.move}