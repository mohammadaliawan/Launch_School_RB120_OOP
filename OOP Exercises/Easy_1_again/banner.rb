# class Banner
#   def initialize(message, width = )
#     @message = message
#   end

#   def draw
#     ary = [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule]

#     ary.each do |line|
#       puts line
#     end
#   end

#   # private

#   def horizontal_rule
#    "+#{"-"*width}+" 
#   end

#   def empty_line
#     "| #{" "*width} |"
#   end

#   def message_line
#     if message.size < width - 2
#       "| #{message.center(width - 2, " ")} |"
#   end

#   attr_reader :message
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# banner.draw

# banner2 = Banner.new('')
# banner2.draw
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

class Test
  def initialize
    @name = "bob"
    @color = "red"
  end

  attr_accessor :name, :color
end

new_object = Test.new
p new_object.instance_variables