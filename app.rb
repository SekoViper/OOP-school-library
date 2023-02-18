require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'No books' if @books.empty?
    @books.each do |book|
      puts "ID: #{book.id} Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    puts 'No Person' if @people.empty?
    @people.each do |person|
      puts "[#{person.class}]: ID: #{person.id}, Name: #{person.name}"
    end
  end

  # create preson
  def create_person
    puts 'What kind of person do you want to create? (for student type 1 and for teacher type 2)'
    person_type = gets.chomp.to_i

    case person_type
    when 1
      print 'name: '
      name = gets.chomp

      print 'age: '
      age = gets.chomp.to_i

      print 'Permission: '
      parent_permission = gets.chomp

      @people << Student.new(name, age, parent_permission: parent_permission)

    when 2
      print 'name: '
      name = gets.chomp

      print 'age: '
      age = gets.chomp.to_i

      print 'specialiazation: '
      specialization = gets.chomp

      @people << Teacher.new(age, specialization, name, parent_permission: true)

    else
      puts 'Invalid person'
      return
    end

    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Person ID: '
    person_id = gets.chomp.to_i
    person = @people.find { |person1| person1.id == person_id }

    if person.nil?
      puts "Could not find person with ID: #{person_id}"
      return
    end

    puts 'what is the ID of the book being rented?'
    book_id = gets.chomp.to_i
    book = @books.find { |book1| book1.id == book_id }

    if book.nil?
      puts "Could not find book with ID: #{book_id}"
      return
    end

    puts 'When the book was rented'
    date = gets.chomp

    book_rented = Rental.new(date, book, person)

    @rentals << book_rented
    puts "Rented book with ID: #{book_id} to person with ID: #{person_id} on #{date}"
  end

  def list_rental
    puts 'What is the ID of the person?'
    person_id = gets.chomp.to_i

    puts 'Please enter a valid person ID' if person_id.nil?

    list_rentals = @rentals.select { |rental1| rental1.person.id == person_id }

    if list_rentals.empty?
      puts 'No rentals found'
      return
    end
    list_rentals.each { |rental| puts "#{rental.book.title} " }
  end
end
