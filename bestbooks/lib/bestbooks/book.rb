class Book
  attr_accessor :title, :author, :description, :link

  @@books = []

  def initialize
    @@books<<self
  end

  def self.all
    @@books
  end
end
