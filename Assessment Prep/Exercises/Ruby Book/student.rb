class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end

  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new("Joe", 99)
bob = Student.new("Bob", 89)

puts "Welldone!" if joe.better_grade_than?(bob)