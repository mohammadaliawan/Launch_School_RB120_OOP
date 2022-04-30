class Dog
  def speak
    "bark!"
  end

  def swim
    "swimming"
  end

  def run
    "running"
  end

  def jump
    "jumping"
  end

  def fetch
    "fetching"
  end
  
end

class BullDog < Dog
  def swim
    "can't swim"
  end
end

karl = BullDog.new
p karl.speak
p karl.swim