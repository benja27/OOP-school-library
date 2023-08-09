require './person'
# we create the class student
class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, name: 'unknown', parent_permission: true, classroom: nil, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => @age,
      'Classroom' => @classroom,
      'id' => @id,
      'name' => name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['age'], name: object['name'], parent_permission: object['parent_permission'],
                       classroom: object['classroom'], id: object['id'])
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
