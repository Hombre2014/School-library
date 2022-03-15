require 'json'

class SaveData
  def initialize(persons, books, rentals)
    @persons = persons
    @books = books
    @rentals = rentals
  end

  include Helpers

  def save
    persons_obj = @persons.map do |per|
      create_person_obj(per)
    end
    persons_json = JSON.generate(persons_obj)

    books_obj = @books.map do |book|
      create_book_obj(book)
    end
    books_json = JSON.generate(books_obj)

    rentals_obj = @rentals.map do |r|
      { date: r.date, person: create_person_obj(r.person), book: create_book_obj(r.book) }
    end
    rentals_json = JSON.generate(rentals_obj)

    save_file('persons.json', persons_json)
    save_file('rentals.json', rentals_json)
    save_file('books.json', books_json)
  end
end
