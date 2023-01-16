=begin
- class named Person
  - constructor takes once argument full name
- define a method `name ` that returns full name "first_name last_name"
- define first_name and last_name methods that return the first name and last name
- define last_name= method 
  - that takes a last name as argumen
- - - changes the full name 

=end


# class Person
#   attr_reader :first_name, :last_name
#   attr_writer :first_name, :last_name

#   def initialize(name)
#     set_first_last_names(name)
#   end

#   def name
#     if last_name.empty?
#       first_name
#     else
#       first_name + " " + last_name
#     end
#   end 

#   def name=(full_name)
#     set_first_last_names(full_name)
#   end

#   private

#   def set_first_last_names(full_name)
#     parts = full_name.split
#     self.first_name = parts[0]
#     unless parts[1]
#       self.last_name = ""
#     else
#       self.last_name = parts[1]
#     end
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name
# p bob.last_name
# p bob.name

