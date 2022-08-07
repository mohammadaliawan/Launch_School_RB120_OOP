class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
    @grade = grade
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">


=begin
In the above code we expected the state of the object to include the @grade instance variable. Why does it not include the
@grade instance variable.

In the above class the @grade instance variable for the `ade` object is never initialized which is why the instance 
variable `@grade` is not part of the state of the object. The `attr_accessor` method creates getters and setters for the 
@grade but it does not initialize `@grade` to anything. We can make it part of the state of the object `ade` by initializing` 
it in the `initialize` method by inlcuding the line `@grade = grade` after line `5`. 

If the getter method `grade` is invoked on the `ade` object it will return nil right now not because `@grade` is initialized
to the ``nil` but because `nil is returned when unitialized instance variables are referenced in ruby.


=end