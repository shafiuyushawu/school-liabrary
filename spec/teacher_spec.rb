require '../modules/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(51, 'Yushawu', 'IT')
  end

  it 'Should check the instantiation of teacher' do
    expect(@teacher).to be_instance_of(Teacher)
  end

  it 'Should check if name of teacher exist' do
    name = @teacher.name
    expect(name).to eq 'Yushawu'
  end

  it 'Should check if the age exist' do
    age = @teacher.age
    expect(age).to eq 51
  end

  it 'should check teachers specialization' do
    spec = @teacher.specialization
    expect(spec).to eq 'IT'
  end

  it 'Should check if teacher can use service' do
    service = @teacher.can_use_services?
    expect(service).to be_truthy
  end
end
