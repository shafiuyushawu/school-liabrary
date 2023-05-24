require "../modules/student.rb"

describe Student do 
  before :each do 
    @student = Student.new(19, 'Nicholas', true)
  end

  it 'Should check if student is instantiated correctly' do 
    expect(@student).to be_instance_of(Student)
  end

  it 'Should check age exist in student' do 
    name = @student.name 
    expect(name).to  eq 'Nicholas' 
  end

  it 'Should check if student age exist' do 
    age = @student.age 
    expect(age).to  eq 19 
  end

  it 'Should check if student has parent permission' do 
    permission = @student.parent_permission 
    expect(permission).to  eq true
  end

  it 'Should check for student classroom' do 
    service = @student.play_hooky
    expect(service).to eq '¯\\(ツ)/¯'
  end
end
