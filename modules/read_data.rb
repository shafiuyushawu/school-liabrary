require 'json'

class ReadData
  def read_books
    books = []
    return books unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    data = JSON.parse(file.read)
    data.each do |book|
      books << Book.new(book['title'], book['author'])
    end
    file.close
    books
  end

  def read_people
    people = []
    return people unless File.exist?('./data/people.json')

    file = File.open('./data/people.json')
    data = JSON.parse(file.read)
    file.close
    data.each do |person|
      if person['type'] == 'Student'
        student = Student.new(person['age'], person['name'], person['parent_permission'])
        student.id = person['id']
        people << student
      else
        teacher = Teacher.new(person['age'], person['name'], person['parent_permission'])
        teacher.id = person['id']
        people << teacher
      end
    end
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
