require_relative '../book'
require_relative '../student'

describe Book do
  before :each do
    @book = Book.new('Atomic_habits', 'James_clear')
  end

  it 'Sets the title and author' do
    expect(@book.author).to eq 'James_clear'
    expect(@book.title).to eq 'Atomic_habits'
  end
end
