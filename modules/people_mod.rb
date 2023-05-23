module PeopleMod
  def list_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      else
        puts "Name: #{person.name}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    choice = gets.chomp.to_i

    if choice == 1
      create_student
    elsif choice == 2
      create_teacher
    else
      puts 'Your input is wrong!'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'
    student = Student.new(age, name, parent_permission)
    @people.push(student)
    puts 'Student added successfully!'
    SaveData.new.save_people(@people)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher added successfully!'
    SaveData.new.save_people(@people)

  end

  def list_people_using_id
    @people.each_with_index do |person, index|
      text = "#{index}: "
      person.instance_variables.each do |var|
        value = person.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}: #{value} " unless var.to_s.include?('rentals') || var.to_s.include?('classroom')
      end
      puts text
    end
  end
end
