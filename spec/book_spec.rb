require '../book'

describe Book do
  context "Check if the instance is a class of Book" do

    book = Book.new('1984', 'George Orwell')

    it "should have a class of Book" do
      expect(book.instance_of?(Book)) == true
    end

    it "should have the right title and author" do
      expect(book.title) == "1984"
      expect(book.author) == "George Orwell"
    end
  end
end
