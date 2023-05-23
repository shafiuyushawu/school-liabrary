module BookMod
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

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
    SaveData.new.save_books(@books)
    puts 'Successfuly saved to Book.json!'
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
end
