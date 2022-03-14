require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'helper'
require_relative 'rental'
require_relative 'list'

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

  include Helpers

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

class CreateRental
  def initialize(rentals, books, persons)
    @rentals = rentals
    @books = books
    @persons = persons
    @list_books = ListBooks.new(books)
    @list_persons = ListPersons.new(persons)
  end

  def create
    puts "\nCreate a new rental"
    if @books.empty?
      puts "\nThere are no books in the library. You can create a book from the main menu."
      return
    else
      @list_books.display
      print "\nSelect which book you want to rent by entering its number: "
      book_number = gets.chomp.to_i
    end
    if @persons.length.zero?
      puts "\nThere are no registered persons. You can create a person from the main menu."
    else
      @list_persons.display
      print "\nSelect a person from the list by its number (not id!): "
      person_number = gets.chomp.to_i
    end
    print 'Enter date in the following format [YYYY/MM/DD]: '
    date = gets.chomp
    Rental.new(date, @persons[person_number - 1], @books[book_number - 1])
    puts 'Rental created successfully.'
  end
  
end