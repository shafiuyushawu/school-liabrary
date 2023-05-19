require_relative 'modules/classroom'
require_relative 'modules/teacher'
require_relative 'modules/student'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/book'

class App
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def select(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts 'Please select a valid option from the list!'
    end
  end

  def list_books
    @books.each do |book|
      book.instance_variables.each do |var|
        value = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        var = var.capitalize
        puts "#{var}: #{value}" unless var.include?('Rentals')
      end
    end
  end

  def list_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      else
        puts "Name: #{person.name}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    choice = gets.chomp.to_i

    if choice == 1
      create_student
    elsif choice == 2
      create_teacher
    else
      puts 'Your input is wrong!'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'
    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts 'Student added successfully!'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher added successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
  end

  def list_books_using_id
    @books.each_with_index do |book, index|
      text = "#{index}: "
      book.instance_variables.each do |var|
        value = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}: #{value} " unless var.to_s.include?('rentals') || var.to_s.include?('classroom')
      end
      puts text
    end
  end

  def list_people_using_id
    @people.each_with_index do |person, index|
      text = "#{index}: "
      person.instance_variables.each do |var|
        value = person.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}: #{value} " unless var.to_s.include?('rentals') || var.to_s.include?('classroom')
      end
      puts text
    end
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_books_using_id
    select_book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID):'
    list_people_using_id
    select_person = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    book = @books[select_book]
    person = @people[select_person]
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully!'
  end

  def list_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      person = rental.person
      person_id = person.id

      next unless person_id == id

      book = rental.book
      title = book.title
      author = book.author
      puts "Date: #{rental.date} Book: #{title} by Author: #{author} "
    end
  end
end
