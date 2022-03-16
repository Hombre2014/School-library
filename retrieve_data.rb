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
      if parsed_json['type'] == 'Student'
        struct = parsed_json.map do |person|
          student = Student.new(person['age'], person['name'])
          student.id = person['id']
          p student
          student
        end
      else
        struct = parsed_json.map do |person|
          teacher = Teacher.new(person['age'], person['name'], person['specialization'])
          teacher.id = person['id']
          p teacher
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
    end
  end

  def retrieve_rentals
    json = File.read('rentals.json')
    if json.empty?
      []
    else
      p JSON.parse(json)
      parsed_json = JSON.parse(json)
    end
  end
end
