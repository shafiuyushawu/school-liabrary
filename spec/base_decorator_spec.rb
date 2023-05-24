require '../modules/base_decorator'
require '../modules/person'

describe BaseDecorator do
  before :each do
    @person = Person.new(37, 'Nicholas')
  end

  it 'Should create a new instance of the BaseDecorator' do
    decorator = BaseDecorator.new(@person)
    expect(decorator).to be_instance_of(BaseDecorator)
  end
end
