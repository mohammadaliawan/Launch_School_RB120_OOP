class Banner
  def initialize(message, width=nil)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    if @width
      "+#{"-" * (@width - 2)}+"
    else
      "+#{"-" * (@message.size + 2)}+"
    end
  end

  def empty_line
    if @width
      "|#{" " * (@width - 2)}|"
    else
      "|#{" " * (@message.size + 2)}|"
    end
  end

  def message_line
    if @width
      if @width > (@message.size + 2) # width = 5, message_size = 4
        "|#{@message.center(@width - 2)}|"
      else
        "| #{@message[0, @width - 4]} |"
      end
    else
      "| #{@message} |"
    end
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new("Hello", 9)
puts banner
