require_relative 'student'
require_relative 'teacher'

module CreatePeople
  @people = []

  def self.people
    @people
  end

  def self.load_people
    base = "#{Dir.pwd}/saved_data"
    people_reader = File.read("#{base}/people.json")
    @people = JSON.parse(people_reader).map do |data|
      if data['person'] == 'Student'
        Student.new(data['name'], data['age'], parent_permission: data['parent_permission'])
      elsif data['person'] == 'Teacher'
        Teacher.new(data['name'], data['age'], data['specialization'], parent_permission: data['parent_permission'])
      end
    end unless people_reader == ''
  end

  # list all people
  def list_people
    puts 'No Person' if CreatePeople.people.empty?
    CreatePeople.people.each do |person|
      puts "[#{person.class}]: ID: #{person.id}, Name: #{person.name}"
    end
  end

  # ask student info
  def ask_student
    print 'name: '
    name = gets.chomp

    print 'age: '
    age = gets.chomp.to_i

    print 'Permission: '
    parent_permission = gets.chomp

    CreatePeople.people << Student.new(name, age, parent_permission: parent_permission)
  end

  # ask teacher info
  def ask_teacher
    print 'name: '
    name = gets.chomp

    print 'age: '
    age = gets.chomp.to_i

    print 'specialization: '
    specialization = gets.chomp

    CreatePeople.people << Teacher.new(name, age, specialization, parent_permission: true)
  end

  # create person
  def create_person
    puts 'What kind of person do you want to create? (for student type 1 and for teacher type 2)'
    person_type = gets.chomp.to_i

    case person_type
    when 1
      ask_student
    when 2
      ask_teacher
    else
      puts 'Invalid person'
      return
    end

    puts 'Person created successfully'
  end
end
