require_relative 'list'
require_relative 'create'

class ProcessInput
  def initialize(choice, books, rentals, persons)
    @choice = choice
    @persons = persons
    @rentals = rentals
    @list_books = ListBooks.new(books)
    @create_books = CreateBooks.new(books)
    @create_person = CreatePerson.new(persons)
    @create_rentals = CreateRental.new(rentals, books, persons)
    @list_persons = ListPersons.new(persons)
    @list_rentals = ListRentals.new(persons)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def input
    case @choice
    when 1 then @list_books.display
    when 2 then @list_persons.display
    when 3 then @create_person.create
    when 4 then @create_books.create
    when 5 then @create_rentals.create
    when 6 then @list_rentals.display
    when 7
      puts "\nThank you for using School Library App. Goodbye!"
      exit
    else
      puts "\nPlease, enter a valid number between 1 and 7.\n"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
