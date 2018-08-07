require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

   def self.scrape_books

   doc = Nokogiri::HTML(open("https://www.mondadoristore.it/Best-Seller-libri/gr-308/"))

      doc.css(".product-info").each do |product|
      title = product.css("h3").text
      author = product.css(".title").text
      #book.description = product-description.css(".text").text

    end
  end
  end
