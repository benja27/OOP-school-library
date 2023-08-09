require './student'
require './teacher'
require './storage'

# here we can create either a student or a teacher
class CreateObject
  def self.create_student(people_list)
    # print people_list
    print 'Age: '
    opt_age = gets.chomp.to_i
    print 'Name: '
    opt_name = gets.chomp
    print 'Hast parent permission? [y/n]: '
    opt_parent_permission = gets.chomp.downcase == 'y'
    new_list = people_list.push(Student.new(opt_age, name: opt_name, parent_permission: opt_parent_permission))
    Storage.save_data('people.json', new_list)
    puts 'Student created successfully'
  end

  def self.create_teacher(people_list)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization '
    specialization = gets.chomp
    new_list = people_list.push(Teacher.new(age, specialization, name))
    Storage.save_data('people.json', new_list)
    puts 'Teacher created successfully'
  end
end
