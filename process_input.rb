class ProcessInput
  def initialize(choice)
    @choice = choice
  end

  def input(choice)
    case choice
    when 1 then list_all_books
    when 2 then list_all_people
    when 3 then create_a_person
    when 4 then create_a_book
    when 5 then create_a_rental
    when 6 then list_all_rentals
    when 7
      puts "\nThank you for using School Library App. Goodbye!"
      exit
    else
      puts "\nPlease, enter a valid number between 1 and 7.\n"
    end
  end
end