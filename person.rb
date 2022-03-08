class Person
  def initialize(age, parrent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parrent_permission = parrent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  private

  def of_age?
    if @age >= 18
      true
    elsif @age < 18
      false
    end
  end

  def can_use_services?
    if is_of_age? || parrent_permission
      true
    else
      false
    end
  end
end
