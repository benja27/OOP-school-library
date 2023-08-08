require './person'

# we create the class teacher
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => @age,
      'specialization' => @specialization,
      'name' => self.name,
      'parent_permission' => @parent_permision
    }.to_json(*args)
  end
  
  def self.json_create(object)
    new(object['age'], object['specialization'], object['name'], parent_permission: object['parent_permission'])
  end
  
  
  
  def can_use_services?
    true
  end



end
