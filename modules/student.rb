require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, _parent_permission, classroom: 'Unknown')
    super(age, name)
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
# student=Student.new(22,name:'shafiu', parent_permission: true)
