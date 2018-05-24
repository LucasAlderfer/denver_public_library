require './test/test_helper'
require './lib/author.rb'
require './lib/book.rb'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_author_has_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_books_can_be_added
    @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_equal 1, @charlotte_bronte.books.length
    assert_instance_of Book, @charlotte_bronte.books[0]
  end

  def test_multiple_books_are_tracked
    @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    @charlotte_bronte.add_book("Villette", "1853")
    assert_equal 2, @charlotte_bronte.books.length
    assert_instance_of Book, @charlotte_bronte.books[1]
    assert_equal "Villette", @charlotte_bronte.books[1].title
    assert_equal '1853', @charlotte_bronte.books[1].publication_date
  end
end
