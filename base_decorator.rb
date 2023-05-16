require_relative 'nameable'

class BaseDecorator < Nameable
  attr_accessor :nameable

  # rubocop:disable Lint/MissingSuper
  def initialize(nameable)
    @nameable = nameable
  end
  # rubocop:enable Lint/MissingSuper

  def correct_name
    @nameable.correct_name
  end
end
