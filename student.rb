require_relative 'person'

class Student < Person
  attr_accessor :age, :name, :classroom

  def initialize(age, classroom = 'class one', name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end
  
end
