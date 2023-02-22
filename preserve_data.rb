require 'fileutils'
require 'json'

FileUtils.mkdir_p('saved_data')
base = "#{Dir.pwd}/saved_data"
File.open("#{base}/books.json", 'w') unless File.exist?("#{base}/books.json")
File.open("#{base}/people.json", 'w') unless File.exist?("#{base}/people.json")
File.open("#{base}/rentals.json", 'w') unless File.exist?("#{base}/rentals.json")

def write_data(filename, array)
  case filename
  when 'people'
    write_people(array)
  when 'rentals'
    write_rentals(array)
  when 'books'
    write_books(array)
  else
    puts 'Error!'
  end
end
