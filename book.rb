class Book
  attr_accessor :id, :title, :author, :rental

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, person)
    @rental << Rental.new(date, self, person)
  end
end
