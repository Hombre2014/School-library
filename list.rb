class ListBooks
    def initialize(books)
        @books = books
    end
    
    def display
        if @books.length.zero?
            puts "\nThere are no books in the library. You can create a book from the main menu."
        else
          puts "\nHere are all the books in the library:"
          @books.each_with_index do |book, index|
          puts "#{index + 1}. Book's title: #{book.title}, Book's author: #{book.author}"
        end
    end
    end
end

class ListPersons
  def initialize(persons)
    @persons = persons
  end

  def display
    if @persons.empty?
      puts "\nThere are no registered persons. You can create a person from the main menu."
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
end
