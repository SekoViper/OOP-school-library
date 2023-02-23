require_relative 'create_people'
require_relative 'create_book'
require_relative 'rental'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require 'json'

module RentalInput
  include CreatePeople
  include CreateBook
  @rentals = []

  def self.rental
    @rentals
  end

  def self.load_rentals
    base = "#{Dir.pwd}/saved_data"
    rental_reader = File.read("#{base}/rentals.json")
    return if rental_reader == ''

    @rentals = JSON.parse(rental_reader).map do |data|
      book = Book.new(data['title'], data['author'])
      if data['person'] == 'Student'
        person = Student.new(data['name'], data['age'],
                             parent_permission: data['parent'])
      end
      person = Teacher.new(data['name'], data['age'], data['specialization']) if data['person'] == 'Teacher'

      Rental.new(data['date'], book, person)
    end
  end

  def create_rental
    puts 'Person ID: '
    person_id = gets.chomp.to_i
    person = CreatePeople.people.find { |person1| person1.id == person_id }
    if person.nil?
      puts "Could not find person with ID: #{person_id}"
      return
    end

    puts 'what is the ID of the book being rented?'
    book_id = gets.chomp.to_i
    book = CreateBook.books.find { |book1| book1.id == book_id }

    if book.nil?
      puts "Could not find book with ID: #{book_id}"
      return
    end

    puts 'When the book was rented'
    date = gets.chomp

    RentalInput.rental << Rental.new(date, book, person)
    puts "Rented book with ID: #{book_id} to person with ID: #{person_id} on #{date}"
  end

  def list_rental
    RentalInput.load_rentals
    puts 'What is the ID of the person?'
    person_id = gets.chomp.to_i

    puts 'Please enter a valid person ID' if person_id.nil?
    list_rentals = RentalInput.rental.select { |rental1| rental1.person.id == person_id }

    if list_rentals.empty?
      puts 'No rentals found'
      return
    end
    list_rentals.each { |rental| puts "Title: #{rental.book.title}, Book Author: #{rental.book.author}" }
  end
end
