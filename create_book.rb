require_relative 'book'

module CreateBook
  class << self
    attr_accessor :books
  end

  @books = []

  def self.people
    @books
  end

  def list_books
    puts 'No books' if CreateBook.books.empty?
    CreateBook.books.each do |book|
      puts "ID: #{book.id} Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    return unless CreateBook.books << Book.new(title, author)

    puts 'Book created successfully'
  end
end
