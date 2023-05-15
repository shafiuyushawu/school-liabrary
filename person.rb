class Person
  attr_reader :id, :name, :age

  def initialize(name = "Unknown", age, parent_permission:true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age 
    @age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age = age
  end

  def can_use_service?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end
end



