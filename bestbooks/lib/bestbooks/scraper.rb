require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

   def self.scrape_books

     doc = Nokogiri::HTML(open("https://www.mondadoristore.it/Best-Seller-libri/gr-308/"))
     doc.css(".product-info").each do |product|
          book = Book.new
          book.title = product.css(".h3.title").text
          book.author = product.css(".secondary-data").text.strip.split.join(" ").split("edito")[0]
          book.link = product.css(".link").attribute("href").value

    end

  end

    def self.scrape_details(book)
      doc = Nokogiri::HTML(open(book.link))
      book.description = doc.css(".product-descriptions").text.strip.split.join(" ").split("Dettagli")[0]
    end
end
