require_relative 'modules/classroom'
require_relative 'modules/teacher'
require_relative 'modules/student'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/book'

require_relative 'modules/book_mod'
require_relative 'modules/people_mod'
require_relative 'modules/rental_mod'

require_relative 'modules/save_data'
require_relative 'modules/read_data'
require 'pry'
class App
  attr_accessor :books, :rentals, :people

  def initialize
    @books = ReadData.new.read_books
    @people = ReadData.new.read_people
    @rentals = ReadData.new.read_rentals(ReadData.new.read_books, ReadData.new.read_people)
  end



  include BookMod
  include PeopleMod
  include RentalMod
end
