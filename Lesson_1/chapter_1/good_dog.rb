module Speak
  def speak(sound)
    puts sound
  end

end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
bob = HumanBeing.new

# sparky.speak("Arf!!")

# bob.speak("Hello World!")

puts GoodDog.ancestors

puts ""

puts HumanBeing.ancestors
