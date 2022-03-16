require '../book'

describe Book do
  context 'Check if the instance is a class of Book' do
    book = Book.new('1984', 'George Orwell')

    it 'should have a class of Book' do
      expect(book.class) == Book
    end

    it 'should have the right title and author' do
      expect(book.title).to eq '1984'
      expect(book.author).to eq 'George Orwell'
    end
  end
end
