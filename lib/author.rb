class Author
  attr_reader :books

  def initialize(author)
    @author_first_name = author[:first_name]
    @author_last_name = author[:last_name]
    @books = []
  end

  def add_book(title, publication_date)
    book_info = {
      author_first_name: @author_first_name,
      author_last_name: @author_last_name,
      title: title,
      publication_date: publication_date
    }
    new_book = Book.new(book_info)
    @books << new_book
    new_book
  end



end
