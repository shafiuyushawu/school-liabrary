require '../modules/book'

describe Book do
  before :each do
    @book = Book.new('Grief Child', 'Lawrence Darmani')
  end

  it 'Should have the title' do
    title = @book.title
    expect(title).to eq 'Grief Child'
  end

  it 'Should have the author' do
    author = @book.author
    expect(author).to eq 'Lawrence Darmani'
  end
end
