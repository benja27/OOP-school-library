require_relative 'rental'
# class book
class Book
  attr_accessor :author, :tittle, :rentals

  def initialize(author, tittle)
    @author = author
    @tittle = tittle
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

end
