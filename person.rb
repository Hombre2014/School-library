class Person
  def initialize(name = "Unknown", age, parrent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    parrent_permission = parrent_permission
  end
  attr_accessor :name
  attr_accessor :age

  def id
    @id
  end

  private
    def is_of_age?
      if @age >= 18
        true
      elsif
        false
      end
    end

  public
    def can_use_services?
      if is_of_age? || parrent_permission
        true
      elseif
        false
      end
    end
end
