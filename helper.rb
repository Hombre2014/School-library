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
    return {'name': person.name, 'age': person.age, 'id': person.id, 'parent_permission': person.parent_permission} if (person.class == Student)
    return {'name': person.name, 'age': person.age, 'id': person.id, 'specialization': person.specialization} if (person.class == Teacher)
  end

  def create_book_obj(b)
    {'title': b.title, 'author': b.author}
  end

  def save_file(filename, json)
    file = File.new(filename, 'w');
    file.puts(json);
    file.close
  end
end
