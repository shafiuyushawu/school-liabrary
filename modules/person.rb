require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # rubocop:disable Lint/MissingSuper
  def initialize(age, name)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end
  # rubocop:enable Lint/MissingSuper

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  def can_use_service?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
