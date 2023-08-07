# frozen_string_literal: true

require './person'

# class rental
class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    add_rental_to_book
    add_rental_to_person
  end

  def add_rental_to_book
    book.rentals << self
  end

  def add_rental_to_person
    person.rentals << self
  end
end
