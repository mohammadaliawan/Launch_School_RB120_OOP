class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further Exploration:

# attr_reader is used for creating getter methods only
# attr_writer is used for creating setter methods only
# attr_accessor is used for creating getter and setter methods both
# We used attr_reader because we needed getter methods only
# It would be ok to use attr_accessor here as well, but that would
# also create the setter methods for @title and @author which we 
# dont need. It would be better not to create these setter methods
# as these are not required by users of the object book. Creating public
# setter methods could also provide the users of the object access to
# changing the values of these instance variables which might not
# be what we want due to data protection reasons.