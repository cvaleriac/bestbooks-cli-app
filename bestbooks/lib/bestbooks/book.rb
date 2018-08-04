class Book
  attr_accessor :title, :author, :description
  @@book_list = []

  def initialize(title, author, description)
    @title = title
    @author = author
    @description = description
    @@book_list << self
  end

  def self.all
    @@book_list
  end
end
