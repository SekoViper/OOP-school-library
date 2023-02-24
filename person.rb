require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trim_decorator'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rental
  attr_reader :id

  def initialize(name, age, parent_permission: true)
    super(name)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def of_age?
    @age.to_i >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
    rental
  end
end
