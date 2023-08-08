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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date'=> @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['date'], object['book'], object['person']);
  end

end
