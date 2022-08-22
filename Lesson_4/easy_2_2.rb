class Oracle
  def predict_the_future
    puts self
    "You will " + self.chooses.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def chooses
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

# resolves a method name by first looking in the calling object's class.