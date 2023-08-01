require './person'

# we create the class teacher
class Teacher < Person
  def initialize(id, age, specialization, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
