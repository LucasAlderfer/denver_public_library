class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(name)
    @books.any? {|book| book.title == name }
  end

  def card_catalogue
    @books.sort_by! { |book| book.author_last_name }
  end

  def find_by_author(author)
    found = {}
    first_name = author.split[0]
    last_name = author.split[1]
    @books.each do |book|
      if book.author_first_name == first_name && book.author_last_name == last_name
        found[book.title] = book
      end
    end
    found
  end

  def find_by_publication_date(date)
    found = {}
    @books.each do |book|
      if book.publication_date == date
        found[book.title] = book
      end
    end
    found
  end

end
