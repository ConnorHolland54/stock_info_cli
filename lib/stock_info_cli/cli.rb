require_relative 'api.rb'
require_relative 'stock.rb'

class CLI < API

    #method that behaves as entry point to cli
    def start
        puts "Welcome to Stock Info!"
        puts "Please enter a ticker symbol to see basic information about the stock."
        ticker = user_input
        get_info(ticker.upcase)

        #display stock info
        display_info(Stock.all.first)


        puts "What would you like to do next? Type 'ls' for a list of additional information regarding the current stock. Type 'new' to enter a new ticker symbol to search for or 'q' to quit."
        menu
    end

    def display_info(stock)
        # stock = Stock.all.first
        puts ""

        puts "-------------------"

        puts "Name: \n#{stock.short_name}"

        puts ""

        puts "Summary: \n#{stock.long_business_summary}"

        puts "-------------------"

        puts ""

    end

    def user_input
        gets.strip
    end

    def invalid
        puts "That is not a valid option, please choose again."
        menu
    end

    def exit_program
        puts "Have a great day!"
    end

    def search_again
        puts "Please enter a new ticker symbol."
        input = user_input
        get_info(input)
        display_info(Stock.all.first)
        puts "What would you like to do next? Type 'ls' for a list of additional information regarding the current stock. Type 'new' to enter a new ticker symbol to search for or 'q' to quit."
        menu
    end

    def menu
        selection = user_input
        if selection == "ls"
            #show list of additional data
        elsif selection == 'new'
            #search for a new symbol
            search_again
        elsif selection == 'q'
            #quit program
            exit_program
        else
            invalid
        end
    end
        



end