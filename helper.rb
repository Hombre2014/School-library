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
end
