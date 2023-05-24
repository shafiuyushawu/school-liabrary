require_relative 'person'

class Student < Person
  attr_reader :parent_permission
  attr_writer :id, :classroom

  def initialize(age, name, parent_permission, classroom: 'Unknown')
    super(age, name)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students << self unless @classroom.students.include?(self)
  end
end 
