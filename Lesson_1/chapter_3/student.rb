class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(n, g)
    self.name = n
    self.grade = g
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new("Joe", 87)
bob = Student.new("Bob", 85)

p joe.better_grade_than?(bob)