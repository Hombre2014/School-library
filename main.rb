#!/usr/bin/env ruby
require_relative 'process_input'
require_relative 'helper'

class Main
  include Helpers
  def initialize
    @retrieve_data = RetrieveData.new(@persons, @books, @rentals)
    @persons = @retrieve_data.retrieve_persons
    @books = @retrieve_data.retrieve_books
    @rentals = @retrieve_data.retrieve_rentals
  end

  def start
    puts "\nWelcome to the School Library App!"
    puts "\nPlease choose an option by entering a number:"
    puts "\n1 - List all books"
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n"
    print "\n[Your choice?]: "
    choice = gets.chomp.to_i
    process_input = ProcessInput.new(choice, @books, @rentals, @persons)
    process_input.input
    start
  end
end

main = Main.new
main.start
