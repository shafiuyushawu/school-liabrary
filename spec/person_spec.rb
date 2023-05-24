require '../modules/person'

describe Person do
  before :each do 
    @person = Person.new(24, 'Shafiu')
  end

  it 'Should have an instance of the person created' do 
    expect(@person).to be_instance_of Person 
  end

  it 'Should have the name Shafiu' do 
    name = @person.name 
    expect(name).to eq 'Shafiu'
  end

  it 'should have the age 24' do 
    age = @person.age 
    expect(age).to eq 24
  end

  it 'Can use services' do 
    service = @person.can_use_service?
    expect(service).to be_truthy 
  end

  it 'Has no rentals' do 
    rentals = @person.rentals 
    expect(rentals).to eq []
  end

  it 'Cannot use serivces when user age is less than 18' do
    nicholas = Person.new(13, 'Nicholas')
    nicholas_service = nicholas.can_use_service? 
    expect(nicholas_service).to be_falsy
  end
end
