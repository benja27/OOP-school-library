require_relative 'rental'
# class book
class Book
  attr_accessor :author, :title, :rentals

  def initialize(author, title)
    @author = author
    @title = title
    @rentals = []
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'author' => @author,
      'title'=> @title
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['author'], object['title'])
  end


  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
