class Book
  attr_accessor :title, :author, :description

  @@books = []

  def initialize
    @@books<<self
  end

  def self.all
    @@books
  end
end
