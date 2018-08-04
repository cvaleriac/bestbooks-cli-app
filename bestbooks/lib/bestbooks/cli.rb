class Bestbooks::cli

  def call
      puts "Welcome to Bestbooks!"
      list_books
      menu
    end

    def list_books
      @book = Bestbooks::Scraper
      puts "Best Sellers List"
      @book.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} - #{book.author}"
      end
    end

    def menu
      puts "Type a number to learn more about a book, LIST to go back to the list, or type EXIT."
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 11
        puts "#{@book[input.to_i-1].description}"
      menu
      elsif input == "exit"
        exit_message
      elsif input == "list"
        list_books
        menu
      else
        puts "Please enter a number from 1 to 10"
        menu
      end
    end

    def exit_message
      puts "Thanks for using Bestbooks!Enjoy your readings!"
    end
  end
