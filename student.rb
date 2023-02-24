require_relative 'person'

class Student < Person
  attr_accessor :age, :name, :classroom

  def initialize(name, age, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classrooms(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
end
