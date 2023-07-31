# frozen_string_literal: true

require './person'
# we create the class student
class Student < Person
  def initialize(id, age, classroom, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
