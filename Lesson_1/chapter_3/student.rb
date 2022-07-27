class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    self.grade > other.grade
  end

  protected

  attr_reader :grade
end

bob = Student.new("Bob", 98)
joe = Student.new("Joe", 100)

puts "Welldone" if joe.better_grade_than?(bob)
