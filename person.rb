# class person
class Person
  # we set the getter and setter for these elements - id, name and age
  attr_accessor :name, :age
  attr_reader :id

  # constructor
  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # public methods

  def can_use_services?
    of_age? || @parent_permission
  end

  # private methods
  private

  def of_age?
    @age >= 18
  end
end
