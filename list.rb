require_relative 'person'
require_relative 'helper'

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
          # rubocop:disable Layout/LineLength
          puts "#{index + 1}. [Teacher] Name: #{person.name}, age: #{person.age}, with ID: #{person.id} and specialization: #{person.specialization}"
          # rubocop:enable Layout/LineLength
        end
      end
    end
  end
end

class ListRentals
  def initialize(persons)
    @persons = persons
    @list_persons = ListPersons.new(persons)
  end

  include Helpers

  def display(rentals)
    @list_persons.display
    print "\nWhich person's rentals you want to see? Please, enter the person's ID: "
    person_id = gets.chomp.to_i
    # person = choosen_person(person_id)
    rentals.map do |rental|
      if rental.person.id == person_id
        puts "Book #{rental.book.title} was rented on #{rental.date} by #{rental.person.name}"
      else
        puts "\nThere are no rentals for this person's ID."
      end
    end
  end
end
