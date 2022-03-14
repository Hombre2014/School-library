module GetInfo
  def get_name_and_age
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    info = {age: age, name: name}
  end
end
