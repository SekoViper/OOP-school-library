require_relative 'student'
require_relative 'teacher'

class CreatePeople
  attr_accessor :people

  def initialize
    @people = []
  end

  # list people
  def list_people
    puts 'No Person' if @people.empty?
    @people.each do |person|
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

    @people << Student.new(name, age, parent_permission: parent_permission)
  end

  # ask teacher info
  def ask_teacher
    print 'name: '
    name = gets.chomp

    print 'age: '
    age = gets.chomp.to_i

    print 'specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name, parent_permission: true)
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

  class << self
    attr_reader :people
  end
end
