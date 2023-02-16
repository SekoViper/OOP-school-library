class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rental << self
    person.rental << self
  end
end