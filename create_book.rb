require_relative 'book'

class CreateBook
  attr_reader :books

  def initialize
    @books = []
  end

  def list_books
    puts 'No books' if @books.empty?
    @books.each do |book|
      puts "ID: #{book.id} Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    return unless @books << Book.new(title, author)

    puts 'Book created successfully'
  end

  class << self
    attr_reader :books
  end
end
