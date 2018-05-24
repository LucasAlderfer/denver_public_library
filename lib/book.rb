class Book
  attr_reader :info
  def initialize(info)
    @first_name = info[:author_first_name]
    @last_name = info[:author_last_name]
    @title = info[:title]
    @publication_date = info[:publication_date]
  end

  def author_first_name
    @first_name
  end

  def author_last_name
    @last_name
  end

  def title
    @title
  end

  def publication_date
    @publication_date.split.last
  end
end
