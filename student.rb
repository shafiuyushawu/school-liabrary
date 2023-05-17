require_relative 'person'

class Student < Person
  def initialize(id, age, classroom, parent_permission: true, name: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @id = id
    self.classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students << self unless @classroom.students.include?(self)
  end
end
