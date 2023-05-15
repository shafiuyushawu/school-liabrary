require "./person"

class Teacher < Person
  def initialize(id, age, specialization, name: "Unknown")
    super(id, age, true, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
