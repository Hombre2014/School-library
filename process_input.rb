require_relative 'list'
require_relative 'create'

class ProcessInput
  def initialize(choice, books, rentals, persons)
    @choice = choice
    @list_books = ListBooks.new(books)
    @create_books = CreateBooks.new(books)
    @persons = persons
    @rentals = rentals
  end

  def input
    case @choice
    when 1 then @list_books.display
    when 2 then list_all_people
    when 3 then create_a_person
    when 4 then @create_books.create
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