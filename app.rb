require_relative 'create_book'
require_relative 'create_people'
require_relative 'rental_inputs'

class App
  include CreateBook
  include CreatePeople

  def initialize
    @rentals = []
    @book = Object.new
    @book.extend CreateBook

    @person = Object.new
    @person.extend CreatePeople

    @rental = RentalInput.new
  end

  def process_input(input, app)
    case input
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rental
    end
  end

  def create_rental
    @rental.create_rental
  end

  def list_rental
    @rental.list_rental
  end

  def list_books
    @book.list_books
  end

  def list_people
    @person.list_people
  end

  def create_person
    @person.create_person
  end

  def create_book
    @book.create_book
  end
end
