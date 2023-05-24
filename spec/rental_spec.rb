require '../modules/rental'

describe Rental do
  before :each do
    @rental = Rental.new('24-05-2023', 0, 0)
  end

  it 'Should check the date of rented book' do
    rental = @rental.date
    expect(rental).to eq '24-05-2023'
  end

  it 'Should check the index of the book' do
    rental = @rental.book
    expect(rental).to eq 0
  end

  it 'Should check the index of the person who is renting the book' do
    rental = @rental.person
    expect(rental).to eq 0
  end
end
