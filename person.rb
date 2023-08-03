# frozen_string_literal: true

require_relative 'nameable'

# class person
class Person < Nameable
  # we set the getter and setter for these elements - id, name and age

  attr_accessor :name, :age, :rentals
  attr_reader :id

  # constructor
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  # public methods

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
