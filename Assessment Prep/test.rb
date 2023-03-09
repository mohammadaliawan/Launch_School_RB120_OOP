
WHEELS = "Vehicle"
class Vehicle

end



module Inflatable
	def inflate
		puts "Inflated #{self.class::WHEELS} tires."
	end
end

class Car < Vehicle
	include Inflatable
end

Car.new.inflate