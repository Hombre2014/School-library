require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'helper'

class CreateBooks
    def initialize(books)
        @books = books
    end
    def create
        puts "\nCreate a new book"
        print "\nEnter book's title: "
        title = gets.chomp
        print "Enter book's author: "
        author = gets.chomp
        @books.push(Book.new(title, author))
        puts "Book #{title} created successfully.\n"
    end
end

class CreatePerson
  def initialize(persons)
    @persons = persons
  end

  include GetInfo

  def create
    print 'Do you want to create a student [1] or a teacher [2]? [Input number]: '
    person = gets.chomp.to_i
    case person
    when 1
      @persons.push(create_student)
      puts "\nThe student created successfully."
    when 2
      @persons.push(create_teacher)
      puts "\nThe teacher created successfully."
    else
      puts 'Please, select Student [1] or Teacher [2] only!'
      create
    end
  end

  def create_student
    puts "\nCreate a new student"
    student = get_name_and_age
    print 'Has parrent permition? Enter [Y/N]: '
    parent_permission = gets.chomp
    case parent_permission
    when 'y'
      Student.new(student[:name], student[:age])
    when 'n'
      Student.new(student[:name], student[:age], parent_permission: false)
    else
      puts 'Please, select "y" or "n"'
      create_student
    end
  end

  def create_teacher
    puts "\nCreate a new teacher"
    teacher = get_name_and_age
    print 'Enter specialization: '
    specialization = gets.chomp
    Teacher.new(teacher[:name], teacher[:age], specialization)
  end
end
