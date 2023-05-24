require '../modules/classroom.rb'

describe Classroom do 
  before :each do 
    @classroom = Classroom.new(18)
  end

  it 'should contain 18' do 
    class_num = @classroom.label 
    expect(class_num).to eq(18) 
  end
end
