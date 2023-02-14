require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trim_decorator'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :nameable
  attr_reader :id

  def initialize(age, name, parent_permission)
    super
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @nameable = nameable
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end
end
