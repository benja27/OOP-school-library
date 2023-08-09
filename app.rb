require './student'
require './teacher'
require './book'
require './rental'
require './storage'
require 'json'
require './create_object'
# class app
class App
  def initialize(base)
    @base = base
    @rentals_list = Storage.load_data('rentals.json')
    @book_list = Storage.load_data('books.json')
    @people_list = Storage.load_data('people.json')
  end

  def list_all_books
    if @book_list.empty?
      puts 'There is no books on file'
    else
      puts 'here you go, books in the library'
      @book_list.each { |book| puts "title: #{book.title}, Author: #{book.author}" }
    end
    @base.show_menu
  end

  def list_all_people
    if @people_list.empty?
      puts 'there is no people on record'
    else
      puts 'here you have all people on record'
      @people_list.each do |person|
        puts "ID #{person.id} type: [#{person.class}] Age: #{person.age} Name: #{person.name}   "
      end
    end
    @base.show_menu
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2) [input the number]: '
    type_of_person = gets.chomp
    case type_of_person
    when '1'
      CreateObject.create_student(@people_list)
    when '2'
      CreateObject.create_teacher(@people_list)
    end
    @base.show_menu
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book_list.push(Book.new(author, title))
    Storage.save_data('books.json', @book_list)
    puts 'book created successfully...'
    @base.show_menu
  end

  def create_rental
    book_num = ask_for_book
    person_num = ask_for_person
    print 'Date: '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, @book_list[book_num], @people_list[person_num]))
    Storage.save_data('rentals.json', @rentals_list)
    puts 'rental created successfully'
    @base.show_menu
  end

  def ask_for_book
    puts 'select a book from the following list by number'
    @book_list.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    gets.chomp.to_i
  end

  def ask_for_person
    puts 'select a person form the following list by number (not id)'
    @people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def list_all_rentals
    display_people_and_choose_person
    display_person_rentals
    @base.show_menu
  end

  def display_people_and_choose_person
    puts 'People:'
    @people_list.each do |person|
      puts " ID: #{person.id} Name: #{person.name}"
    end
    print 'Enter person ID: '
    @selected_person_id = gets.chomp.to_i
  end

  def display_person_rentals
    puts "Rentals for person with ID #{@selected_person_id}:"
    @rentals_list.each do |rental|
      next unless rental.person.id == @selected_person_id

      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def exit
    puts 'Thanks for using my app'
  end
end
