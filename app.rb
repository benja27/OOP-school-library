require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize(base)
    @base = base 
    @book_list = []
    @people_list = []
    @rentals_list = []
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
        puts "here you have all people on record"
        @people_list.each do | person | puts "ID: #{person.id} type:  [ #{person.class} ] Name: #{person.name} Age: #{person.age}  "
      end
    end
    @base.show_menu
  end

  def create_person
    print "Do you want to create a student(1) or a teacher(2) [input the number]: "
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
    print "Age: "
    opt_age = gets.chomp.to_i 
    print "Neme: "
    opt_name = gets.chomp
    print "Hast parent permission? [y/n]: "
    opt_parent_permission = gets.chomp.downcase == 'y'
    @people_list.push(Student.new( opt_age, name: opt_name , parent_permission: opt_parent_permission))
    puts 
    puts 'Student created successfully'
  end

  def create_teacher
    print "Age: "
    age = gets.chomp.to_i 
    print "Neme: "
    name = gets.chomp
    print "Specialization "
    specialization = gets.chomp
    @people_list.push(Teacher.new( age, specialization, name ))
    puts 
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp 
    @book_list.push(Book.new(author, title))
    puts
    puts "book created successfully..."
    puts
    @base.show_menu
  end

  def create_rental
    puts 'select a book from the following list by number'
    @book_list.each_with_index { |book, index | puts "#{index}) Title: #{book.title}, Author: #{book.author}"}
    book_num = gets.chomp.to_i 
    puts 
    
    puts "select a person form the following list by number (not id)"
    @people_list.each_with_index do |person, index| 
      puts "#{index}) [#{person.class}]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp  
    @rentals_list.push(Rental.new(date, @book_list[book_num], @people_list[person_num]) )
    puts "rental created successfully"

    @base.show_menu
  end

  def list_all_rentals 
    print "person ID: "
    id = gets.chomp.to_i

    puts "Rentals"
    @rentals_list.each do |rental|
      puts "Date : #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author} " if rental.person.id == id
    end
    @base.show_menu
  end

  def exit
    puts 'Thanks for using my app' 
  end
end