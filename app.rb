require_relative 'modules/classroom'
require_relative 'modules/teacher'
require_relative 'modules/student'
require_relative 'modules/person'
require_relative 'modules/rental'
require_relative 'modules/book'

require_relative 'modules/book_mod'
require_relative 'modules/people_mod'
require_relative 'modules/Rental_mod'

require_relative 'modules/save_data'

class App
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  include BookMod
  include PeopleMod
  include RentalMod
end
