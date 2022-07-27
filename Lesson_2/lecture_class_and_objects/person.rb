class Person
  attr_accessor :last_name, :first_name
  
  def initialize(fullname)
    parse_full_name(fullname)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(name)
    parse_full_name(name)
  end

  def same_as?(other)
    name == other.name
  end

  private

  def parse_full_name(fullname)
    names = fullname.split(" ")
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.same_as?(rob)