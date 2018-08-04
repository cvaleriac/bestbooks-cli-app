require 'open-uri'
require 'nokogiri'
require 'pry'

class Bestbooks::Scraper
   @@doc = Nokogiri::HTML(open("https://www.mondadoristore.it/Best-Seller-libri/gr-308/"))

   def self.scrape_books
    titles = @@doc.search("cla-title").text.split("\n").compact.reject { |i| i.empty? }.map { |i| i[0...-13] }

    authors = @@doc.search("secondary-data").text.split(" by ").reject { |i| i.empty?}

    urls = @@doc.css("link").map { |i| i['href'].split(";")[0] }

    descriptions = urls.map { |ind_url|
      url = ["https://www.mondadoristore.it",ind_url].join()
      Nokogiri::HTML(open(url)).css('div#product-descriptions').text.split("\n").compact.reject { |i| i.empty? }[0] }

    [*0..9].map! { |index|
      Bestbooks::Book.new(attributes = {title: titles[index], author: authors[index], url: urls[index], description: descriptions[index]}) }
  end

end
binding.pry
