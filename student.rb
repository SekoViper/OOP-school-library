require_relative 'person'

class Student < Person
  attr_accessor :classroom, :age, :name, :id

  def initialize(id, age, classroom = 'class one', name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
