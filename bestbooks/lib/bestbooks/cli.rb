class CLI

  def call
      puts "Welcome to Bestbooks!Your list of best sellers in Italian!"
      Scraper.scrape_books
      list_books
      menu
  end

    def list_books
      @books = Book.all
      puts "Best Sellers in Italian"
      @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} - #{book.author}"
    end
    end


    def menu
      puts "Type a number to learn more about a book, BACK to go back to the list, or type EXIT."
      input = gets.strip.downcase
      if input.to_i.between?(1, Book.all.count)
        book = @books[input.to_i-1]
        Scraper.scrape_details(book)
        puts book.description
      menu
    elsif input == "exit"
        exit_message
      elsif input == "back"
        list_books
        menu
      else
        puts "Please enter a number from 1 to 24"
        menu
      end
    end
       def exit_message
         puts "Thank you for using Bestbooks! Enjoy your readings!"
       end

end
