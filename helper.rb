module Helpers
  def name_and_age
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    { age: age, name: name }
  end

  def choosen_person(person_id)
    @persons.each do |person|
      return person if person.id == person_id
    end
    false
  end

  def create_person_obj(person)
    p "#{person.class} from helper line 18"
    if person.instance_of?(Student)
      p "#{person} from helper line 20"
      return { name: person.name, age: person.age, type: 'Student', id: person.id,
              parent_permission: person.parent_permission }
    end
    if person.instance_of?(Teacher)
      return { name: person.name, age: person.age, type: 'Teacher', id: person.id,
              specialization: person.specialization }
    end
  end

  def retrive_persons(file_json)
    file_json.map do |person|
      if person['type'] == 'Student'
        Student.new(person['name'], person['age'])
      else
        Teacher.new(person['name'], person['age'], person['specialization'])
      end
    end
  end

  def create_book_obj(book)
    { title: book.title, author: book.author }
  end

  def retrive_books(file_json)
    file_json.map { |book| Book.new(book['title'], book['author']) }
  end

  def save_file(filename, json)
    file = File.new(filename, 'w')
    file.puts(json)
    file.close
  end

  def retrive_rentals(file_json)
    file_json.map { |rental| Rental.new(rental['date'], Person.new(rental['person']['name'], rental['person']['age'], parent_permission: true), Book.new(rental['book']['title'], rental['book']['author'])) }
  end

  def file_open(filename)
    if File.exist?(filename)
      file = File.open(filename) 
      file_data = file.read
      JSON.parse(file_data)
    else
      []
    end
  end

  def read_file(filename)
    case filename
    when 'books.json' then retrive_books(file_open(filename))
    when 'persons.json' then retrive_persons(file_open(filename))
    when 'rentals.json' then retrive_rentals(file_open(filename))
    end
  end
end
