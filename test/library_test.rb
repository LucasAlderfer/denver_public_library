require './test/test_helper'
require './lib/library.rb'
require './lib/author.rb'

class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_library_has_books
    assert_equal 0, @dpl.books.length
    assert_instance_of Array, @dpl.books
  end

  def test_books_can_be_added_to_library
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_equal 0, @dpl.books.length
    @dpl.add_to_collection(jane_eyre)
    assert_equal 1, @dpl.books.length
    assert_equal jane_eyre, @dpl.books[0]
  end

  def test_collection_can_hold_many_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_to_collection(jane_eyre)
    @dpl.add_to_collection(mockingbird)
    @dpl.add_to_collection(villette)
    assert_equal 3, @dpl.books.length
    assert_equal jane_eyre, @dpl.books[0]
    assert_equal mockingbird, @dpl.books[1]
    assert_equal villette, @dpl.books[2]
  end

  def test_it_can_check_for_titles
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_to_collection(jane_eyre)
    @dpl.add_to_collection(mockingbird)
    @dpl.add_to_collection(villette)
    assert @dpl.include?("To Kill a Mockingbird")
    refute @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_library_has_card_catalogue
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_to_collection(jane_eyre)
    @dpl.add_to_collection(mockingbird)
    @dpl.add_to_collection(villette)
    assert_equal jane_eyre, @dpl.card_catalogue[0]
    assert_equal villette, @dpl.card_catalogue[1]
    assert_equal mockingbird, @dpl.card_catalogue[2]
  end

  def test_library_can_find_by_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_to_collection(jane_eyre)
    @dpl.add_to_collection(mockingbird)
    @dpl.add_to_collection(villette)
    collection = {"Jane Eyre" => jane_eyre, "Villette" => villette}
    assert_equal collection, @dpl.find_by_author("Charlotte Bronte")
  end

  def test_library_can_find_by_publication_date
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_to_collection(jane_eyre)
    @dpl.add_to_collection(mockingbird)
    @dpl.add_to_collection(villette)
    collection = {"To Kill a Mockingbird" => mockingbird}
    assert_equal collection, @dpl.find_by_publication_date("1960")
  end



end
