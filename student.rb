require './person'
# we create the class student
class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, name: 'unknown', parent_permission: true, classroom:  nil )
    super( age, name, parent_permission: parent_permission)
    @classroom = classroom    
  end  

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*args )
    {
      JSON.create_id => self.class.name,
      'age' => @age,      
      'Classroom' => @classroom,
      'name' => self.name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['age'], name: object['name'], parent_permission: object['parent_permission'], classroom: object['classroom'])
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
