require 'rspec'
require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do
  before :each do
    person = Student.new('Seko', 32)
    book = Book.new('Narnia', 'Bob')
    @rental = Rental.new('2023-02-09', book, person)
  end

  it 'creates a rental' do
    expect(@rental.person.name).to eq 'Seko'
    expect(@rental.book.title).to eq 'Narnia'
  end
end
