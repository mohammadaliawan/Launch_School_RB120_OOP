module Speak
  def speak(words)
    puts words
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arff!!")
bob = HumanBeing.new
bob.speak("Hello")
