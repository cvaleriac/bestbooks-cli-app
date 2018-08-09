require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

   def self.scrape_books
     doc = Nokogiri::HTML(open("https://www.mondadoristore.it/Best-Seller-libri/gr-308/"))
     doc.css(".product-info").each do |product|
          book = Book.new
          book.title = product.css("h3").text
          book.author = product.css(".title").text
     end
  end
end
