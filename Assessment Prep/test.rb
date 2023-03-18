module Speakable
  def speak(words)
    puts words
  end
end

class GoodDog
  include Speakable
end

class HumanBeing
  include Speakable
end

sparky = GoodDog.new
sparky.speak("Arff!!")
bob = HumanBeing.new
bob.speak("Hello")