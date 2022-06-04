class Banner
  def initialize(message, width=message.size)
    @message = message
    @banner_width = set_banner_width(width)
  end

  def set_banner_width(width)
    if width > 76
      @banner_width = 78
    elsif width < @message.size - 2
      @banner_width = @message.size
    else
      @banner_width = width + 2
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @banner_width}-+"
  end

  def empty_line
    "| #{' ' * @banner_width} |"
  end

  def message_line
    "| #{@message.center(@banner_width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner