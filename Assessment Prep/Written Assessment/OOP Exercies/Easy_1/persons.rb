class Person
  attr_reader :first_name, :last_name
  attr_writer :last_name

  def initialize(name)
    assign_names(name)
  end

  def assign_names(name)
    names = name.split
      @first_name = names.first
    if names.size == 1
      @last_name = ''
    else
      @last_name = name.split.last
    end
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name             