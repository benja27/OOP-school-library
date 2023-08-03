require './person'
# we create the class student
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom = nil, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
    add_student if classroom
  end

  def add_student
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
