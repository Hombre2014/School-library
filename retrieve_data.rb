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
      retrieved_persons = parsed_json.map do |person|
        if person['type'] == 'Student'
          student = Student.new(person['age'], person['name'])
          student.id = person['id']
          p "#{student} from retrieve_data line 18"
          student
        else
          teacher = Teacher.new(person['age'], person['name'], person['specialization'])
          teacher.id = person['id']
          p "#{teacher} from retrieve_data line 18"
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
      p JSON.parse(json)
      parsed_json = JSON.parse(json)
      retrieved_books = parsed_json.map do |book|
        new_book = Book.new(book['title'], book['author'])
        p new_book
        new_book
      end
    end
  end

  def retrieve_rentals
    json = File.read('rentals.json')
    if json.empty?
      []
    else
      p JSON.parse(json)
      parsed_json = JSON.parse(json)
      retrieved_rentals = parsed_json.map do |rental|
        if (rental['person']['type'] == 'Student')
          person = Student.new(rental['person']['age'], rental['person']['name'])
          person.id = rental['person']['id']
          new_rental = Rental.new(rental['date'],person, Book.new(rental['book']['title'], rental['book']['author']))
        else
          person = Teacher.new(rental['person']['age'], rental['person']['name'], rental['person']['specialization'])
          person.id = rental['person']['id']
          new_rental = Rental.new(rental['date'], person, Book.new(rental['book']['title'], rental['book']['author']))
        end
      end
    end
  end
end
