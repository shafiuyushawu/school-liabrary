require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name: 'Unknown', classroom: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @id = Random.rand(1...100)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students << self unless @classroom.students.include?(self)
  end
end
