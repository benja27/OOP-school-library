# class book
class Book
  attr_accessor :author, :tittle, :rentals

  def initialize(author, tittle)
    @author = author
    @tittle = tittle
    @rentals = []
  end
end
