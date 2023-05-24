require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission
  attr_writer :id
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
# student=Student.new(22,name:'shafiu', parent_permission: true)
