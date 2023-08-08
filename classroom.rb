# frozen_string_literal: true

# class classroom
class Classroom
  attr_accessor :label, :students
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << self
    student.classroom = self
  end
end
