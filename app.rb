require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def run
    @persons = []
    @books = []
    puts "\nWelcome to the School Library App!"
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
    if @books.length == 0
      puts "\nThere are no books in the library. You can create a book from the main menu."
    else
      puts "\nHere are all the books in the library:"
      @books.each_with_index do |book, index|
        puts "#{index + 1}. Book's title: #{book.title}, Book's author: #{book.author}"
      end
    end
  end
  
  def list_all_people
    if @persons.length == 0
      puts 'There are no registered persons. You can create a person from the main menu.'
    else
      puts "\nList of all the persons:"
      @persons.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "#{index + 1}. [Student] Name: #{person.name}, age: #{person.age}, with ID: #{person.id}"
        else
          puts "#{index + 1}. [Teacher] Name: #{person.name}, age: #{person.age}, with ID: #{person.id} and specialization: #{person.specialization}"
        end
      end
    end
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
    print "\nEnter book's title: "
    title = gets.chomp
    print "Enter book's author: "
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "Book #{title} created successfully.\n"
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
      puts "\nPlease, enter a valid number between 1 and 7.\n"
    end
  end
end
