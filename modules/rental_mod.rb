module RentalMod
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
