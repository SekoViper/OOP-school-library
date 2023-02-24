require_relative '../book.rb'
require_relative '../student.rb'

describe Book do
  before :each do
    @book = Book.new('Atomic_habits', 'James_clear')
  end

  it 'Sets the title and author' do
    expect(@book.author).to eq 'James_clear'
    expect(@book.title).to eq 'Atomic_habits'
  end

  # it 'adds rental to rentals array' do
  #   person = { 'id' => 12, 'name' => 'Robert', 'age' => 32, 'rentals' => [] }
  #   person2 = { 'id' => 24, 'name' => 'Albert', 'age' => 52, 'rentals' => [] }
  #   @book.add_rental('2023-02-08', person)
  #   # @book.add_rental(person2, '2023-02-08')
  #   expect(@book.rentals.length).to eql 1
  # end
end