class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end

# puts rental1 = Rental.new(2020/03/04, "Ivan Grozni", "War")
