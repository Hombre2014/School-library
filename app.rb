require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'

class App
  def run
    @persons = []
    @books = []
    puts "Welcome to the School Library App!"
    display_menu
  end

  def display_menu
    puts "\nPlease choose an option by entering a number:"
    puts "\n1 - List all books"
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n"
    puts
    print '[Your choice?]: '
    choice = gets.chomp.to_i
    process_input(choice)
    display_menu
  end
  
  def list_all_books
    puts 'Here is the list of all the books in the library'
    puts
  end
  
  def list_all_people
    puts 'Here is the list of all the people'
    puts
  end
  
  def create_a_person
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
      create_a_person
    end
  end
  
  def create_student
    puts "\nCreate a new student"
    print 'Enter age: '
    student_age = gets.chomp.to_i
    print 'Enter name: '
    student_name = gets.chomp
    print 'Has parrent permition? Enter [Y/N]: '
    parent_permission = gets.chomp
    case parent_permission
    when 'y'
      Student.new(student_name, student_age)
    when 'n'
      Student.new(student_name, student_age, parent_permission: false)
    else
      puts 'Please, select "y" or "n"'
      create_student
    end
  end
  
  def create_teacher
    puts "\nCreate a new teacher"
    print 'Enter age: '
    teacher_age = gets.chomp.to_i
    print 'Enter name: '
    teacher_name = gets.chomp
    print 'Enter specialization: '
    specialization = gets.chomp
    Teacher.new(teacher_name, teacher_age, specialization)
  end
  
  def create_a_book
    puts "\nCreate a new book"
    print "Enter book's title: "
    book_title = gets.chomp
    print "Enter book's author: "
    book_author = gets.chomp
    @books.push(Book.new(book_title, book_author))
    puts "Book #{book_title} created successfully.\n"
  end
  
  def create_a_rental
    puts 'Create a rental'
  end
  
  def list_all_rentals
    puts 'list all rentals'
  end
  
  def process_input(choice)
    case choice
    when 1 then list_all_books
    when 2 then list_all_people
    when 3 then create_a_person
    when 4 then create_a_book
    when 5 then create_a_rental
    when 6 then list_all_rentals
    when 7
      puts "\nThank you for using School Library App. Goodbye!"
      exit
    else
      puts "Please, enter a valid number between 1 and 7.\n"
    end
  end
end
