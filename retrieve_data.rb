class RetrieveData
  def initialize(persons, books, rentals)
    @persons = persons
    @books = books
    @rentals = rentals
  end

  def retrieve_persons
    json = File.read('persons.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |person|
        if person['type'] == 'Student'
          student = Student.new(person['age'], person['name'])
          student.id = person['id']
          student
        else
          teacher = Teacher.new(person['age'], person['name'], person['specialization'])
          teacher.id = person['id']
          teacher
        end
      end
    end
  end

  def retrieve_books
    json = File.read('books.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |book|
        new_book = Book.new(book['title'], book['author'])
        new_book
      end
    end
  end

  def retrieve_rentals
    json = File.read('rentals.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |rental|
        person = if rental['person']['type'] == 'Student'
                   Student.new(rental['person']['age'], rental['person']['name'])
                 else
                   Teacher.new(rental['person']['age'], rental['person']['name'], rental['person']['specialization'])
                 end
        person.id = rental['person']['id']
        Rental.new(rental['date'], person, Book.new(rental['book']['title'], rental['book']['author']))
      end
    end
  end
end
