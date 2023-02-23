require_relative 'book'
require 'json'

module CreateBook
  @books = []
  class << self
    attr_accessor :books
  end

  # reading books from json file methods
  def self.load_books
    base = "#{Dir.pwd}/saved_data"
    books_reader = File.read("#{base}/books.json")
    return if books_reader == ''

    JSON.parse(books_reader).each do |x|
      CreateBook.books.push(Book.new(x['title'], x['author']))
    end
  end

  def list_books
    puts 'No books' if CreateBook.books.empty?
    puts 'All Books'
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
