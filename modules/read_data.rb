require 'json'
require 'pry'

class ReadData
  def read_books
    books = []
    return books unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    data = JSON.parse(file.read)
<<<<<<< HEAD
    file.close
    data.each do |book|
      books << Book.new(book['title'], book['author'])
    end
=======
    data.each do |book|
      books << Book.new(book['title'], book['author'])
    end
    file.close
>>>>>>> 50a63d48ce2b7cfc82af34296c4ae41b81c0530b
    books
  end

  def read_people
    people = []
<<<<<<< HEAD
=======

>>>>>>> 50a63d48ce2b7cfc82af34296c4ae41b81c0530b
    return people unless File.exist?('./data/people.json')

    file = File.open('./data/people.json')
    data = JSON.parse(file.read)
    file.close
    data.each do |person|
      if person['type'] == 'Student'
        student = Student.new(person['age'], person['name'], person['parent_permission'])
        people << student
      else
        teacher = Teacher.new(person['age'], person['name'], person['parent_permission'])
        people << teacher
      end
    end
<<<<<<< HEAD
=======
    file.close
>>>>>>> 50a63d48ce2b7cfc82af34296c4ae41b81c0530b
    people
  end

  def read_rentals(books, people)
    rentals = []
    return rentals unless File.exist?('./data/rentals.json')

    file = File.open('./data/rentals.json')
    data = JSON.parse(file.read)
    file.close
    data.each do |rental|
      rentals << Rental.new(rental['date'], books[rental['book_index']], people[rental['people_index']])
    end
    rentals
  end
end
