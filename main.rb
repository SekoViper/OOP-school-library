class Main
  library = Rental.new

  puts 'What will you like to do? Choose an option.'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person ID'
  puts '0. Quit'

  choice = gets.chomp.to_i

  case choice
  when 0
    break
  when 1
    library.list_books
  when 2
    library.list_people
  when 3
    puts 'What type of person do you want to create? Enter 1 for teacher or 2 student'
    person_type = gets.chomp
    case person_type
    when 1
      puts 'Enter Teachers Name'
      name = gets.chomp
      puts "Enter teacher's age"
      age = gets.chomp.to_i
      puts "Waht's teacher's specialization?"
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      library.add_person(teacher)
      puts "Teacher created with ID: #{teacher.id}"
    when 2
      puts "Enter the student's name:"
      name = gets.chomp
      puts "Enter the student's age:"
      age = gets.chomp.to_i
      puts "Enter the student's grade:"
      grade = gets.chomp
      student = Student.new(name, age, grade)
      library.add_person(student)
      puts "Student created with ID #{student.id}"
    else
      puts 'Invalid person type'
    end
  when 4
    puts "Enter the book's title:"
    title = gets.chomp
    puts "Enter the book's author:"
    author = gets.chomp
    book = Book.new(title, author)
    library.add_book(book)
    puts "Book created with ID #{book.id}"
  when 5
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i
    person = library.find_person(id)
    if person.nil?
      puts 'Person not found'
      next
    end
    puts 'Enter the rental date (yyyy-mm-dd):'
    rental_date = gets.chomp
    rental = Rental.new(rental_date, book, person)
    library.aad_retal(rental)
    puts "Rental created with ID #{rental.id}"
  when 6
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i
    person = library.find_person(person_id)

    if person.nil?
      puts 'person not found'
      next
    end

    rentals = library.find_person(person_id)
    puts "Rentals for #{person.name}:"
    rentals.each do |rental1|
      puts "Book: #{rental1.book.title}, Rental date: #{rental1.date}"
    end
  else puts 'Invalid choice.'
  end
end
