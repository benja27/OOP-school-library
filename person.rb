require_relative 'nameable'
require_relative 'rental'

# class person
class Person < Nameable
  # we set the getter and setter for these elements - id, name and age

  attr_accessor :name, :age, :rentals
  attr_reader :id

  # constructor
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1..999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  # public methods

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # private methods
  private

  def of_age?
    @age >= 18
  end
end
