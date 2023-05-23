require_relative 'person'

class Teacher < Person
  attr_accessor :specialization
  def initialize(age, name, specialization)
    super(age, name)
    @id = Random.rand(1...1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
