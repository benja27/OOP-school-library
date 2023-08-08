require './student'
require './teacher'
require './book'
require './rental'
require './storage' 
require 'json'

# class app
class App
  def initialize(base)
    @base = base
    @book_list = Storage.load_data('books.json')
    @people_list = Storage.load_data('people.json')
    @rentals_list = Storage.load_data('rentals.json')   
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

  # def read_file
  #   File.read('students.json')
  #   map 

  #   if element.type = student 
  #       student.new(elemtnt)
  #       books_file = File.open('books.json')
  #   books_file_data = books_file.read
  #   books_json_file = JSON.parse(books_file_data)
  #   books_json_file.each do |book|
  #     @books << Book.new(book['publish_date'], publisher: book['publisher'], cover_state: book['cover_state'],
  #                                              archived: book['archived'])
  #   end
  # end

  def list_all_people
    if @people_list.empty?
      puts 'there is no people on record'
    else
      puts 'here you have all people on record'
      @people_list.each do |person|
        puts "ID #{person.id} type: [#{person.class}] Age: #{person.age} Name: #{person.name}   "
        # p person
      end
    end
    @base.show_menu
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2) [input the number]: '
    type_of_person = gets.chomp
    case type_of_person
    when '1'
      create_student
    when '2'
      create_teacher
    end
    @base.show_menu
  end

  def create_student
    print 'Age: '
    opt_age = gets.chomp.to_i
    print 'Neme: '
    opt_name = gets.chomp
    print 'Hast parent permission? [y/n]: '
    opt_parent_permission = gets.chomp.downcase == 'y'

    @people_list.push(Student.new(opt_age, name: opt_name, parent_permission: opt_parent_permission))
    
    # map = @people_list.map do  |person|
    #   if person.class.name == "Student" 
    #     {
    #       type: person.class.name,
    #       name: person.name,
    #       age: person.age,
    #       parent_permission: person.parent_permission
    #     }
    #   else      
    #   {
    #     type: person.class.name,
    #     name: person.name,
    #     age: person.age,
    #     specialization: specialization
    #   }
    #   end
    # end

    Storage.save_data('people.json', @people_list)
    puts
    
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Neme: '
    name = gets.chomp
    print 'Specialization '
    specialization = gets.chomp
    @people_list.push(Teacher.new(age, specialization, name))      
    
    # map = @people_list.map do  |person|
    #   if person.class.name == "Student" 
    #     {
    #       type: person.class.name,
    #       name: person.name,
    #       age: person.age,
    #       parent_permission: person.parent_permission
    #     } 
    #   else     
    #     {
    #       type: person.class.name,
    #       name: person.name,
    #       age: person.age,
    #       specialization: person.specialization
    #     }
    #   end
    # end

    Storage.save_data('people.json', @people_list)


    puts 'Teacher created successfully'
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

    Storage.save_data('rentals.json', @rentals_list )

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
    # id = gets.chomp.to_i
    
    @people_list.each do |person| 
      puts " ID: #{person.id} Name: #{person.name}  "
    end
    
    print 'person ID: '
    id = gets.chomp.to_i
    
    puts 'Rentals'
    @rentals_list.each do |rental|
      puts "Date : #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author} #{rental.person.id}"
      puts "Date : #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author} #{rental.person.id}" if rental.person.id == id
    end
    @base.show_menu
  end

  def save_info
    
  end
  
  
  def exit
    puts 'Thanks for using my app'
    save_info
  end


end
