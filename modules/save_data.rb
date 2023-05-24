require 'json'
require 'fileutils'

class SaveData
  def exist_file(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'books'
    FileUtils.touch('./data/people.json') if !File.exist?('./data/people.json') && filename == 'people'
    FileUtils.touch('./data/rentals.json') if !File.exist?('./data/rentals.json') && filename == 'rentals'
  end

  def save_books(books)
    book_arr = []
    books.each do |book|
      book_arr << { title: book.title, author: book.author }
    end
    return if book_arr.empty?

    exist_file('books')
    File.write('./data/books.json', JSON.pretty_generate(book_arr))
  end

  def save_people(people)
    people_arr = []
    people.each do |person|
      person_obj = {
        id: person.id,
        name: person.name,
        age: person.age,
        type: person.class.name
      }
      if person.instance_of?(::Teacher)
        person_obj[:specialization] = person.specialization
      else
        person_obj[:parent_permission] = person.parent_permission
      end
      people_arr << person_obj
    end

    return if people_arr.empty?

    exist_file('people')
    File.write('./data/people.json', JSON.pretty_generate(people_arr))
  end

  def save_rentals(rentals, books, people)
    rentals_arr = []
    rentals.each do |rental|
      rental_obj = {
        date: rental.date,
        people_index: people.index(rental.person),
        book_index: books.index(rental.book)
      }
      rentals_arr << rental_obj
    end

    return if rentals_arr.empty?

    exist_file('rentals')

    File.write('./data/rentals.json', JSON.pretty_generate(rentals_arr))
  end
end
