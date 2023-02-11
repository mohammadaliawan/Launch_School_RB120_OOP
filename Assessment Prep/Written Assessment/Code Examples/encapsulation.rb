class Person
  MONTHS = %w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)

  def initialize(name, birthdate)
    @name = name
    @birthdate = birthdate
  end

  def birthday
    puts "My birthday is in #{birth_month}"
  end

  def greet
    puts "Hi, I am #{first_name}"
  end

  private

  attr_accessor :name, :birthdate

  def first_name
    name.split.first
  end

  def birth_month
    MONTHS[birthdate.month - 1]
  end
end

boby = Person.new("Robert Downey", Time.new(1975, 3, 31))

boby.greet
boby.birthday
