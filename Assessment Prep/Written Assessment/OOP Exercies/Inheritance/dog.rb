=begin
- create a subclass from Dog called Bulldog
- override the swim method to return "can't swim"
=end

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming'
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

# teddy = Dog.new
# puts teddy.speak
# puts teddy.swim

bull = Bulldog.new
puts bull.speak
puts bull.swim